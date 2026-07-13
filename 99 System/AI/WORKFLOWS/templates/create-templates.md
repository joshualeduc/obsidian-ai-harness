# Workflow: Create Templates

## 🎯 Purpose
To dynamically generate necessary Obsidian templates for a specific vault, ensuring they are tailored to the vault's purpose (or generic enough to be universally applicable) rather than relying on hardcoded, legacy templates. 

## 🛠️ Execution Steps

### 1. Context Gathering
- **Read Purpose:** Read `99 System/AI/VAULT-PURPOSE.md` to establish the context, domains, and interaction style of the vault.

### 2. Identify Target Template
- **Determine Need:** 
    - If triggered by another workflow (like `create-vault-structure.md` needing a specific index note), identify the specific template requested.
    - If triggered manually by the user, ask them what kind of template they need (e.g., Daily Journal, Research Note, Meeting Summary, Project Dashboard).
- **Gather Requirements:** Ask the user what key sections or metadata this template should contain.

### 3. Generate Template
- **Draft Template:** Construct the template content.
    - **Frontmatter:** Include standard YAML frontmatter (e.g., `aliases`, `tags`, `creation_date`).
    - **Templater Tags:** Use standard Templater tags correctly (e.g., `<% tp.file.title %>`, `<% tp.date.now("YYYY-MM-DD") %>`). **CRITICAL:** Do not attempt to resolve these tags during creation; they must remain literal for Obsidian to parse later.
    - **Structure:** Use markdown headers, bolding, and callouts to create a clean, organized structure.
    - **Generic Language:** Ensure no overly specific or legacy "personal growth" language is included unless explicitly requested by the user for their specific vault type.

### 4. Plan-Then-Execute
- **Present Draft:** Show the proposed template content to the user for review.
- **Execute:** Upon user approval, write the template file to the `99 System/Templates/` directory with a clear `.md` filename (e.g., `99 System/Templates/Index Note.md`).

## 🛑 Guardrails
- **Templater Tag Immutability:** Never resolve or strip `<% %>` tags.
- **Standard Formatting:** Adhere to standard Obsidian formatting rules (wikilinks, nesting rules).
