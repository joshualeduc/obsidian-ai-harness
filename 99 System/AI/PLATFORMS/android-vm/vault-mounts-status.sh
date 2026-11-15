#!/bin/bash
# 99 System/AI/PLATFORMS/android-vm/vault-mounts-status.sh
#
# Read-only check of whether vault-mounts-hook.sh has connected this vault's
# AI files on this device (Android Terminal app's Debian VM). Needs no root
# and changes nothing, so an agent can run it safely:
#
#   bash vault-mounts-status.sh [vault-path]      (default: current folder)
#
# It prints one status line, then the exact next step:
#   OK              hook installed and current, every mount in place
#   NO_SERVICE      no /etc/vault-mounts.d/, so nothing runs hooks at boot
#   HOOK_MISSING    no installed copy of vault-mounts-hook.sh
#   HOOK_OUTDATED   the installed hook differs from this vault's copy
#   NOT_MOUNTED     hook current, but some mounts are missing or stale
# Exit status is 0 only for OK.
#
# Commands it prints use sudo; they are for the user to run, not an agent.
# VAULT_MOUNTS_HOOK_DIR overrides /etc/vault-mounts.d (for testing).

set -uo pipefail

VAULT="$(cd -- "${1:-.}" 2>/dev/null && pwd)" || { echo "usage: vault-mounts-status.sh [vault-path]" >&2; exit 2; }
AI="$VAULT/99 System/AI"
HOOK_SRC="$AI/PLATFORMS/android-vm/vault-mounts-hook.sh"
HOOK_DIR="${VAULT_MOUNTS_HOOK_DIR:-/etc/vault-mounts.d}"

if [ ! -f "$HOOK_SRC" ]; then
    echo "usage: $VAULT has no $HOOK_SRC; run this from a harness vault's root." >&2
    exit 2
fi

# q ARG: single-quote ARG for a copy-pasteable shell command.
q() { printf "'%s'" "${1//\'/\'\\\'\'}"; }

run_hook_cmd() { echo "  sudo $(q "$1") $(q "$VAULT") $(q "$(id -un)")"; }

if [ ! -d "$HOOK_DIR" ]; then
    echo "NO_SERVICE"
    echo "Nothing on this device runs vault hooks: $HOOK_DIR doesn't exist."
    echo "Install a boot service that bind-mounts vaults and then runs each"
    echo "executable in $HOOK_DIR as '<hook> <vault-path> <user>'; see the"
    echo "README.md beside this script. Then run this check again."
    exit 1
fi

# Find the installed hook: an exact copy first, else any older version of it.
installed="" outdated=""
for f in "$HOOK_DIR"/*; do
    [ -f "$f" ] || continue
    if cmp -s -- "$f" "$HOOK_SRC"; then
        installed="$f"
        break
    elif [ -z "$outdated" ] && grep -q 'vault-mounts-hook.sh' -- "$f" 2>/dev/null; then
        outdated="$f"
    fi
done

if [ -z "$installed" ]; then
    target="${outdated:-$HOOK_DIR/harness}"
    if [ -n "$outdated" ]; then
        echo "HOOK_OUTDATED"
        echo "$outdated differs from this vault's copy of the hook."
        echo "Read the vault's copy, then have the user reinstall and run it:"
    else
        echo "HOOK_MISSING"
        echo "The hook isn't installed in $HOOK_DIR."
        echo "Read the vault's copy (it will run as root at every boot), then have the user install and run it:"
    fi
    echo "  sudo install -m 755 $(q "$HOOK_SRC") $(q "$target")"
    run_hook_cmd "$target"
    echo "Then run this check again."
    exit 1
fi

is_mounted() { findmnt -rn --mountpoint "$1" >/dev/null 2>&1; }
same_file() { [ "$(stat -c '%d:%i' -- "$1" 2>/dev/null)" = "$(stat -c '%d:%i' -- "$2" 2>/dev/null)" ]; }

# Mirror the hook: each source that exists should be mounted at its target.
problems=()
check() {
    local src="$AI/$1" dest="$VAULT/$2"
    [ -e "$src" ] || return 0
    if ! is_mounted "$dest"; then
        problems+=("$2 is not mounted")
    elif ! same_file "$src" "$dest"; then
        problems+=("$2 shows an old copy of $1")
    fi
}
check SKILLS .agents/skills
check SKILLS .claude/skills
check AGENTS .opencode/agents
check COMMANDS .opencode/commands
check SETTINGS/opencode.json .opencode/opencode.json
check VAULT-MAP.md .claude/CLAUDE.md
check VAULT-MAP.md .agents/AGENTS.md
if [ -f "$AI/VAULT-MAP.md" ] && [ ! -f "$VAULT/.opencode/opencode.jsonc" ]; then
    problems+=(".opencode/opencode.jsonc is missing")
fi

if [ "${#problems[@]}" -gt 0 ]; then
    echo "NOT_MOUNTED"
    printf '  - %s\n' "${problems[@]}"
    echo "The hook ($installed) is current. Have the user rerun it:"
    run_hook_cmd "$installed"
    echo "If that doesn't fix it, check its boot log: journalctl -b | grep -i vault"
    exit 1
fi

echo "OK"
echo "This device is connected: $installed is current and every mount is in place."
