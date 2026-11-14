# Workflow: Create OpenCode Agent

## 🎯 Purpose
To interview the user and generate specialized OpenCode AI agents (as Markdown files) tailored to the vault's specific purpose and requirements. This creates focused assistants with custom prompts, tools, and permissions in the `99 System/AI/AGENTS/` directory.

## 🛠️ Execution Steps

### 1. Context Gathering & Interview
- **Read Vault Context:** Read `99 System/AI/VAULT-PURPOSE.md` and `99 System/AI/ME.md` to understand the overarching goals, user preferences, and existing constraints.
- **Identify Need:** Ask the user what specific task or role the new agent needs to fulfill (e.g., "Code Reviewer", "Academic Researcher", "Creative Writing Assistant", "Data Analyst").
- **Gather Agent Details:** Ask probing questions to define the agent's properties:
    - **Name:** What should the agent be called? (This determines the filename, e.g., `researcher.md`).
    - **Description:** A short sentence describing what the agent does.
    - **Mode:** Should this be a `primary` agent (user-facing chat) or a `subagent` (invoked by other agents in the background)?
    - **System Prompt:** What are the specific instructions, tone, and behavioral guardrails for this agent?
    - **Permissions:** Does the agent need access to edit files, run shell commands, or fetch from the web? (By default, minimize permissions).

### 2. File Generation
- **Generate Agent File:** Create the agent definition file at `99 System/AI/AGENTS/[agent-name].md`.
- **Apply Formatting:** Use the OpenCode V2 markdown format with YAML frontmatter. `permissions` is an ordered list in which **the last matching rule wins**, so put broad rules before exceptions:
  ```markdown
  ---
  description: [Agent Description]
  mode: [primary or subagent]
  permissions:
    - action: edit
      resource: "*"
      effect: [allow/deny/ask]
    - action: shell
      resource: "*"
      effect: [allow/deny/ask]
    - action: webfetch
      resource: "*"
      effect: [allow/deny/ask]
  ---
  
  [System Prompt Content]
  ```
- Optional fields: `color` (six-digit hex, quoted, e.g. `"#ff6b6b"`) and `model` (`provider/model`).
- **Use V2 fields only:** `permissions` and `shell`, not the V1 `permission`, `bash`, `tools`, or `prompt`. The markdown body is the system prompt.

### 3. Verification & Feedback
- **Present Draft:** Show the generated `[agent-name].md` to the user for review.
- **Refine:** Make any requested adjustments based on their feedback.

## 🛑 Guardrails
- **Minimal Permissions:** Always default permissions (`edit`, `shell`, `webfetch`) to `deny` unless the user explicitly requests otherwise based on the agent's role.
- **Vault Alignment:** Ensure the agent's system prompt aligns with the rules and anti-patterns defined in `VAULT-PURPOSE.md`.
- **Markdown Extension:** Ensure the agent is saved as a `.md` file, as this is required by OpenCode.
