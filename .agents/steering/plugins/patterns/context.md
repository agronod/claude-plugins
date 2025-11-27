# Plugin Development Patterns
Keywords: frontmatter, yaml, markdown, naming

## Command File Pattern
File: `commands/{name}.md`

```markdown
---
description: Brief description shown in command list
---

# Command Name

Instructions for Claude on how to execute this command.

## Instructions
1. Step one
2. Step two

## Example Output
Expected results format
```

## Agent File Pattern
File: `agents/{name}.md`

```markdown
---
name: agent-name
description: When to use this agent
---

# Agent Name

Detailed instructions for agent behavior and capabilities.

## When to Activate
- Trigger condition 1
- Trigger condition 2

## Process
1. Step one
2. Step two
```

## Skill Folder Pattern
Structure: `skills/{name}/SKILL.md`

```markdown
---
description: When Claude should use this skill
---

# Skill Name

Instructions and context for the skill.

## Capabilities
- Capability 1
- Capability 2
```

## Naming Conventions
- Commands: kebab-case filename (e.g., `pr-create.md`)
- Agents: kebab-case filename (e.g., `code-reviewer.md`)
- Skills: kebab-case folder name (e.g., `testing/`)
- All descriptions: concise, action-oriented

## Rules
- MUST: Use YAML frontmatter with `description` field
- MUST: Include clear step-by-step instructions
- PREFER: Provide example outputs where helpful
- AVOID: Vague or overly generic descriptions
