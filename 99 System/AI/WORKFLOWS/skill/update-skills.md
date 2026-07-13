# Workflow: Update AI Skills

## 🎯 Purpose
To review and adapt the vault's existing AI skills as the vault's purpose (`VAULT-PURPOSE.md`) evolves over time. This workflow allows the user to add new skills, refine existing ones, or deprecate skills that are no longer useful.

## 🛠️ Execution Steps

### 1. Context & Drift Analysis
- **Read Current State:** Read the current `99 System/AI/VAULT-PURPOSE.md` to understand the vault's present goals and workflows.
- **Audit Existing Skills:** Scan the `99 System/AI/SKILLS/` directory and review the descriptions of all currently installed skills.
- **Identify Gaps:** Compare the installed skills against the current vault purpose. Are there new goals that lack supporting skills? Are there legacy skills that no longer make sense?

### 2. Interview & Proposal
- **Present Findings:** Briefly summarize to the user what skills currently exist and how they align (or misalign) with the current vault purpose.
- **Ask for Input:** Ask the user what workflows they feel are currently missing or what existing skills aren't working well for them.
- **Propose Updates:** Based on the audit and the user's input, present a Plan-Then-Execute table with proposed changes:
    - **[NEW]** Skills to create from scratch (referencing `99 System/AI/WORKFLOWS/examples/Agent Skill.md`).
    - **[MODIFY]** Existing skills that need their instructions tweaked or expanded.
    - **[DEPRECATE]** Skills that should be removed to reduce clutter.

### 3. Execution & Refinement
- Upon user approval of the plan, execute the changes to the `SKILL.md` files.
- **Iterative Polish:** For newly created or significantly modified skills, ask the user to review the changes. Make adjustments based on their feedback.
- *(Optional)*: If the user wants to test a modified skill, prompt them to try using it in a real scenario and offer to tweak it further based on the results.

## 🛑 Guardrails
- **Preserve Manual Edits:** If an existing skill looks highly customized or has complex scripts, be very careful not to overwrite the core logic when making updates.
- **Log Changes:** If significant changes are made, remind the user to track these evolutions if they maintain a system changelog.
