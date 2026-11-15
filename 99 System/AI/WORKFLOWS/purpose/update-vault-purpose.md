# Workflow: Update Vault Purpose

## 🎯 Purpose
To revisit and update an existing `VAULT-PURPOSE.md` to reflect shifts in the user's focus, domains, or AI preferences without rerunning `create-harness` from scratch.

## 🛠️ Execution Steps

### 1. Audit Current Purpose
- **Read Current State:** Read `99 System/AI/VAULT-PURPOSE.md`.
- **Display Summary:** Provide a concise summary of the current vault mission, core domains, and AI governance model to the user.

### 2. Identify Changes
- **Ask User:** Ask the user what has changed regarding the vault. Example prompts:
    - Have there been any new domains added or old ones deprecated?
    - Have priorities or the core mission shifted?
    - Do you want the AI to behave differently (e.g., more autonomous, different voice)?
    - Are there any new anti-patterns to add?

### 3. Plan-Then-Execute
- **Present Plan:** Present a table of proposed changes to `VAULT-PURPOSE.md` based on their feedback.
- **Execute:** Upon user approval, update `99 System/AI/VAULT-PURPOSE.md`. Ensure the updated file still adheres to the structure shown in `99 System/AI/WORKFLOWS/examples/Vault Purpose Example.md`.

### 4. Initialize/Update Change Log
- **Create Subdirectory:** Ensure the directory `99 System/AI/CHANGE/VAULT-PURPOSE` exists.
- **Log Entry:** Append a log entry to `99 System/AI/CHANGE/VAULT-PURPOSE/LOG[YYYY].md` (using the current year) with today's date and a concise summary of the changes made.

## 🛑 Guardrails
- **Maintain Structure:** Ensure the fundamental structure of `VAULT-PURPOSE.md` (Mission, Core Domains, Governance, etc.) remains intact during the update.
- **Log Everything:** Never update the vault purpose without logging the change.
