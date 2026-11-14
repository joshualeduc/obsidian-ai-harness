# Universal Obsidian AI Harness

Welcome to the **Universal Obsidian AI Harness**. This project is a generic, dynamic vault bootstrapping system designed to turn any standard Obsidian vault into a powerful, AI-driven workspace. 

Rather than relying on hardcoded logic for a specific type of vault (e.g., personal growth, research, or business), this harness uses an intelligent interview process to dynamically generate its own configurations, agents, and templates based on your unique needs.

## 🚀 How to Use It

To bootstrap a new Obsidian vault:

1. **Copy the Core System:** Copy the entire `99 System/` folder from this repository into the root of your new, empty Obsidian vault.
2. **Initialize the AI Tool:** Open your AI coding assistant (like OpenCode, Gemini, or Claude Code) in the root of the new vault.
3. **Run Bootstrap:** Prompt your AI with a command like:
   > *"Set up my vault using the `bootstrap` workflow."*
4. **Follow the Prompts:** The AI will execute a sequence of idempotent workflows to structure your folders, interview you to create `VAULT-PURPOSE.md`, dynamically build necessary templates, generate your primary vault agent, and customize all AI skills.
5. **Repairing & Syncing:** If you ever migrate your vault to a new device (e.g., via Obsidian Sync) and find that your AI tools cannot discover your skills, simply ask your AI to run the `init` workflow again. It will safely regenerate all required symlinks without overwriting your data.
6. **Platforms Without Symlinks:** Android shared storage (including the Android Terminal app's Linux VM and Termux) can't hold symlinks at all, and Windows needs Developer Mode or an administrator shell to create them. `init` tests for this first. If links aren't possible, it stops and explains the alternatives instead of copying files, so `99 System/AI/` stays the single source of truth.

## 🧠 Core Philosophy & Requirements

Rather than forcing a specific methodology, the harness relies on a dynamic generation process:

1. **Dynamic Structure Generation:** The system does not assume you use a specific folder convention (like PARA, Zettelkasten, or MOCs). Instead, the `bootstrap` workflow will interview you, propose multiple architectural options, and scaffold them for you (or adapt to your existing structure).
2. **Idempotency (Safe for Existing Vaults):** The workflow scripts check for existing files before making changes. This means you can drop `99 System/` into an already established vault, and the harness will map and layer itself over your existing setup without destructively overriding your data.
3. **Single Source of Truth:** The system relies heavily on `99 System/AI/VAULT-PURPOSE.md`. Once generated via interview, this document dictates all downstream template generation, agent rules, and skill creation.
4. **Tool Agnosticism:** While the setup uses standard markdown and scripts, it requires an AI agent capable of reading local directories, parsing workflows, and creating symbolic links (such as OpenCode, Gemini, or Claude Code). The vault must be on storage that supports symbolic links; see step 6 of How to Use It for platforms that don't.
## ⚙️ Manual Configuration (Pre-Flight Checklist)

Before you begin the bootstrap interview process in a new vault, ensure you have completed the following manual steps:

1. **Install Obsidian Plugins:** Ensure you have your preferred Obsidian plugins installed, particularly **Templater** and **Linter**, as the AI relies on these for standard formatting and metadata generation.
2. **Configure AI Access:** Make sure your AI assistant is configured to read the root directory of the new vault. 
3. **Prepare Your AI Tool:** If your specific AI tool requires initial hidden directories (e.g., `.gemini/`, `.opencode/`, `.claude/`), ensure the tool is properly initialized in the vault root before asking it to run the bootstrap sequence. The `init` workflow will handle creating the standard `.agents/skills/`, `.opencode/agents/`, and `.opencode/commands/` folders and their symlinks, but the base tool environment must be ready to receive commands.
4. **New or Existing Vaults:** You can start with a completely empty vault, or you can drop `99 System/` into an established vault. The harness is designed to adapt to both.

## 🛠️ Tweaking the Harness

If you are a developer looking to improve or modify this generic scaffolding system itself, you can open this `fresh-start` repository in your AI coding tool. The included `AGENTS.md` file will instruct the AI that it is operating within a template factory, allowing you to safely edit the underlying bootstrap workflows without the AI treating the repository like a live journal.
