# Workflow: Initialize Vault Structure & AI Symlinks

## 🎯 Purpose
To scaffold a new Obsidian vault with a standard folder structure and bootstrap it so that AI coding tools (OpenCode, Claude Code, Gemini CLI, Cursor, etc.) can discover the vault's skills, agents, commands, and agent configuration via symbolic links.

## 📋 Prerequisites
- You are operating from the **root** of the vault directory.
- This workflow is idempotent and safe to run multiple times.

## 🛠️ Execution Steps

### 1. Detect Vault State
- **Check for Purpose Document:** Check if `99 System/AI/VAULT-PURPOSE.md` exists.
    - If it *does not* exist, this is a **fresh vault**.
    - If it *does* exist, this is an **existing vault**.
- *Note:* Vault root folders (e.g., PARA, MOC, etc.) will be created later in the bootstrap sequence by the `create-vault-structure` workflow. This workflow only creates internal system folders.

### 2. Scaffold Internal System Structure
- Ensure the `99 System` directory has all necessary structural subdirectories, even if they are empty.
    ```bash
    mkdir -p "99 System/AI/CHANGE"
    mkdir -p "99 System/ARCHIVE"
    ```

### 2a. Check That Symlinks Work Here
- Steps 3–9 need symbolic links. Some places where vaults live can't create them, so test first:
    ```bash
    if ln -s "99 System" .init-symlink-probe 2>/dev/null; then
      rm .init-symlink-probe
      echo "symlinks: supported"
    else
      echo "symlinks: NOT supported"
    fi
    ```
