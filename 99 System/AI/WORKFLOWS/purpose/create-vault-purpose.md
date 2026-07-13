# Workflow: Create Vault Purpose

## 🎯 Purpose
To interview the user and determine the fundamental purpose, structure, and constraints of their new Obsidian vault. This workflow generates the `VAULT-PURPOSE.md` file, which acts as the single source of truth for generating the rest of the AI harness.

## 🛠️ Execution Steps

### 1. Initial Interview
- **Introduce the System:** Briefly explain that you need to learn about what the user wants to accomplish with this vault to set up the correct folder structures, agents, and templates.
- **Conduct Interview:** Ask probing but conversational questions to capture the following:
    - **Vault Name:** What is the name of this vault? (This will be used to name the primary AI agent).
    - **Vault Type:** What is this vault for? (e.g., Personal growth, research, business, creative writing, project management).
    - **Core Mission:** In one sentence, what should this vault help you accomplish?
    - **Input Streams:** Where does information enter the vault? (e.g., Daily journals, meeting notes, web clippings).
    - **Output Goals:** What do you want to produce from this vault? (e.g., Blog posts, project plans, personal insights).
    - **Key Categories:** What are the 3-7 major categories or areas of focus for your vault?
    - **AI Interaction Style:** How do you want the AI to behave? (e.g., Warm and personal, efficient and terse, Socratic and questioning).
    - **Autonomy Preferences:** How much should the AI do without asking? (e.g., Routine tasks vs. Structural changes).
    - **Anti-patterns:** Are there things the AI should never do? (e.g., "Never delete my journal entries").

### 2. File Generation
- **Create `VAULT-PURPOSE.md`:**
    - Use the gathered information to construct `99 System/AI/VAULT-PURPOSE.md`.
    - Reference the template at `99 System/AI/WORKFLOWS/examples/Vault Purpose Example.md` for the exact structure and expected level of detail.
    - **Required Sections:**
        - **Mission & Philosophy:** Synthesized from Vault Type, Core Mission, Input Streams, and Output Goals.
        - **Key Categories:** A table or list derived from the identified areas of focus.
        - **AI Governance Model:** Detailing the AI Interaction Style, Voice, and Autonomy Preferences.
        - **Anti-Patterns:** List the anti-patterns provided by the user.
        - **Writing Voice Rules:** Context-dependent rules based on the vault type.
        - **Workflow Inventory:** A placeholder section for workflows to be populated later.

### 3. Verification & Feedback
- **Present Draft:** Show the generated `VAULT-PURPOSE.md` to the user using a Plan-Then-Execute table.
- **Refine:** Make any requested adjustments based on their feedback before finalizing the file.
- **Next Step:** Instruct the user to run the next workflow in the sequence (usually `create-vault-structure`).

## 🛑 Guardrails
- **No Assumptions:** Do not infer or invent details about the user's workflow. Only record what is explicitly shared.
- **Generic Structure:** Ensure the output `VAULT-PURPOSE.md` follows a consistent, generic structure that works for any vault type, strictly avoiding hardcoded personal-growth concepts.
