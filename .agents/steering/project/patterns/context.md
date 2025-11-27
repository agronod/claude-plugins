# Project Patterns
Keywords: marketplace.json, registry, plugin-entry, versioning

## Marketplace Registry Pattern
File: `.claude-plugin/marketplace.json`

```json
{
  "name": "org-plugins",
  "owner": {
    "name": "Organization Name",
    "email": "team@org.com"
  },
  "plugins": [
    {
      "name": "plugin-name",
      "source": "./plugins/plugin-name",
      "description": "Brief description",
      "version": "1.0.0"
    }
  ]
}
```

## Adding New Plugin
1. Create plugin folder in `plugins/{name}/`
2. Add plugin manifest in `plugins/{name}/.claude-plugin/plugin.json`
3. Add entry to `.claude-plugin/marketplace.json` plugins array
4. Test with `/plugin marketplace add /path/to/repo`

## Version Conventions
- Use semantic versioning (MAJOR.MINOR.PATCH)
- Start new plugins at `0.1.0` or `1.0.0`
- Increment appropriately for changes

## References
- Marketplace file: `.claude-plugin/marketplace.json`
- Example plugins: `plugin-examples/`
