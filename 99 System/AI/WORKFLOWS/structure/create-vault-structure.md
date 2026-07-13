# Workflow: Create Vault Structure

## 🎯 Purpose
To dynamically generate a structural organization for the vault based on the user's intent (`VAULT-PURPOSE.md`) rather than forcing a rigid structural paradigm on every vault. 

## 🛠️ Execution Steps

### 1. Context Gathering
- **Read Purpose:** Read `99 System/AI/VAULT-PURPOSE.md` to understand the vault's core mission, input streams, output goals, and key categories.

### 2. Propose Structural Paradigms
- Based on the vault's purpose, propose 2-3 suitable organizational structures to the user. Present the pros and cons of each as they relate to the user's goals.
- **Common Structural Paradigms to Suggest:**
    - **MOC (Map of Content):** A flat folder structure using Top-down Pillar notes and Bottom-up Maps of Content to navigate. Excellent for broad knowledge bases and research.
    - **PARA:** Four folders: Projects, Areas, Resources, Archives. Excellent for action-oriented, GTD, or business vaults.
    - **Linking Your Thinking (ACE):** Atlas, Calendar, Efforts folders. Great for balancing knowledge management with time-based execution.
    - **Zettelkasten:** Minimal folders, atomic notes, and heavy bidirectional linking. Excellent for academic research or creative writing.
    - **Numbered Topic Folders:** `01 Topic`, `02 Topic`, `03 Topic`... simple, hierarchical, and explicitly ordered folders. Excellent for straightforward categorization without complex linking strategies.
    - **Chronological/Journal:** Focused on daily/weekly/monthly periodic notes. Excellent for personal tracking, journaling, or meeting logs.

### 3. Interview & Finalize
- Ask the user which paradigm resonates with them, or if they prefer a hybrid/custom approach.
- Once a paradigm is selected, map the "Key Categories" from `VAULT-PURPOSE.md` into this structure.
- Present a Plan-Then-Execute table detailing the exact root folders (e.g., `01 Projects`, `02 Areas`) and root index notes (e.g., `000 Homepage.md`, `001 Knowledge MOC.md`) that will be created.

### 4. Execute Scaffolding
- Upon user approval, create the agreed-upon folders and index notes.
- Use `99 System/Templates/Map of Content.md` or other appropriate generic templates as a starting point for index notes, modifying them to fit the selected structure.

## 🛑 Guardrails
- **No Assumptions:** Do not assume the user wants MOCs or numbered folders unless they select that structure.
- **Idempotency:** Always check if a folder or file exists before attempting to create it.
