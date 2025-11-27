# Plugin Structure Overview
Keywords: plugin.json, manifest, structure, folder

## Plugin Directory Structure
```
plugins/{name}/
├── .claude-plugin/
│   └── plugin.json          # Required: plugin manifest
├── commands/                 # Slash commands (*.md)
├── agents/                   # Agent definitions (*.md)
├── skills/                   # Skills (folders with SKILL.md)
├── hooks/                    # Hook configs (*.json)
└── scripts/                  # Supporting scripts (*.sh)
```

## Plugin Manifest Pattern
File: `.claude-plugin/plugin.json`

```json
{
  "name": "plugin-name",
  "version": "1.0.0",
  "description": "Brief description of plugin",
  "author": {
    "name": "Author Name",
    "email": "author@company.com"
  },
  "commands": ["./commands/"],
  "agents": ["./agents/"],
  "hooks": "./hooks/hooks.json"
}
```

## Component Types
| Type | Location | Format | Purpose |
|------|----------|--------|---------|
| Commands | `commands/*.md` | Markdown with frontmatter | Slash commands for users |
| Agents | `agents/*.md` | Markdown with frontmatter | Specialized AI assistants |
| Skills | `skills/*/SKILL.md` | Folder with SKILL.md | Reusable capabilities |
| Hooks | `hooks/*.json` | JSON config | Event-triggered actions |

## Rules
- MUST: Include `.claude-plugin/plugin.json` manifest
- MUST: Use correct directory structure
- PREFER: Keep components focused and single-purpose
- AVOID: Deep nesting within component folders
