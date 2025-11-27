# Team Plugins Marketplace

A Claude Code plugin marketplace for team/organization use.

## Installation

Add this marketplace to your Claude Code:

```shell
/plugin marketplace add your-org/claude-plugins
```

Or add it to your repository's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "team-plugins": {
      "source": {
        "source": "github",
        "repo": "your-org/claude-plugins"
      }
    }
  }
}
```

## Available Plugins

### dev-tools

Development utilities including linting, formatting, and code review.

**Components:**
- `/lint` - Run linting on current project
- `/format` - Format code files
- `code-reviewer` agent - AI-powered code review
- `testing` skill - Test generation capabilities
- Auto-format hook - Formats code after edits

Install:
```shell
/plugin install dev-tools@team-plugins
```

### git-workflow

Git workflow automation for PR creation and branch management.

**Components:**
- `/pr-create` - Create PR with structured description
- `/branch-cleanup` - Clean up merged branches
- `commit-helper` agent - Help write conventional commits

Install:
```shell
/plugin install git-workflow@team-plugins
```

## Usage

After installing a plugin, its commands become available as slash commands and its agents can be invoked by Claude when relevant.

Example:
```
/lint
/format
/pr-create
```

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on creating new plugins.
