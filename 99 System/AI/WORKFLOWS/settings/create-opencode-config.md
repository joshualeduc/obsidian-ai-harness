# Workflow: Create OpenCode Configuration

## 🎯 Purpose
To generate `opencode.json` configuration for the OpenCode AI tool that strictly enforces the vault's permissions based on its actual folder structure and the user's defined autonomy preferences.

## 🛠️ Execution Steps

### 1. Scan and Extract
- **Structure Scan:** Read `99 System/AI/VAULT-MAP.md` to identify the vault's active root-level content folders and key index notes.
- **Read Purpose:** Read `99 System/AI/VAULT-PURPOSE.md` to extract:
    - Autonomy preferences.
    - The Vault Name (to determine the specific agent to invoke).

### 2. Generate Configuration
- Plan to generate `99 System/AI/SETTINGS/opencode.json`.
- **Configuration Structure:** (Reference `99 System/AI/WORKFLOWS/examples/OpenCode Config Example.json` for exact schema)
    - `instructions`: Array pointing to `99 System/AI/VAULT-PURPOSE.md`.
    - `references`: Array including `99 System/AI/ME.md` and `99 System/AI/GOALS.md`.
    - `agent`: Use the Vault Name extracted in Step 1 (e.g., `<vault-name>`).
    - `permission.edit` Rules:
        - `*` → `deny` (Default deny everything).
        - Add an `allow` rule for each root content folder discovered in the `VAULT-MAP.md`.
        - `*99 System/AI/*` → `ask`
        - Add an `allow` rule for any central dashboards or index notes defined in the `VAULT-MAP.md`.
    - `formatter`: `false`
    - `lsp`: `{}`
    - Standard deny rules for code-oriented tools: `batch`, `fetch`, `todiff`.

### 3. Plan-Then-Execute
- **Present Draft:** Show the generated JSON configuration to the user.
- **Execute:** Upon user approval, create the `opencode.json` file in the `SETTINGS/` directory.

## 🛑 Guardrails
- **Dynamic Derivation:** Do not hardcode any content folder names; all `allow` rules must be derived strictly from the `VAULT-MAP.md`.
- **Valid JSON:** Ensure the output is strictly valid JSON.
