---
description: USE THIS SKILL when users ask to commit files, commit changes or save work to git repository, create a commit with a message, check in code changes, or save current modifications
---

# Git Commit with Conventional Message

## Required Information

This skill requires no parameters. It analyzes staged changes and generates an appropriate commit message.

## Instructions

### Action 1: Check Staged Files

**CHECK** the current git repository status using your git capabilities NOW to determine if there are any staged files.

**IF** no files are currently staged:
  **INFORM** the user that no files are staged for commit
  **SUGGEST** they stage files using 'git add' before committing
  **STOP** - do not proceed with commit

**ELSE**:
  **LIST** the currently staged files
  **DO NOT** stage any additional files
  **REPORT** the number and names of staged files

### Action 2: Analyze Changes

**GET OVERVIEW** of all staged changes first:

- **CHECK** the full scope with `git diff --cached --stat`
- **IDENTIFY** if this is a major refactor (many files) or focused change (few files)
- **DETERMINE** if changes span multiple subsystems or features

**ANALYZE** the staged changes using your git diff capabilities NOW to understand:
- What files were modified, added, or deleted
- The nature and extent of the changes
- The purpose and impact of the modifications

**FOR MAJOR CHANGES** (10+ files or structural changes):

**Think thoroughly and in great detail** about the overall transformation theme.
Consider patterns across files and the unified purpose of the change.

- **EXAMINE** patterns across all affected files
- **IDENTIFY** the primary theme (refactor, feature, migration, etc.)
- **LIST** major subsystems affected
- **UNDERSTAND** the overall transformation, not just individual file changes

**EXAMINE** the diff output to understand:
- The specific code or content changes made
- Which components or modules are affected
- The overall intent behind the changes
- Whether multiple related changes should be described with bullet points

**DETECT BREAKING CHANGES** by checking for:

**Think hard** about compatibility and downstream impacts.
Consider API contracts, configuration schemas, and user-facing interfaces.

- Removed or renamed public APIs, functions, or exports
- Changed function signatures or parameter requirements
- Removed configuration options or environment variables
- Incompatible schema or database changes
- Removed features or changed default behaviors
- Changes requiring user action to maintain functionality

### Action 3: Determine Commit Details

**Think hard** about categorizing changes and composing a clear message.
Select the appropriate commit type and describe what changed and why.

**CATEGORIZE** the changes into one of these conventional commit types:
- **feat**: A new feature or capability added
- **fix**: A bug fix or error correction
- **docs**: Documentation only changes
- **refactor**: Code restructuring without changing functionality
- **test**: Adding or updating tests
- **chore**: Maintenance tasks, dependency updates, etc
- **ci**: CI/CD configuration changes

**COMPOSE** a clear, concise description that summarizes what changed and why (not how).

**DETERMINE EXTENDED DESCRIPTION** needs:
- If changes affect 10+ files, ALWAYS include extended description
- If structural changes (renames, moves, deletes), document the transformation
- If changes affect multiple aspects, prepare bullet points
- If changes have important context or rationale, prepare a paragraph
- If changes are simple and self-explanatory, no extended description needed

**IDENTIFY BREAKING CHANGE** impact:
- If breaking changes detected, prepare a BREAKING CHANGE description
- Explain what broke and what users need to do

### Action 4: Propose Commit Message

**Think hard** about creating a clear, concise commit message that balances completeness with brevity.

**GENERATE** a conventional commit message with this structure:

```
type: description

[extended description with bullets if changes are complex]

[BREAKING CHANGE: description if breaking changes detected]
```

**BUILD** the message components:
- **First line**: Always include `type: description`
  - type: One of the categories you determined above
  - description: Present tense, lowercase, no period at end
- **Extended description**: Add if changes affect multiple aspects
  - Use bullet points for multiple related changes
  - Use paragraph for important context or rationale
  - Separate from first line with blank line
- **Breaking change footer**: Add if breaking changes detected
  - Must start with `BREAKING CHANGE:` (uppercase)
  - Explain what breaks and migration path
  - Separate from body with blank line

**PRESENT** your proposed commit to the user:
- Display the complete formatted commit message
- Show the file count and line change statistics

**USE AskUserQuestion** to confirm:
- Question: "Proceed with this commit?"
- Options:
  - "Yes, commit" - Create the commit as shown
  - "Cancel" - Abort the commit

### Action 5: Create Commit

**IF** user selects "Yes, commit":
  **CREATE** the git commit using your git commit capability with the generated message
  **VERIFY** the commit was created successfully using your git log capability
  **DISPLAY** the commit hash and summary to confirm success

**IF** user provides custom input (via "Other"):
  **NEVER** commit directly - custom input means the user wants to refine, not confirm
  **ADJUST** the commit message based on their feedback
  **PRESENT** the updated commit message in full
  **CALL AskUserQuestion again** with the same options
  **LOOP** until user explicitly selects "Yes, commit" or "Cancel"

**IF** user selects "Cancel":
  **INFORM** the user that the commit was aborted
  **STOP** - do not create the commit

## Quick Reference

1. CHECK repository status for staged files
2. ANALYZE the actual changes through diff examination
3. GENERATE an appropriate conventional commit message
4. WAIT for user confirmation before creating the commit
5. CREATE the commit only after receiving approval
