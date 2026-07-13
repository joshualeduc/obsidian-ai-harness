# Workflow: Create Identity & Context (Bootstrapping)

## 🎯 Purpose
To initialize the AI's understanding of a new user by generating the foundational `ME.md` and `GOALS.md` files. This ensures the AI can immediately act as a personalized and empathetic Executive Assistant.

## 🛠️ Execution Steps

### 1. Preparation & Adaptive Interview
- **Read Vault Purpose:** First, read `99 System/AI/VAULT-PURPOSE.md` to understand the type of vault (e.g., personal growth, research, business, creative).
- **Introduce the System:** Briefly explain that you need to learn about the user to provide the best assistance within the context of this vault.
- **Conduct Adaptive Interview:** Dynamically generate 4-5 highly relevant, probing questions tailored explicitly to the `VAULT-PURPOSE.md`. These questions must uncover the user's identity, context, and work habits as they relate to this specific vault's mission.
- **Capture Core Identity (Universal):** Ensure the interview captures universal fundamentals:
    - **Who is the user?** (Demographics, background).
    - **How do they think/work?** (Cognitive style, work habits).
    - **What's their current life/work context?**
    - **What should the AI know to be helpful?** (Interaction preferences, boundaries).
### 2. File Generation
- **Create `ME.md`:**
    - Use the gathered information to construct `99 System/AI/ME.md`. Reference `99 System/AI/WORKFLOWS/examples/ME Example.md` for structure and tone.
    - Include sections for: Identity, Professional Profile, Core Values & Focus Areas, Inner Circle, and Interaction Directives.
- **Create `GOALS.md`:**
    - Extract actionable short-term and long-term goals from the interview.
    - Construct `99 System/AI/GOALS.md` with clear, trackable objectives. Reference `99 System/AI/WORKFLOWS/examples/GOALS Example.md`.

### 3. Initialize Change Log
- **Create Initial Entry:**
    - Initialize the change log in `99 System/AI/CHANGE/ME/LOG[YYYY].md` (using the current year).
    - Log the initial creation of `ME.md` and `GOALS.md` with today's date.

### 4. Verification & Feedback
- **Present Drafts:** Show the generated `ME.md` and `GOALS.md` to the user for review.
- **Refine:** Make any requested adjustments based on their feedback.

## 🛑 Guardrails
- **No Assumptions:** Do not infer or invent details about the user's life. Only record what is explicitly shared.
- **Respect Privacy:** If the user declines to answer a question, move on and respect their boundaries.
- **Clear Structure:** Ensure the generated files follow standard markdown formatting with clear headers and bullet points.
