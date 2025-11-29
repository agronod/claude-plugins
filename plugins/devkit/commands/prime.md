---
description: Load project context for the current task
---

Spawn a subagent to load project context in isolation, then use the returned summary.

## Instructions

1. **Spawn subagent** using the Task tool:
   - `subagent_type`: `Explore`
   - `description`: "Load project context"
   - `prompt`: "Use the context-prime skill with mode=full to load project conventions. Return a comprehensive summary of the project patterns, architecture, and conventions you discover."

2. **Use the returned summary** as your project context for the current session.

The subagent will:
- Read `.agents/steering/` documentation
- Assess confidence and research if needed
- Return a structured summary of project conventions

This approach keeps context loading isolated and returns a condensed summary to you.
