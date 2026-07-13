# Workflow: Update Vault Structure

## 🎯 Purpose
To review and adapt the vault's physical folder structure and root index notes as the vault's purpose (`VAULT-PURPOSE.md`) evolves over time. 

## 🛠️ Execution Steps

### 1. Context & Drift Analysis
- **Read Current State:** Read `99 System/AI/VAULT-PURPOSE.md` to understand the current goals and key categories.
- **Audit Existing Structure:** Scan the vault's root directories and index notes (e.g., Homepage, MOCs).
- **Identify Gaps:** Compare the physical folder structure against the current vault purpose. Are there new categories that lack folders? Are there legacy folders that are no longer used? Is the current structural paradigm (e.g., PARA, MOC) still serving the user's needs?

### 2. Interview & Proposal
- **Present Findings:** Briefly summarize to the user how the current folder structure aligns (or misaligns) with the current vault purpose.
- **Ask for Input:** Ask the user what structural pain points they are experiencing or what new categories need homes.
- **Propose Updates:** Present a Plan-Then-Execute table with proposed structural changes:
    - **[NEW]** Folders or Index notes to create.
    - **[MOVE/RENAME]** Existing folders or files that should be reorganized to fit the new paradigm.
    - **[ARCHIVE]** Legacy folders that should be moved to an Archive folder to reduce clutter.

### 3. Execution & Refinement
- Upon user approval of the plan, execute the folder creation, file moving, and renaming operations.
- **Iterative Polish:** Ensure that any links in `000 Homepage.md` or other central dashboards are updated to reflect the new structure. 

## 🛑 Guardrails
- **Safe Archiving:** Do not permanently delete user folders. If a folder is no longer needed, move it to `99 System/ARCHIVE/` or a user-defined Archive location.
- **Link Integrity:** When moving or renaming index files, ensure that you update inbound links if possible, or remind the user to rely on Obsidian's automatic link updating feature by performing the moves manually if the changes are massive.
