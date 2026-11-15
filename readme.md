# Universal Obsidian AI Harness

Welcome to the **Universal Obsidian AI Harness**. This project is a generic, dynamic vault setup system designed to turn any standard Obsidian vault into a powerful, AI-driven workspace. 

Rather than relying on hardcoded logic for a specific type of vault (e.g., personal growth, research, or business), this harness uses an intelligent interview process to dynamically generate its own configurations, agents, and templates based on your unique needs.

## 🚀 How to Use It

To set up the harness in a new Obsidian vault:

1. **Copy the Core System:** After completing the [Pre-Flight Checklist](#️-manual-configuration-pre-flight-checklist) (especially the Templater setting), copy the entire `99 System/` folder from this repository into the root of your Obsidian vault.
2. **Initialize the AI Tool:** Open your AI coding assistant (like OpenCode, Claude Code, or Antigravity) in the root of the vault.
3. **Run Create Harness:** Prompt your AI with a command like:
   > *"Set up my vault using the `create-harness` workflow."*
4. **Follow the Prompts:** The AI will execute a sequence of idempotent workflows to structure your folders, interview you to create `VAULT-PURPOSE.md`, dynamically build necessary templates, generate your primary vault agent, and customize all AI skills.
5. **New Devices:** Obsidian Sync copies the vault but not the hidden tool folders or root links, so on each new device ask your AI to run the `connect-device` workflow. It safely regenerates all required symlinks without overwriting your data; rerun it whenever your AI tools can't find your skills. In short: a new vault gets `create-harness`, a new device gets `connect-device`.
6. **Platforms Without Symlinks:** Android shared storage (including the Android Terminal app's Linux VM and Termux) can't hold symlinks at all, and Windows needs Developer Mode or an administrator shell to create them. `connect-device` tests for this first. If links aren't possible, it stops and explains the alternatives instead of copying files, so `99 System/AI/` stays the single source of truth. For the Android Terminal app's Linux VM, `99 System/AI/PLATFORMS/android-vm/` provides the files with bind mounts instead; see its `README.md`.

## 🧠 Core Philosophy & Requirements

Rather than forcing a specific methodology, the harness relies on a dynamic generation process:

1. **Dynamic Structure Generation:** The system does not assume you use a specific folder convention (like PARA, Zettelkasten, or MOCs). Instead, the `create-harness` workflow will interview you, propose multiple architectural options, and scaffold them for you (or adapt to your existing structure).
2. **Idempotency (Safe for Existing Vaults):** The workflow scripts check for existing files before making changes. This means you can drop `99 System/` into an already established vault, and the harness will map and layer itself over your existing setup without destructively overriding your data.
3. **Single Source of Truth:** The system relies heavily on `99 System/AI/VAULT-PURPOSE.md`. Once generated via interview, this document dictates all downstream template generation, agent rules, and skill creation.
4. **Tool Agnosticism:** While the setup uses standard markdown and scripts, it requires an AI agent capable of reading local directories, parsing workflows, and creating symbolic links (such as OpenCode, Gemini, or Claude Code). The vault must be on storage that supports symbolic links; see step 6 of How to Use It for platforms that don't.

## ⚙️ Manual Configuration (Pre-Flight Checklist)

Before you copy `99 System/` into a vault and begin the `create-harness` interview, ensure you have completed the following manual steps:

1. **Install Obsidian Plugins:** Ensure you have your preferred Obsidian plugins installed, particularly **Templater** and **Linter**, as the AI relies on these for standard formatting and metadata generation.
2. **Protect the Harness from Templater:** In Templater's settings, add `99 System/AI` to **Ignore folders on file creation** *before* copying `99 System/` in. Otherwise Templater can run the literal tag examples in the workflows (such as `<% tp.file.title %>`) as the files arrive, replacing them with the file's own name, a date, or `undefined`.
3. **Sync Every File Type:** If you use Obsidian Sync, turn on **Sync all other types** in its settings. The harness includes `.json` and `.sh` files (such as `99 System/AI/SETTINGS/opencode.json`), which Obsidian Sync skips otherwise.
4. **Configure AI Access:** Make sure your AI assistant is configured to read the root directory of the vault.
5. **Prepare Your AI Tool:** If your specific AI tool requires initial hidden directories (e.g., `.gemini/`, `.opencode/`, `.claude/`), ensure the tool is properly initialized in the vault root before asking it to run `create-harness`. The `connect-device` workflow then creates the hidden folders below and fills them with symlinks into `99 System/AI/`:

    | Tool | Instructions | Skills | Commands & agents |
    |---|---|---|---|
    | OpenCode | `AGENTS.md` | `.agents/skills/` | `.opencode/commands/`, `.opencode/agents/` |
    | Claude Code | `CLAUDE.md` (→ `AGENTS.md`) | `.claude/skills/` | — |
    | Antigravity (agy) | `AGENTS.md` | `.agents/skills/` | — |

    Start Antigravity's `agy` at the vault root: outside a git repository it treats its starting folder as the workspace, so from a subfolder it finds neither `AGENTS.md` nor the skills. OpenCode and Claude Code find them from any subfolder.
6. **New or Existing Vaults:** You can start with a completely empty vault, or you can drop `99 System/` into an established vault. The harness is designed to adapt to both.

## 🛠️ Tweaking the Harness

If you are a developer looking to improve or modify this generic scaffolding system itself, you can open this `obsidian-ai-harness` repository in your AI coding tool. The included `AGENTS.md` file will instruct the AI that it is operating within a template factory, allowing you to safely edit the underlying setup workflows without the AI treating the repository like a live journal.
