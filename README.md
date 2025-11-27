# Team Plugins Marketplace

A Claude Code plugin marketplace for team/organization use.

## Installation

Add this marketplace to your Claude Code:

```shell
/plugin marketplace add agronod/claude-plugins
```

Or add it to your repository's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "agronod-plugins": {
      "source": {
        "source": "github",
        "repo": "agronod/claude-plugins"
      }
    }
  }
}
```

## Usage

Production plugins are installed from the `plugins/` directory after being registered in the marketplace.

```shell
/plugin install <plugin-name>@agronod-plugins
```

After installing a plugin, its commands become available as slash commands and its agents can be invoked by Claude when relevant.

## Available Plugins

- [devkit](plugins/devkit/README.md) - Injects steering context into subagents

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on creating new plugins.
