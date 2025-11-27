---
description: USE THIS SKILL when users ask to load or understand project context, prime AI with project information, read project documentation, get familiar with codebase structure, or understand project architecture/goals
---

# Load Project Context

## Required Information

### Optional
- **purpose**: Purpose or task description to load relevant context for (e.g., "Add user authentication system"). If not provided, load general project context.

If the user has already provided context about what they're working on, use that as the purpose.

## Instructions

### Action 1: Check Session Context

**Think** about avoiding redundant context loading.

**EXAMINE** your conversation history NOW to avoid redundant loading:
- Check for previous "✅ Project context loaded" messages
- Note which .agents/steering/ files were already read this session
- Identify any @.agents/steering mentions or imports

**IF** context already loaded this session:
  - If a purpose was provided, skip to Action 4 unless the new purpose requires different context
  - Otherwise, skip to Action 4 and report existing context

### Action 2: Load Project Documentation

**MAP** .agents/steering 3 level structure (Priority: 1. tree, 2. find)

**IF** .agents/steering doesn't exist:
  **INVOKE** project-init skill
  **STOP** execution

**If a purpose was provided**:
**Think hard** about which files are most relevant to the purpose.
Consider filename keywords, directory structure, and likely content.

**PRIORITIZE** files based on purpose:
- THINK HARD NOW and select which files to read given the purpose based on .agents/steering folder structure

**READ** high and medium relevance files using PARALLEL execution.

**If no purpose was provided**:
**Direct execution** - simple parallel read with no prioritization needed:

**READ** all .agents/steering files using PARALLEL execution.

**CRITICAL INSTRUCTIONS**:
- **INVOKE** multiple Read tools in a SINGLE message for parallel execution
- **READ** complete files - do NOT use offset or limit parameters
- **BATCH** all Read operations together for maximum efficiency
- Example: Send one message with 5-10 Read tool invocations simultaneously

**EXTRACT** patterns, workflows, and architectural decisions from all loaded content.

### Action 3: Assess Confidence and Research

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

### Action 4: Report Status

**Direct execution** - generate summary from loaded content:

**PRESENT** context loading summary:
```
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

## Execution Reminder

**YOU MUST**:
1. CHECK your session history to avoid redundant loading
2. READ project documentation:
   - BEFORE reading: Discover available steering files
   - THEN analyze which files match the purpose
   - ONLY THEN read the relevant files in parallel
3. ASSESS confidence and research if needed
4. REPORT the loaded context clearly
5. WAIT for user instruction - do NOT proceed with the purpose automatically

**REMEMBER**: YOU are the agent performing these actions. Use YOUR built-in capabilities to execute each step directly.

---

**Your task**: Load project context using YOUR file reading and analysis capabilities.
