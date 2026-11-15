# Android Terminal VM

Android shared storage can't hold symlinks, so the `connect-device` workflow can't link this vault's AI files when the vault lives there and is used from the Android Terminal app's Debian VM (at `/mnt/shared/...`). `vault-mounts-hook.sh` provides the same files with bind mounts instead.

## What it does

| Appears at | From `99 System/AI/` | Replaces `connect-device`'s |
|---|---|---|
| `.agents/skills` | `SKILLS` | per-skill symlinks (OpenCode, Antigravity) |
| `.claude/skills` | `SKILLS` | per-skill symlinks (Claude Code) |
| `.opencode/agents` | `AGENTS` | per-agent symlinks |
| `.opencode/commands` | `COMMANDS` | per-command symlinks |
| `.opencode/opencode.json` | `SETTINGS/opencode.json` | root `opencode.json` |
| `.claude/CLAUDE.md` | `VAULT-MAP.md` | root `CLAUDE.md` (Claude Code) |
| `.agents/AGENTS.md` | `VAULT-MAP.md` | root `AGENTS.md` (Antigravity) |

There is no root `AGENTS.md`. OpenCode has no hidden location for it, so the script writes `.opencode/opencode.jsonc`, which loads `VAULT-MAP.md` through OpenCode's `instructions` setting. Other tools that read only a root `AGENTS.md` won't see the vault map in the VM.

Start Antigravity's `agy` at the vault root. Outside a git repository it treats its starting folder as the workspace, so from a subfolder it finds neither `.agents/AGENTS.md` nor the skills. Claude Code and OpenCode find them from any subfolder.

Everything sits inside hidden folders, which Obsidian Sync ignores. A few small placeholder files stay on shared storage: `{}` at `.opencode/opencode.json`, empty `.claude/CLAUDE.md` and `.agents/AGENTS.md`, and the generated `.opencode/opencode.jsonc`.

## Checking a device

`vault-mounts-status.sh` reports whether this device is connected, and the exact commands to fix it if not. It only reads, so it needs no root and is what the `connect-device` workflow has agents run:

```bash
bash "99 System/AI/PLATFORMS/android-vm/vault-mounts-status.sh" [vault-path]
```

| Status | Meaning |
|---|---|
| `OK` | The installed hook matches this vault's copy and every mount is in place. |
| `HOOK_MISSING` | Nothing in `/etc/vault-mounts.d/` is a copy of the hook. Install it (below). |
| `HOOK_OUTDATED` | The installed hook differs from this vault's copy. Reinstall it. |
| `NOT_MOUNTED` | The hook is current but mounts are missing or stale. Rerun it. |
| `NO_SERVICE` | `/etc/vault-mounts.d/` doesn't exist, so nothing runs hooks at boot. Set up such a service first (below). |

The commands it prints use `sudo` and are for you to run, not an agent.

## Installing

The script runs as root, after the vault is mounted inside the VM:

```bash
vault-mounts-hook.sh <vault-path> <user>
```

Install a copy outside the vault and run that; never have root run the copy in the vault, since anything that can write to shared storage could change it. For example, with a boot service that mounts vaults and runs each executable in `/etc/vault-mounts.d/` with those two arguments:

```bash
sudo install -d /etc/vault-mounts.d
sudo install -m 755 "<vault>/99 System/AI/PLATFORMS/android-vm/vault-mounts-hook.sh" /etc/vault-mounts.d/harness
```

Then run the installed copy once, so you don't have to wait for a reboot (the status check prints this command with your paths filled in):

```bash
sudo /etc/vault-mounts.d/harness <vault-path> "$USER"
```

One installed copy serves every vault, and vaults without `99 System/AI` are skipped. Reinstall after this script changes; the status check reports `HOOK_OUTDATED` until you do.

## Keeping it current

Folder mounts show new skills, agents, and commands immediately. A file mount keeps showing the old file if a save replaces `VAULT-MAP.md` or `opencode.json` with a new one instead of rewriting it; rerunning the script (or restarting the service that runs it) remounts them.
