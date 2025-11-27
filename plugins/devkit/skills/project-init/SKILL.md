---
description: USE THIS SKILL when users ask to initialize or set up a new project, create AI agent instructions, set up AI-friendly documentation, or establish project standards for AI collaboration
---

# Initialize AI Project

## Required Information

This skill requires no parameters. It will create CLAUDE.md and run context-update automatically.

## Instructions

### Description

Initialize a project for AI agent collaboration by creating CLAUDE.md with coding standards and then running context-update to generate comprehensive documentation.

- Primary purpose: Set up AI agent instructions and project documentation
- Key benefits: Consistent AI behavior, comprehensive project analysis
- Scope: Creates CLAUDE.md then delegates to context-update for full setup
- Prerequisites: Write permissions in current directory

### Action 1: Create CLAUDE.md

**READ** the template from `resources/claude-md-template.md` in this plugin directory.

1. **READ**: Fetch the content from `${CLAUDE_PLUGIN_ROOT}/resources/claude-md-template.md`
2. **CREATE FILE**: Write the fetched content to `CLAUDE.md` in the current project directory
3. **VERIFY**: Ensure the file was created successfully

### Action 2: Run context-update

After creating CLAUDE.md:

1. **VERIFY**: CLAUDE.md was created successfully
2. **INVOKE**: context-update skill to analyze the project and create .agents/steering documentation
3. **REPORT**: completion status

**RESPOND** with:
```
✅ Project initialized

Created:
- CLAUDE.md (AI agent instructions)

Now running context-update to analyze project and generate documentation...
```

## Execution Reminder

**YOU MUST**:
1. WRITE CLAUDE.md file using your file creation capability
2. INVOKE context-update skill after CLAUDE.md is created
3. DO NOT just show the template - ACTUALLY CREATE THE FILES

---

**IMPORTANT**: These are COMMANDS to EXECUTE. Create the actual files on disk.
