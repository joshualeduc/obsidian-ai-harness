# Workflow: Update OpenCode Agent

## 🎯 Purpose
To systematically audit and modify an existing OpenCode AI agent based on evolving user needs or changes in the vault's purpose.

## 🛠️ Execution Steps

### 1. Audit & Selection
- **List Agents:** Read the list of existing agent files in `99 System/AI/AGENTS/`.
- **Select Agent:** Ask the user which agent they would like to update.
- **Review Current State:** Read the selected agent file (`99 System/AI/AGENTS/[agent-name].md`) to understand its current description, mode, permissions, and system prompt.

### 2. Interview & Modification
- **Identify Changes:** Ask the user what needs to change. Examples:
    - Does the agent need a new capability or tool permission (e.g., `bash: allow`)?
    - Is the tone incorrect?
    - Should the agent be converted from a `subagent` to a `primary` agent?
    - Are there new guardrails needed based on recent anti-patterns?
- **Update File:** Modify the `99 System/AI/AGENTS/[agent-name].md` file accordingly.
    - If permissions are changed, ensure they follow the YAML frontmatter structure:
      ```markdown
      ---
      description: [Agent Description]
      mode: [primary or subagent]
      permission:
        edit: [allow/deny/ask]
        bash: [allow/deny/ask]
        webfetch: [allow/deny/ask]
      ---
      ```

### 3. Verification & Change Logging
- **Present Draft:** Show the updated agent file to the user for final review.
- **Log Change:** Create an entry in `99 System/AI/CHANGE/AGENTS/LOG[YYYY].md` documenting:
    - Date of change
    - Agent updated
    - Summary of the changes made (e.g., "Granted bash permissions to researcher agent").

## 🛑 Guardrails
- **Minimal Privileges:** Be cautious when asked to expand permissions (especially `bash` and `edit`). Confirm the user understands the risks.
- **Format Integrity:** Ensure the markdown file retains its valid YAML frontmatter so OpenCode can parse it correctly.
