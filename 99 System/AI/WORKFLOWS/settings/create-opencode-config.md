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
    - **No `instructions` or `references` for context files.** `AGENTS.md` (→ `VAULT-MAP.md`) is the only always-loaded context. `VAULT-MAP.md` tells the agent when to read `ME.md`, `GOALS.md`, and `VAULT-PURPOSE.md`, and skills that need them read them, so they cost tokens only when used. (OpenCode `references` only accept folders, typically outside the project, so they can't point at these files.)
    - `agents`: An object keyed by the Vault Name extracted in Step 1 (e.g., `"<vault-name>": { "color": "#4f86f7" }`). The agent's prompt lives in `99 System/AI/AGENTS/<vault-name>.md`; this entry only adds settings such as `color` or `model`.
    - `permissions`: An ordered array of `{ "action", "resource", "effect" }` rules. **The last matching rule wins**, so list the default first and the exceptions after it:
        - `edit` on `*` → `deny` (Default deny everything).
        - `edit` → `allow` for each root content folder discovered in the `VAULT-MAP.md`, as `*<folder>/*`.
        - `edit` → `allow` for any central dashboards or index notes defined in the `VAULT-MAP.md`.
        - `edit` on `*99 System/AI/*` → `ask`.
        - `webfetch` on `*` → `deny`.
        - Start each path pattern with `*` so it matches however the path is written.
    - `formatter`: `false`
    - `lsp`: `{}`
    - **Use OpenCode V2 keys only:** `agents` and `permissions`, not the V1 `agent`, `permission`, or `tools`.

### 3. Plan-Then-Execute
- **Present Draft:** Show the generated JSON configuration to the user.
- **Execute:** Upon user approval, create the `opencode.json` file in the `SETTINGS/` directory.

## 🛑 Guardrails
- **Dynamic Derivation:** Do not hardcode any content folder names; all `allow` rules must be derived strictly from the `VAULT-MAP.md`.
- **Valid JSON:** Ensure the output is strictly valid JSON.
