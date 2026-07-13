# Workflow: Update Vault Map

## 🎯 Purpose
To ensure that the primary agent instructions (`VAULT-MAP.md`) remain synchronized with the vault's actual structure and its defined purpose (`VAULT-PURPOSE.md`), updating them safely when changes occur.

## 🛠️ Execution Steps

### 1. Audit and Diff
- **Read Current State:** Read the existing `VAULT-MAP.md` at the vault root and `99 System/AI/VAULT-PURPOSE.md`.
- **Scan Structure:** Quickly scan the vault root for any new content folders or significant index notes that may have been added since the last sync.
- **Identify Drift:** Compare the contents. Look for:
    - New or removed folders or key categories in the vault structure not reflected in `VAULT-MAP.md`.
    - Changes to the Autonomy Tiers, Voice, or Proactive Nudges in `VAULT-PURPOSE.md` that are out of sync with `VAULT-MAP.md`.

### 2. Plan-Then-Execute
- **Present Plan:** If drift is detected, present a Plan-Then-Execute table showing exactly which sections of `VAULT-MAP.md` need to be updated and what the new content will be.
- **Execute:** Upon user approval, update `VAULT-MAP.md`. Ensure the structure remains consistent with `99 System/AI/WORKFLOWS/examples/Vault Map Example.md`.

## 🛑 Guardrails
- **Preserve Universal Constraints:** When updating `VAULT-MAP.md`, you must ensure that the Critical Constraints section (e.g., Never resolve Templater tags, Standard frontmatter requirement) is strictly preserved and untouched.
- **Agent Name Matching:** Ensure the `<vault-name>.md` agent file in `99 System/AI/AGENTS/` is also updated if the vault name or core behavioral references change.
