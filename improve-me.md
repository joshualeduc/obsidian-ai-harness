# Improve Me: A Prompt for Advanced AI Agents

**To the User:** If you want to hand this project off to a more advanced AI model (or just do a massive review cycle), provide it with the following prompt to kick off a comprehensive audit and improvement sequence.

---

## 🤖 The Prompt

> **Role & Objective:**
> You are an expert AI systems architect, prompt engineer, and knowledge-management specialist. Your objective is to review, refine, and radically improve the "Universal Obsidian AI Harness" project. This system is a dynamic, tool-agnostic bootstrapping framework that turns any standard Obsidian vault into an autonomous AI-driven workspace through a series of idempotent workflows.
> 
> **Context:**
> The core of this system lives in the `99 System/AI/WORKFLOWS` directory. It uses a master orchestrator (`bootstrap.md`) to run a sequence of `create-*` and `update-*` workflows. The system is designed to be highly dynamic, using a generated `VAULT-PURPOSE.md` as the single source of truth for downstream template, agent, and skill generation. It is built to accommodate both brand-new vaults and deeply established vaults without destructively overriding user data.
> 
> **Your Task:**
> 1. **Code & Workflow Review:** Audit all workflows in `99 System/AI/WORKFLOWS`. Look for logic gaps, prompt-engineering weaknesses within the markdown scripts, or failure points where idempotency might break.
> 2. **Refactoring:** Streamline the orchestration pipeline. Can the workflows be made more robust, concise, or resilient to edge cases?
> 3. **Feature Ideation:** Suggest 3-5 high-impact new features. Consider things like advanced semantic routing, multi-agent collaboration frameworks within the vault, or deeper integrations with specific local AI tools.
> 4. **Improvement Plan:** Before making any changes, present a comprehensive `implementation_plan.md` detailing your findings and proposed improvements.
> 
> **Before writing your plan, you MUST ask the user the following questions to align your strategy:**
> 1. **Current Pain Points:** What is the biggest friction point or confusion users currently experience when running the bootstrap sequence?
> 2. **Tool Support:** Are there specific AI platforms (e.g., OpenCode, Claude Code, Cursor) that you want to optimize for, or should we strictly maintain tool-agnosticism at the cost of specific features?
> 3. **Future Vision:** Do you see this harness expanding beyond local markdown (e.g., managing media, webhooks, or API integrations), or should it remain strictly focused on local text-based knowledge management?
> 4. **Complexity Tolerance:** Do you want to introduce more advanced AI patterns (like automated self-reflection, background health checks, or specialized RAG indexing), or prioritize keeping the scaffolding lightweight, simple, and transparent?
> 
> Please read the `readme.md` and the `99 System/AI/WORKFLOWS/bootstrap.md` files to orient yourself, then ask the clarifying questions.

---

## 💡 Why This Prompt Works (What Makes a Good Handoff)

When handing off a complex architectural project to an advanced AI, a good prompt must include:

1. **Core Philosophy Keywords:** Explicitly stating terms like "idempotent," "single source of truth," and "tool-agnostic." Advanced AI models understand these software engineering paradigms deeply and will apply best practices accordingly.
2. **Architectural Pointers:** Directing the AI to the exact folders (`99 System/AI/WORKFLOWS`) and key files (`bootstrap.md`) saves token space and gets the AI to the meat of the project immediately without it needing to fumble around the directory tree.
3. **Forced Alignment (The Questions):** AI models love to start coding immediately. By forcing the AI to ask questions *before* it plans, you prevent it from confidently running in the wrong direction (e.g., optimizing heavily for OpenCode when you want it to remain generic).
4. **Permission to Dream:** Explicitly asking for "Feature Ideation" gives the model permission to tap into its broader training data to suggest things you might not have thought of (like multi-agent collaboration inside Obsidian).
