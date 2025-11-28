---
description: USE THIS SKILL when users ask to load or understand project context, prime AI with project information, read project documentation, get familiar with codebase structure, or understand project architecture/goals
---

# Load Project Context

## Required Information

### Optional

- **purpose**: Purpose or task description to load relevant context for (e.g., "Add user authentication system"). If not provided, load general project context.
- **mode**: Execution mode. Defaults to `full`.
  - `quick`: Lightweight - read steering files, minimal output, continue with task
  - `full`: Comprehensive - confidence assessment, research fallback, structured output

If the user has already provided context about what they're working on, use that as the purpose.

## Instructions

### Action 1: Discover Steering Files

**MAP** .agents/steering structure (Priority: 1. tree, 2. find)

**IF** .agents/steering doesn't exist:

- **mode=quick**: Output "⚠️ No steering files found. Proceeding without project conventions." and continue with your main task.
- **mode=full**: Use AskUserQuestion to ask "No .agents/steering found. Initialize project context?" with options "Yes, run project-init" and "No, continue without". If yes, invoke project-init skill.

### Action 2: Select Files Based on Purpose

**If a purpose was provided**:
**Think** about which files are most relevant to the purpose.
Consider filename keywords, directory structure, and likely content.

**PRIORITIZE** files based on purpose:

- Select which files to read given the purpose based on .agents/steering folder structure

**If no purpose was provided**:
Read all .agents/steering files.

### Action 3: Load Files

**READ** selected files using PARALLEL execution.

**CRITICAL INSTRUCTIONS**:

- **INVOKE** multiple Read tools in a SINGLE message for parallel execution
- **READ** complete files - do NOT use offset or limit parameters
- **BATCH** all Read operations together for maximum efficiency

**EXTRACT** patterns, workflows, and architectural decisions from loaded content.

---

## Mode: quick

Use this mode for lightweight context loading when you need to continue with another task.

### Quick Output

After loading files, output a brief summary and continue:

```text
📋 Conventions loaded:
• [Key pattern 1]
• [Key pattern 2]
• [Key pattern 3]

Proceeding with task...
```

**DO NOT**:

- Check session history
- Assess confidence
- Do additional research
- Wait for user instruction

**DO**: Continue immediately with your main task.

---

## Mode: full

Use this mode for comprehensive context loading with confidence assessment.

### Full Action 1: Check Session Context

**Think** about avoiding redundant context loading.

**EXAMINE** your conversation history NOW to avoid redundant loading:

- Check for previous "✅ Project context loaded" messages
- Note which .agents/steering/ files were already read this session
- Identify any @.agents/steering mentions or imports

**IF** context already loaded this session:

- If a purpose was provided, skip to Full Action 3 unless the new purpose requires different context
- Otherwise, skip to Full Action 3 and report existing context

### Full Action 2: Assess Confidence and Research

**Think hard** about your confidence level in understanding the project and the purpose (if provided).
Consider whether you understand the patterns and can map the purpose to codebase structure.

**EVALUATE** your confidence (0.0-1.0).

**IF** confidence < 0.7:
  **Think hard** about what additional research is needed.
  Search for concrete examples, similar implementations, and patterns.

**RESEARCH** using Grep tool to find:

- If purpose provided: Similar implementations, relevant patterns, testing approaches for this feature type
- If no purpose: Main entry points and architecture, testing and build patterns, code organization conventions

**IF** still < 0.7 after codebase search:
  **SEARCH** use context7 (if exists) or web for best practices and patterns
  **EXTRACT** relevant implementation approaches

### Full Action 3: Report Status

**Direct execution** - generate summary from loaded content:

**PRESENT** context loading summary:

```text
✅ Project context loaded successfully

PURPOSE: [the purpose, if provided]
CONFIDENCE: [score] ([low|medium|high])

PROJECT:
• Name: [from README]
• Type: [web app|CLI|library|service]
• Stack: [languages, frameworks]
• Architecture: [pattern]

PATTERNS DISCOVERED:
• [Key coding patterns]
• [Testing approaches]
• [Quality standards]

PURPOSE-RELEVANT: (if purpose was provided)
• [Implementation approach]
• [Testing strategy]
• [Integration points]

FILES LOADED: [count] documents
RESEARCH: [project-docs|codebase|web]

Context ready. Awaiting instruction.
```

**WAIT** for user instruction - do NOT proceed with the purpose automatically.

---

## Execution Reminder

**YOU MUST**:

1. DISCOVER available steering files
2. SELECT files based on purpose (if provided)
3. READ files in parallel
4. **IF mode=quick**: Output brief summary, continue with task
5. **IF mode=full**: Check session, assess confidence, research if needed, report structured output

**REMEMBER**: YOU are the agent performing these actions. Use YOUR built-in capabilities to execute each step directly.

---

**Your task**: Load project context using YOUR file reading and analysis capabilities.
