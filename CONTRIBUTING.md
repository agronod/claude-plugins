# Contributing Plugins

Guide for creating and contributing plugins to this marketplace.

## Plugin Structure

Each plugin must follow this structure:

```
plugins/your-plugin/
├── .claude-plugin/
│   └── plugin.json          # Required: plugin manifest
├── commands/                # Slash commands (*.md files)
├── agents/                  # Agent definitions (*.md files)
├── skills/                  # Agent skills (folders with SKILL.md)
├── hooks/                   # Hook configurations (*.json)
└── scripts/                 # Supporting scripts
```

## Plugin Manifest

Create `.claude-plugin/plugin.json`:

```json
{
  "name": "your-plugin",
  "version": "1.0.0",
  "description": "Brief description of your plugin",
  "author": {
    "name": "Your Name",
    "email": "you@company.com"
  },
  "commands": ["./commands/"],
  "agents": ["./agents/"],
  "hooks": "./hooks/hooks.json"
}
```

## Component Types

### Commands

Slash commands are markdown files with frontmatter:

```markdown
---
description: Brief description shown in command list
---

# Command Name

Instructions for Claude on how to execute this command.
```

### Agents

Agents are markdown files defining specialized assistants:

```markdown
---
name: agent-name
description: When to use this agent
---

# Agent Name

Detailed instructions for the agent's behavior and capabilities.
```

### Skills

Skills are folders containing a `SKILL.md` file:

```markdown
---
description: When Claude should use this skill
---

# Skill Name

Instructions and context for the skill.
```

### Hooks

Hooks are JSON configurations that run commands on events:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/scripts/your-script.sh"
          }
        ]
      }
    ]
  }
}
```

## Adding to Marketplace

1. Create your plugin in `plugins/your-plugin/`
2. Add entry to `.claude-plugin/marketplace.json`:

```json
{
  "name": "your-plugin",
  "source": "./plugins/your-plugin",
  "description": "Your plugin description",
  "version": "1.0.0"
}
```

3. Test locally:
```shell
/plugin marketplace add /path/to/claude-plugins
/plugin install your-plugin@team-plugins
```

4. Submit a pull request

## Best Practices

- Keep commands focused on single tasks
- Write clear descriptions for discoverability
- Include error handling in scripts
- Document any prerequisites or dependencies
- Use `${CLAUDE_PLUGIN_ROOT}` for paths in hooks