- **If supported:** continue with Step 3.
- **If not supported:** skip Steps 3–9 and go to Step 10. **Do not copy files instead** (see Guardrails). Tell the user that this location can't hold symlinks, that their AI tools won't find the vault's skills, agents, commands, `AGENTS.md`, or `opencode.json` until the links are provided another way, and which case below seems to apply:
    - **Android shared storage** (e.g. the Android Terminal app's Linux VM, or Termux, working on a vault in `/storage/emulated/...` or `/mnt/shared/...`): Android's storage rejects all links. In the Android Terminal app's VM, `99 System/AI/PLATFORMS/android-vm/vault-mounts-hook.sh` provides them with bind mounts instead; point the user to the `README.md` beside it for installation (root required). In Termux, keep a local folder whose entries are symlinks into shared storage.
    - **Windows:** creating symlinks requires Developer Mode or an administrator shell. Enable one, then run this workflow again. In Git Bash, also set `MSYS=winsymlinks:nativestrict` so `ln -s` creates real links instead of copies.
    - **Anything else** (network drives, some cloud-sync folders, FAT/exFAT drives): move the vault to a local disk that supports symlinks, or provide the links from a system that can.

### 3. Create the `.agents/skills/`, `.opencode/agents/`, and `.opencode/commands/` Directories
- Create the hidden directory structures that AI tools scan for skill, agent, and command definitions:
    ```bash
    mkdir -p .agents/skills
    mkdir -p .opencode/agents
    mkdir -p .opencode/commands
    ```

### 4. Symlink All Skills into `.agents/skills/`
- Each skill folder inside `99 System/AI/SKILLS/` must be symlinked into `.agents/skills/` so tools can discover them. Because all skills are flat in this directory, a simple loop links them all:
    ```bash
    for skill in "99 System/AI/SKILLS"/*; do
      if [ -d "$skill" ]; then
        ln -sfn "../../$skill" ".agents/skills/$(basename "$skill")"
      fi
    done
    ```
- > **Idempotency note:** Always use `-n`. Without it, if the destination symlink already exists and points to a directory, `ln -f` follows the link and creates a *broken nested link inside the source folder* instead of replacing the symlink.
- > **Future skills:** If new skills are added under `99 System/AI/SKILLS/`, re-run this loop to symlink them.

### 5. Symlink All Custom Agents into `.opencode/agents/`
- Each agent definition file inside `99 System/AI/AGENTS/` must be symlinked into `.opencode/agents/` for discovery by OpenCode.
    ```bash
    for agent in "99 System/AI/AGENTS"/*.md; do
      if [ -f "$agent" ]; then
        ln -sfn "../../$agent" ".opencode/agents/$(basename "$agent")"
      fi
    done
    ```
- > **Future agents:** If new agents are added under `99 System/AI/AGENTS/`, re-run this loop to symlink them.

### 6. Symlink All Custom Commands into `.opencode/commands/`
- Each command definition file inside `99 System/AI/COMMANDS/` must be symlinked into `.opencode/commands/` so OpenCode exposes it as a slash command named after the file (e.g. `review.md` becomes `/review`). Skip this step if the vault has no `COMMANDS` folder.
    ```bash
    for command in "99 System/AI/COMMANDS"/*.md; do
      if [ -f "$command" ]; then
        ln -sfn "../../$command" ".opencode/commands/$(basename "$command")"
      fi
    done
    ```
- > **Future commands:** If new commands are added under `99 System/AI/COMMANDS/`, re-run this loop to symlink them.

### 7. Remove Stale Links
- If a skill, agent, or command was renamed or deleted under `99 System/AI/`, its old link is left dangling. Remove links whose target no longer exists:
    ```bash
    for link in .agents/skills/* .opencode/agents/* .opencode/commands/*; do
      if [ -L "$link" ] && [ ! -e "$link" ]; then
        rm "$link"
      fi
    done
    ```

### 8. Symlink `VAULT-MAP.md` → `AGENTS.md`
- The vault's agent configuration lives at `99 System/AI/VAULT-MAP.md` but AI tools expect an `AGENTS.md` file at the vault root. Create a symlink (not a copy) so edits to the source propagate automatically:
    ```bash
    ln -sfn "99 System/AI/VAULT-MAP.md" AGENTS.md
    ```

### 9. Symlink OpenCode Config & Cross-Tool Compatibility

- **OpenCode Configuration:**
  The vault's `opencode.json` configuration is stored in `99 System/AI/SETTINGS/`. Symlink it to the root:
    ```bash
    ln -sfn "99 System/AI/SETTINGS/opencode.json" opencode.json
    ```

- **Cross-Tool Compatibility:**
  Different AI coding assistants expect slightly different configurations. The `AGENTS.md` file serves as the universal minimum.
    - **Claude Code**: Reads `CLAUDE.md`. Create a symlink so both tools share the same source of truth:
        ```bash
        ln -sfn AGENTS.md CLAUDE.md
        ```
    - **Gemini CLI**: Reads `AGENTS.md` and `.agents/skills/` natively. No additional symlinks needed. MCP servers can be configured in `.gemini/settings.json`.
    - **Cursor / Zed / Codex**: All read `AGENTS.md` natively. Skill support varies per tool, but they all support standard MCP configurations.

### 10. Next Steps
- If this was a **fresh vault** (detected in Step 1), print a clear message instructing the user to run the `create-vault-purpose` workflow next.

## 🛑 Guardrails
- **Symlinks only — never copy.** The source of truth for all skills, agents, commands, and agent config lives under `99 System/AI/`. Symlinks ensure a single source of truth with no drift. If symlinks aren't supported (Step 2a), report it and stop linking; copies would silently go stale.
- **Always `ln -sfn`, never plain `ln -sf`.** The `-n` flag is what makes the symlink steps truly idempotent. Without it, re-running a loop against an existing symlink-to-directory nests a new broken link *inside* the source folder instead of replacing the link.
- **Idempotent Folders:** Use `mkdir -p` so that if folders already exist, the command simply succeeds without error.
- **Relative paths.** Always use relative symlink targets so the vault remains portable across machines.
- **Only remove dangling links.** Step 7 deletes a path only when it is a symlink whose target is missing; never delete real files or folders in these directories.
