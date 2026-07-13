# Workflow: Master Bootstrap Orchestrator

## 🎯 Purpose
To act as the single entry point for setting up a completely new Obsidian vault harness. When a user copies `99 System/` into a new vault and asks the AI to "set up my vault," this workflow orchestrates the entire sequence.

## 🛠️ Execution Sequence

Execute the following workflows in exact order. **Crucially, this sequence is idempotent.** Before running each step, check if its primary output already exists. If it does, skip the step and move to the next one. This allows the user to resume the bootstrap process if interrupted.

### 1. `init`
- **Check:** Do the internal system folders (e.g., `99 System/AI/CHANGE/`) and symlinks exist?
- **Action:** Run the `init.md` workflow to create symlinks and the folder scaffold.

### 2. `create-vault-purpose`
- **Check:** Does `99 System/AI/VAULT-PURPOSE.md` exist?
- **Action:** Run the `create-vault-purpose.md` workflow to interview the user and generate the purpose document.

### 3. `create-me`
- **Check:** Do `99 System/AI/ME.md` and `GOALS.md` exist?
- **Action:** Run the `create-me.md` workflow to gather user context.

### 4. `create-vault-structure`
- **Check:** Does `000 Homepage.md` or any structural root folders exist?
- **Action:** Run the `create-vault-structure.md` workflow to propose and generate the vault dashboard and structural navigation based on the vault's purpose.

### 5. `create-vault-map`
- **Check:** Does `VAULT-MAP.md` exist?
- **Action:** Run the `create-vault-map.md` workflow to generate the agent instructions.

### 6. `create-templates`
- **Check:** Review the active workflows and vault structure to determine if specific templates are missing (since templates are no longer copied by default).
- **Action:** Run the `create-templates.md` workflow to dynamically generate any necessary templates for the vault.

### 7. `create-skills`
- **Check:** Are there skills present in `99 System/AI/SKILLS/`?
- **Action:** Run the `create-skills.md` workflow to dynamically generate AI skills tailored to the specific vault purpose.

## 🧩 Optional Modules: Tool Configuration

### `create-opencode-config`
- **Check:** Does `99 System/AI/SETTINGS/opencode.json` exist?
- **Action:** If the user intends to use OpenCode as their AI assistant, run `settings/create-opencode-config.md` to generate the strict permission configuration.

### `create-opencode-agent`
- **Check:** Are there OpenCode agents defined in `99 System/AI/AGENTS/`?
- **Action:** If the vault is being used with OpenCode, ask the user if they'd like to run `agent/create-opencode-agent.md` to bootstrap custom, purpose-built OpenCode AI agents.

## 🏁 Final Summary
- Once all steps are complete (or successfully skipped), print a comprehensive summary of:
    - What was created (Folders, Agent Name, config files).
    - What the vault's identified purpose is.
    - What the user should do next to start using their new harness.
