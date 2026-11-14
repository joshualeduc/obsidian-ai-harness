# Workflow: Update OpenCode Configuration

## 🎯 Purpose
To systematically audit and modify the existing `opencode.json` configuration file, ensuring it remains in sync with the vault's evolving structure and purpose, specifically maintaining correct permissions for new or removed folders.

## 🛠️ Execution Steps

### 1. Audit & Selection
- **Read Current State:** Read the existing `99 System/AI/SETTINGS/opencode.json` and `99 System/AI/VAULT-MAP.md`.
- **Identify Gaps:** Compare the `edit` rules in the `permissions` array of the `opencode.json` file against the current root content folders and index notes defined in `VAULT-MAP.md`.
    - Look for new folders that are missing an `allow` rule.
    - Look for old folders that no longer exist but still have an `allow` rule.
- **Identify Purpose Changes:** Read `99 System/AI/VAULT-PURPOSE.md` to see if autonomy tiers or general permissions have fundamentally changed.

### 2. Modification
- **Update File:** Modify the `99 System/AI/SETTINGS/opencode.json` file accordingly, ensuring the schema remains strictly valid and aligns with `99 System/AI/WORKFLOWS/examples/OpenCode Config Example.json`.
    - Add `allow` rules for any newly discovered content directories or index notes.
    - Remove `allow` rules for directories that have been archived or deleted.
    - Keep the default `deny` rule first; the last matching rule wins.
    - If the file still uses the OpenCode V1 keys `agent`, `permission`, or `tools`, offer to convert it to `agents` and `permissions` as in the example.

### 3. Verification & Change Logging
- **Present Draft:** Show the updated JSON configuration to the user for final review.
- **Log Change:** Create an entry in `99 System/AI/CHANGE/SETTINGS/LOG[YYYY].md` documenting:
    - Date of change
    - File updated (`opencode.json`)
    - Summary of the permission changes made.

## 🛑 Guardrails
- **Dynamic Derivation:** Do not hardcode any content folder names; all `allow` rules must be derived strictly from the `VAULT-MAP.md`.
- **Valid JSON:** Ensure the output is strictly valid JSON.
