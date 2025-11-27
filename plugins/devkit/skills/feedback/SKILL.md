---
description: USE THIS SKILL when users report bugs, suggest improvements, provide feedback about plugins, ask to create a GitHub issue, or express frustration with plugin guidelines
---

# GitHub Issue Helper for Claude Plugins

## Required Information

### Required
- **feedback**: The user's feedback, bug report, or suggestion. Ask "What feedback, bug, or suggestion would you like to report?"

If the user has already provided this information, proceed directly.

## Instructions

### Action 1: Search for Similar Issues

**SEARCH** the agronod/claude-plugins repository for similar issues:

```bash
gh search issues --repo agronod/claude-plugins "[feedback keywords]"
```

**EXTRACT** key terms from the feedback and search again:
```bash
gh search issues --repo agronod/claude-plugins "[extracted keywords]"
```

**ANALYZE** search results to identify:
- Exact or near duplicates
- Related issues that might be relevant
- Closed issues with similar topics

### Action 2: Present Findings

**IF similar issues found**:
```
🔍 Similar Issues Found:

1. #[number]: [Issue Title]
   Link: https://github.com/agronod/claude-plugins/issues/[number]
   Status: [Open/Closed] | Created: [date]
   [Brief description of why it's similar]

2. [Additional issues if found...]
```

**IF no similar issues found**:
```
🔍 No similar issues found in agronod/claude-plugins
```

### Action 3: Suggest New Issue

**ANALYZE** the feedback and **GENERATE** an issue suggestion:

```markdown
📝 Suggested Issue:

**Title**: [Concise, descriptive title based on feedback]

**Body**:
## Description
[Clear description based on user's feedback]

## Context
[Any additional context from the feedback]

## Suggested Solution (if applicable)
[If the user suggested any solutions]

**Labels**: [Suggest appropriate labels like: bug, enhancement, documentation, question]
```

### Action 4: Guide User to Create Issue

**PRESENT** next steps to the user:

```
Would you like to create this issue in agronod/claude-plugins?

If yes, I'll help you create it with the suggested content above.
If you'd like to modify it first, let me know what changes you'd like.

To create the issue, confirm and I'll use:
gh issue create --repo agronod/claude-plugins --title "[title]" --body "[body]" --label "[labels]"
```

## Execution Reminder

**YOU MUST**:
1. Actually SEARCH for existing issues in agronod/claude-plugins
2. PRESENT links to similar issues if found
3. GENERATE a clear issue suggestion
4. WAIT for user confirmation before creating any issue
5. Only create issues in the agronod/claude-plugins repository

---

**Your task**: Search for similar issues, present findings, and suggest a new issue if appropriate.
