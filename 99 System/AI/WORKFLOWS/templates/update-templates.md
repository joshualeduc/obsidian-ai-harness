# Workflow: Update Templates

## 🎯 Purpose
To systematically audit and modify existing Obsidian templates based on evolving user needs, ensuring they remain relevant without breaking essential Templater functionalities.

## 🛠️ Execution Steps

### 1. Audit & Selection
- **List Templates:** Read the list of existing templates in `99 System/Templates/`.
- **Select Template:** Ask the user which template they would like to update.
- **Review Current State:** Read the selected template file to understand its current structure, frontmatter, and Templater tags.

### 2. Interview & Modification
- **Identify Changes:** Ask the user what needs to change in the template. Examples:
    - Adding or removing a metadata field in the YAML frontmatter.
    - Modifying the section headers.
    - Updating or inserting a new Templater script.
- **Update File:** Modify the template file accordingly.
    - **CRITICAL:** Ensure that all Templater tags (like `<% tp.file.title %>`) are kept completely literal. Do not parse or resolve them during the update.
    - Ensure standard Obsidian formatting rules (wikilinks, nesting rules) are adhered to.

### 3. Verification & Change Logging
- **Present Draft:** Show the updated template file to the user for final review.
- **Log Change:** Create an entry in `99 System/AI/CHANGE/TEMPLATES/LOG[YYYY].md` documenting:
    - Date of change
    - Template updated
    - Summary of the changes made.

## 🛑 Guardrails
- **Templater Tag Immutability:** Never resolve or strip `<% %>` tags when updating a template file.
- **Structural Integrity:** Ensure that changes do not break existing vault structure conventions unless explicitly requested by the user.
