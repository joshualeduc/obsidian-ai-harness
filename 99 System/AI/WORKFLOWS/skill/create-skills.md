# Workflow: Create AI Skills

## 🎯 Purpose
To dynamically generate a set of highly tailored AI skills for the vault based on its specific purpose, rather than forcing generic skills to fit. This ensures the AI agent is equipped with exactly the tools it needs to support the user's goals.

## 🛠️ Execution Steps

### 1. Context Gathering
- **Read Purpose:** Read `99 System/AI/VAULT-PURPOSE.md` to deeply understand the vault type (e.g., personal growth, research, D&D campaign, business), its input/output patterns, and the desired AI interaction style.
- **Read Skill Template:** Review `99 System/AI/WORKFLOWS/examples/Agent Skill.md` to understand the required structure for generating a new skill.

### 2. Propose Skill Roster
- Based on the `VAULT-PURPOSE.md`, brainstorm 3-5 high-value AI skills that would accelerate the user's specific goals. 
- *Examples based on vault type:*
    - **D&D Vault:** `npc-creator` (to flesh out characters), `session-logger` (to summarize session notes).
    - **Research Vault:** `literature-reviewer` (to synthesize papers), `citation-manager`.
    - **Journal Vault:** `journal-interviewer` (to prompt for reflection), `weekly-harvest` (to extract insights).
    - **Project Vault:** `blocker-unblocker`, `sprint-planner`.
- **Always Include:** Propose at least one universal maintenance skill (e.g., `vault-health` or `inbox-triage`) if it makes sense for their workflow.
- **Present Proposal:** Show the proposed roster to the user in a Plan-Then-Execute table. Include a brief description of what each skill will do. Ask the user if they want to add, remove, or modify any of the proposed skills.

### 3. Generate Skills
- Once the user approves the roster, generate the `SKILL.md` file for each approved skill inside `99 System/AI/SKILLS/[skill-name]/`.
- **Drafting Guidelines:**
    - Use `99 System/AI/WORKFLOWS/examples/Agent Skill.md` as the structural template.
    - Write clear, imperative instructions. Explain *why* the AI should take certain actions to ensure it understands the underlying intent.
    - Tailor the trigger conditions heavily to the vault's context. 
    - Keep it lean: only include instructions that pull their weight.

### 4. Review and Refine
- Present the generated skills to the user (e.g., "I have created the initial drafts for your skills.").
- If the user has specific workflows or edge cases they want to handle, incorporate their feedback iteratively. Refine the skills until the user is satisfied.
- *(Inspiration from skill-creator)*: If a skill involves complex data manipulation or specific output formats, consider asking the user for a test prompt to verify the skill behaves as expected before finalizing.

## 🛑 Guardrails
- **No Pre-packaged Assumptions:** Do not assume the vault needs standard skills like a journal interviewer unless the `VAULT-PURPOSE.md` explicitly points to it.
- **Structural Integrity:** Ensure all generated skills retain correct markdown structure and follow the provided template so they can be parsed correctly by the AI coding assistant.
