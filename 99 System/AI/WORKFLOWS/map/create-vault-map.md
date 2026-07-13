# Workflow: Create Vault Map

## 🎯 Purpose
To generate the vault's primary AI instructions (`VAULT-MAP.md`) and the specific AI agent definition file (`<vault-name>.md`) based on the established `VAULT-PURPOSE.md` and the actual folder structure.

## 🛠️ Execution Steps

### 1. Gather Vault Context
- **Read Purpose:** Read `99 System/AI/VAULT-PURPOSE.md` to extract the Vault Name, mission, key categories, autonomy tiers, voice preferences, and anti-patterns.
- **Scan Structure:** Scan the root of the vault for existing content directories and root-level index notes (e.g., Homepage, Dashboards).

### 2. Generate `VAULT-MAP.md`
- Plan to generate the `VAULT-MAP.md` file at the root of the vault. Reference `99 System/AI/WORKFLOWS/examples/Vault Map Example.md` for structure and expected level of detail.
- **Structure to Generate:**
    - **Identity:** A generic AI assistant description, pointing to `99 System/AI/ME.md` and `99 System/AI/GOALS.md` for user context.
    - **Critical Constraints (Universal & Immutable):**
        - Never resolve Templater tags (e.g., `<% tp.file.title %>`).
        - Rely on Obsidian Linter for formatting.
        - Use edit tools, strictly avoiding shell/bash commands for file manipulation.
        - Prefer wikilinks over inline tags.
        - Enforce strict header nesting rules.
        - Require standard frontmatter on all notes.
        - Always use a template first when creating files; never create from scratch if a template exists.
    - **Vault Structure:** Document the folders and index notes found during the scan.
    - **Autonomy Tiers:** Populated from `VAULT-PURPOSE.md`.
    - **Voice & Proactive Nudges:** Populated from `VAULT-PURPOSE.md`.
    - **Workflow Rhythm:** Populated from the workflow inventory in `VAULT-PURPOSE.md`.

### 3. Generate Primary Agent Definition
- Plan to generate `99 System/AI/AGENTS/<vault-name>.md` (using the Vault Name extracted in Step 1, formatted in lowercase with hyphens if necessary).
- **Structure to Generate:**
    - Use the template located at `99 System/AI/WORKFLOWS/examples/Agent Definition.md` as the exact structure for the new agent.
    - Replace the placeholder `{vault-name}` with the actual vault name.

### 4. Plan-Then-Execute
- **Present Drafts:** Present the proposed `VAULT-MAP.md` and `<vault-name>.md` to the user for review.
- **Execute:** Upon approval, create the files.

## 🛑 Guardrails
- **Preserve Constraints:** The "Critical Constraints" section in `VAULT-MAP.md` is universal and must not be altered or omitted.
- **Dynamic Naming:** Ensure the agent file is named dynamically based on the vault name, not hardcoded to any previous names.
