# Research: Claude Code Skills Authentication

## Summary

Claude Code uses a **multi-layered, user-controlled trust model** with no centralized code signing. Trust is established through explicit user consent at marketplace, plugin installation, and runtime permission levels. Skills can restrict their own tool access via `allowed-tools` frontmatter, and the system defaults to read-only with explicit approval required for modifications.

## Findings

### 1. Authentication & Trust Model

- **No certificate authority or code signing** - trust established via GitHub repo ownership + explicit user approval
- **Multi-step consent process**:
  1. Trust marketplace (prompted when opening project with marketplace config)
  2. Install plugin (explicit user action)
  3. Approve runtime permissions (file changes, commands, tool usage)
- **MCP servers are user's responsibility** - "Anthropic does not manage or audit any MCP servers"
- **Credentials**: Stored in encrypted OS keychain (macOS Keychain)
- **OAuth 2.0** supported for MCP server connections via `/mcp` command
- **Enterprise**: Azure API Management can act as OAuth 2.0 gateway with Microsoft Entra ID

### 2. Permission Model

**Default Behavior:**
- Read-only by default
- Explicit approval required for modifications and commands
- Safe commands (`echo`, `cat`, `ls`) auto-allowed
- Complex/suspicious commands require manual approval even if previously allowed

**Permission Rules (priority order):**
1. **Deny** - Highest priority, completely blocks tool usage
2. **Allow** - Auto-approve without prompts
3. **Ask** - Require user confirmation (overrides allow)

**Configuration Levels:**
- User: `~/.claude/settings.json` (applies to all projects)
- Project: `.claude/settings.json` (shared via git)
- Enterprise: Managed policies that override user/project

**Skills Tool Restriction:**
```yaml
---
allowed-tools: Read, Grep, Glob
---
```
**Important limitation**: `allowed-tools` frontmatter only works in Claude Code CLI, NOT in SDK.

**Permission Modes:**
- `default` - Standard prompts
- `acceptEdits` - Auto-accepts file edits, prompts for commands
- `plan` - Analysis-only, no modifications

### 3. Security Best Practices for Skill Authors

**Top Risks:**
1. **Prompt injection** (#1 risk - affects 73% of production AI deployments)
2. **Command injection** via unsanitized inputs
3. **Tool chain exploitation** (combining innocent tools creates exfiltration vectors)
4. **Credential/secrets exposure**

**Best Practices:**

**Input Handling:**
- Validate and sanitize ALL external inputs
- Use parameterized commands, never string concatenation
- Escape special characters in shell commands
- Never trust external data sources

**Permissions:**
- Request minimum necessary permissions
- Use read-only as default, escalate only when needed
- Mark operations with hints: `readOnlyHint`, `destructiveHint`
- Never use "Allow everything" mode in production

**Tool Descriptions:**
- Narrowly and unambiguously describe what each tool does
- Never direct Claude to fetch behavioral instructions from external sources
- Ensure descriptions match actual functionality

**Data:**
- Only access data required for the function
- Don't collect extraneous conversation data
- Provide clear privacy policy for any data collection

**Security:**
- Implement PreToolUse hooks as security firewall
- Log tool calls for audit trails
- Test with malicious inputs attempting prompt injection
- Keep dependencies updated (patch vulnerabilities within 30 days)

### 4. Sandbox Architecture

- **Filesystem isolation**: Read/write limited to working directory
- **Network isolation**: Internet only through proxy with domain restrictions
- **User confirmation**: Required for new domain requests
- **Effect**: Reduces permission prompts by 84% while maintaining security

## Recommendations

1. **For skill authors**: Use `allowed-tools` frontmatter to self-restrict capabilities
2. **For security**: Implement PreToolUse hooks for custom policies
3. **For MCP servers**: Use OAuth 2.0, TLS, explicit trust verification
4. **For teams**: Check project settings into git for consistency
5. **For testing**: Always test skills with malicious inputs

## Sources

- [Claude Code Security Documentation](https://docs.claude.com/en/docs/claude-code/security)
- [Identity and Access Management - Claude Code](https://docs.claude.com/en/docs/claude-code/iam)
- [Making Claude Code more secure with sandboxing - Anthropic](https://www.anthropic.com/engineering/claude-code-sandboxing)
- [Best Practices for Building MCP Servers](https://support.anthropic.com/en/articles/11596040-best-practices-for-building-mcp-servers)
- [Are Claude Skills Secure? Threat Model & Best Practices](https://skywork.ai/blog/ai-agent/claude-skills-security-threat-model-permissions-best-practices-2025/)
- [Claude Code Security Best Practices - Backslash](https://www.backslash.security/blog/claude-code-security-best-practices)
- [Connect Claude Code to tools via MCP](https://docs.claude.com/en/docs/claude-code/mcp)
- [Claude Code Settings](https://docs.claude.com/en/docs/claude-code/settings)
- [Handling Permissions - SDK](https://code.claude.com/docs/en/sdk/sdk-permissions)
- [How to use Allowed Tools in Claude Code](https://www.instructa.ai/blog/claude-code/how-to-use-allowed-tools-in-claude-code)
