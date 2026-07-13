# Workflow: Update Identity & Context

## 🎯 Purpose
To systematically update the AI's understanding of the user's life, professional status, and goals to ensure the AI remains a relevant and empathetic Executive Assistant.

## 🛠️ Execution Steps

### 1. Audit & Interview
- **Read Current State:** Read `99 System/AI/ME.md` and `99 System/AI/GOALS.md`.
- **Identify Gaps:** Compare current context with recent journal entries or the user's stated needs.
- **Generic Interview:** Ask the user what has changed in their life/work since the last update to capture:
    - **Context Shifts:** Changes in role, projects, life stage, or primary focus areas.
    - **Goal Evolution:** New objectives, abandoned goals, or shifted priorities.

### 2. System Modification
- **Update `ME.md`:**
    - Revise the **Professional Profile**, **Inner Circle**, and **Core Values & Focus Areas** sections. Ensure it adheres to the structure in `99 System/AI/WORKFLOWS/examples/ME Example.md`.
    - Ensure the **Interaction Directives** are adjusted to match the new context based on the vault purpose.
- **Update `GOALS.md`:**
    - Archive completed goals.
    - Add new, actionable objectives derived from the interview, referencing `99 System/AI/WORKFLOWS/examples/GOALS Example.md`.
- **Audit `CHANGE/ME/LOG2026.md`:**
    - Log the date and a concise summary of the identity/system changes.

### 3. Structural Alignment
- **Structure Review:** Determine if the identity shift necessitates new Key Categories or index notes.
- **Linkage:** Ensure the updated identity notes link to the relevant central dashboards and Goals.

## 🛑 Guardrails
- **Preserve Core Identity:** Do not remove fundamental personality traits or long-term "Whys" unless explicitly requested.
- **Declarative Voice:** Update `ME.md` using declarative, fact-based language.
- **Audit Trail:** Never update `ME.md` without a corresponding entry in the change log.
