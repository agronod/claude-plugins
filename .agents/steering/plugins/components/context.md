# Plugin Component Details
Keywords: hooks, scripts, PostToolUse, PreToolUse, CLAUDE_PLUGIN_ROOT

## Hooks Configuration Pattern
File: `hooks/hooks.json`

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/scripts/script.sh",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

## Hook Events
| Event | Triggers On | Use Case |
|-------|-------------|----------|
| `PreToolUse` | Before tool execution | Modify inputs, add context |
| `PostToolUse` | After tool execution | Format output, run follow-up |

## Script Pattern
File: `scripts/{name}.sh`

```bash
#!/bin/bash
# Read hook input from stdin
INPUT=$(cat)

# Extract relevant fields
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')

# Process and return result
echo '{"hookSpecificOutput": {...}}'
```

## Environment Variables
- `${CLAUDE_PLUGIN_ROOT}`: Path to plugin root directory
- Use for referencing scripts and resources

## Hook Response Format
```json
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow",
    "updatedInput": { ... }
  }
}
```

## Rules
- MUST: Use `${CLAUDE_PLUGIN_ROOT}` for paths in hooks
- MUST: Set executable permissions on scripts (`chmod +x`)
- MUST: Include timeout for long-running commands
- PREFER: Use `jq` for JSON parsing in scripts
- AVOID: Blocking operations without timeouts

## References
- Example hook: `plugin-examples/dev-tools/hooks/hooks.json`
- Example script: `plugins/devkit/scripts/check-steering-read.sh`
