# Workflow: Initialize Vault Structure & AI Symlinks

## 🎯 Purpose
To scaffold a new Obsidian vault with a standard folder structure and bootstrap it so that AI coding tools (OpenCode, Claude Code, Gemini CLI, Cursor, etc.) can discover the vault's skills and agent configuration via symbolic links.

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

### 3. Create the `.agents/skills/` Directory
- Create the hidden directory structure that AI tools scan for skill definitions:
    ```bash
    mkdir -p .agents/skills
    ```

### 4. Symlink All Skills into `.agents/skills/`
- Each skill folder inside `99 System/AI/SKILLS/` must be symlinked into `.agents/skills/` so tools can discover them. Because all skills are now flat in this directory, we can use a simple script to link them all:
    ```bash
    for skill in "99 System/AI/SKILLS"/*; do
      if [ -d "$skill" ]; then
        ln -sf "../../$skill" ".agents/skills/$(basename "$skill")"
      fi
    done
    ```
- > **Future skills:** If new skills are added under `99 System/AI/SKILLS/`, re-run this loop to symlink them.

### 5. Symlink `VAULT-MAP.md` → `AGENTS.md`
- The vault's agent configuration lives at `99 System/AI/VAULT-MAP.md` but AI tools expect an `AGENTS.md` file at the repository root. Create a symlink (not a copy) so edits to the source propagate automatically:
    ```bash
    ln -sf "99 System/AI/VAULT-MAP.md" AGENTS.md
    ```

### 6. Symlink Agent Definitions & Cross-Tool Compatibility

- **OpenCode Configuration:**
  The vault's `opencode.json` configuration is stored in `99 System/AI/SETTINGS/`. Symlink it to the root:
    ```bash
    ln -sf "99 System/AI/SETTINGS/opencode.json" opencode.json
    ```

- **Cross-Tool Compatibility:**
  Different AI coding assistants expect slightly different configurations. The `AGENTS.md` file serves as the universal minimum.
    - **Claude Code**: Reads `CLAUDE.md`. Create a symlink so both tools share the same source of truth:
        ```bash
        ln -sf AGENTS.md CLAUDE.md
        ```
    - **Gemini CLI**: Reads `AGENTS.md` and `.agents/skills/` natively. No additional symlinks needed. MCP servers can be configured in `.gemini/settings.json`.
    - **Cursor / Zed / Codex**: All read `AGENTS.md` natively. Skill support varies per tool, but they all support standard MCP configurations.

### 7. Next Steps
- If this was a **fresh vault** (detected in Step 1), print a clear message instructing the user to run the `create-vault-purpose` workflow next.

## 🛑 Guardrails
- **Symlinks only — never copy.** The source of truth for all skills and agent config lives under `99 System/AI/`. Symlinks ensure a single source of truth with no drift.
- **Idempotent Folders:** Use `mkdir -p` so that if folders already exist, the command simply succeeds without error.
- **Relative paths.** Always use relative symlink targets so the vault remains portable across machines.
