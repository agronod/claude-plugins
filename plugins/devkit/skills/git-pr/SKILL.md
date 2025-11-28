---
description: USE THIS SKILL when users ask to create a pull request, generate PR and push changes, open a PR with structured description, or submit changes for review
---

# Create Pull Request with WHY-HOW Description

## Required Information

### Optional (with defaults)

- **confirm**: Ask for approval before finalizing description. Defaults to true.

## Instructions

This skill provides instructions for creating pull requests with structured descriptions that emphasize WHY before HOW.

### Action 1: Identify Branches

**IDENTIFY** the branches:

- **Head branch**: The current branch you're working on
- **Target branch**: The immediate parent branch from which this branch was created. Check the commit history to find which branch the parent commit belongs to.
- **NEVER assume** target branch is main/master - always verify by inspecting the branch history

### Action 2: Detect Git Provider

**EXTRACT** repository information from git remote:

- Run `git remote get-url origin` to get remote URL
- Parse URL to identify provider (GitHub, Bitbucket, GitLab, etc.)
- Extract organization/workspace and repository slug for later use

### Action 2.5: Detect Existing PR

**CHECK** if a pull request already exists for the current branch targeting the base branch:

- Use your git provider capabilities to list pull requests
- Filter by source branch (current branch) and target branch
- Check for OPEN state PRs only

**DETERMINE** the mode and gather context:

**IF PR exists**:

- Extract PR ID/number
- **FETCH the current PR description text**
- **STORE** both PR metadata and description for use in UPDATE mode

**IF no PR exists**:

- Proceed with CREATE mode

### Action 3: Analyze Diff and Generate Description

**ANALYZE** the complete changes in the PR:

- **RUN** `git diff <target>...<head>` to see all changes included in the PR
- **EXAMINE** what files were added, modified, or deleted
- **ANALYZE** the full scope of changes from target to head

**READ** the PR description template from `${CLAUDE_PLUGIN_ROOT}/resources/pr-description.md`

**Think thoroughly and in great detail** about generating or updating the description based on the template structure and current changes.

**GENERATE** description based on detected mode:

**IF UPDATE MODE** (existing PR found):

- **READ** the existing PR description (fetched in Action 2.5)
- **ANALYZE** the complete diff (target→head) to understand current state
- **UPDATE** the existing description to reflect the current complete changeset
- Use your judgment to preserve, refine, or replace sections as appropriate
- Ensure the updated description accurately represents all current changes
- Follow the template structure for any new sections added

**IF CREATE MODE** (no existing PR):

- **ANALYZE** the complete diff (target→head)
- **GENERATE** a fresh description following the template structure
- Create a descriptive title from branch name and commit patterns
- Fill template sections based on your diff analysis

### Action 4: Confirmation and Refinement

If confirm mode is enabled (default):

**PRESENT** the generated description to the user:

- Display the raw markdown in a code block to preserve all formatting
- This ensures checkboxes, special characters, and formatting are visible exactly as they will appear
- Format as:

```
📋 Generated PR Description:
[Show the complete generated description - raw markdown]

Target branch: [target] → [head]
```

**USE AskUserQuestion** to confirm:
- Question: "Create pull request with this description?"
- Options:
  - "Yes, create PR" - Create the pull request
  - "Cancel" - Abort PR creation

**IF** user provides custom input (via "Other"):
  **NEVER** create PR directly - custom input means the user wants to refine, not confirm
  **ADJUST** the description based on their feedback
  **PRESENT** the updated description in full
  **CALL AskUserQuestion again** with the same options
  **LOOP** until user explicitly selects "Yes, create PR" or "Cancel"

If confirm is false:
**PROCEED** directly to PR creation (auto-approve mode)

### Action 5: Validate PR Prerequisites

**CHECK** prerequisites using your command execution capabilities:

- Ensure the current branch has been pushed to remote
- Confirm there are commits to include in the PR
- Detect if a PR already exists for this branch

**VALIDATE** tools and credentials for detected provider:

- Verify required CLI tools or API credentials are available
- Ensure proper authentication is configured
- Guide user through setup if prerequisites are missing

### Action 6: Create or Update Pull Request

**EXECUTE** based on detected mode:

**IF UPDATE MODE** (existing PR found):

- **UPDATE** the existing pull request using your git provider capabilities
- Use the PR ID from detection step
- Apply the generated description
- Preserve existing metadata (reviewers, labels, etc.)

**IF CREATE MODE** (no existing PR):

- **CREATE** a new pull request using your git provider capabilities
- Use the generated description as the PR body
- Apply the auto-generated title from branch and commit analysis
- Set the detected source branch as the base/target branch
- Include the current branch as the head/source branch
- Consider marking as draft if changes seem incomplete

**HANDLE** the operation intelligently:

- Parse response and extract PR/MR URL
- Diagnose issues and guide resolution on failure
- Learn from errors for future improvements

### Action 7: Post-Creation Actions

**PROVIDE** helpful follow-up based on the created PR:

- Display the PR URL prominently
- Suggest adding reviewers if appropriate
- Mention CI/CD status checks if applicable
- Offer to help with any PR modifications

## Tone and Style Guidelines

**Follow the template's intent**:

- Each template section has a purpose - understand and fulfill it
- If a section asks "why", explain motivation and business context
- If a section asks "what", provide a scannable overview
- If a section asks "how", include technical details and decisions
- Adapt your analysis depth to match what each section requests

**Overall Tone**:

- Maintain friendly, approachable style
- Use emojis appropriately (matching the template)
- Be helpful to reviewers
- Balance technical accuracy with readability
- Make the PR description easy to scan and understand

## Quick Reference

1. IDENTIFY head and target branches
2. DETECT git provider from remote URL
3. CHECK for existing PR (update vs create mode)
4. ANALYZE diff and READ PR template
5. GENERATE description following template structure
6. PRESENT to user and WAIT for confirmation
7. VALIDATE prerequisites (branch pushed, commits exist)
8. CREATE or UPDATE the pull request
