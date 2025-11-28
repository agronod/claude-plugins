---
description: USE THIS SKILL when users ask to research a topic, find documentation, look up best practices, compare technologies, or gather information before implementing a feature
---

# Research Skill

## Required Information

### Required
- **topic**: What to research. Ask "What would you like me to research?"

### Optional (with defaults)
- **depth**: Research thoroughness. Defaults to "standard". Options:
  - `quick`: Fast lookup, single search
  - `standard`: Balanced research
  - `thorough`: Comprehensive, parallel exploration of multiple angles

If the user has already provided this information, proceed directly.

## Instructions

### Action 1: Analyze the Topic

**Think hard** about the research topic:

1. **What questions need answering?**
   - Break down the topic into distinct, independently researchable questions
   - Each question represents a different angle on the topic
   - Reason about what's relevant for THIS specific topic - don't follow a template

2. **How many questions?**
   - `quick`: 1 question (the core question)
   - `standard`: 2-3 questions
   - `thorough`: up to 5 questions covering different angles

### Action 2: Execute Research

**Launch research subagents** based on depth:

For `thorough` depth:
- Launch up to 3 Task agents **IN PARALLEL** (single message, multiple tool calls)
- Each agent gets one question/angle to research
- Use `subagent_type: "devkit:researcher"` (or `"Explore"` if not available)

For `standard` depth:
- Use 1-2 agents sequentially or in parallel based on question independence

For `quick` depth:
- Single direct research, no subagents needed

**Each agent decides which tools to use**, but include tool hints in the prompt based on the topic:

```
Prompt template:

"[The research question]

Tool hints (use if available):
- Context7 MCP: Excellent for library/framework documentation
- GitHub MCP: Good for code examples, repos, and issue discussions
- WebSearch: Good for tutorials, comparisons, recent information"
```

**Tailor hints to the question** - documentation questions emphasize Context7, code pattern questions emphasize GitHub, etc.

Example prompts for "Compare React state management options":

```
Agent 1: "What state management libraries are popular in React in 2025 and why?

Tool hints: GitHub MCP for repo popularity, WebSearch for recent articles"

Agent 2: "What are the trade-offs between Redux, Zustand, and Jotai?

Tool hints: Context7 for official docs, WebSearch for comparison articles"

Agent 3: "What do teams report after using these libraries in production?

Tool hints: WebSearch for blog posts, GitHub MCP for issue discussions"
```

### Action 3: Synthesize Findings

**Think thoroughly** to organize results:

1. **Combine** findings from all agents
2. **Identify patterns** - what do multiple sources agree on?
3. **Note disagreements** - where do sources differ?
4. **Formulate recommendations** based on findings

### Action 4: Record Findings

**Use the record skill** to save research:
- mission: "Research findings for [topic]"
- File goes to `.agents/scratchpads/research-[topic-slug].md`

### Action 5: Report to User

Present findings in a clear format:

```markdown
## Research: [Topic]

### Summary
[Key findings in 2-3 sentences]

### Findings
[Organized by the questions that were researched]

### Recommendations
[Actionable next steps]

### Sources
[URLs for verification]
```

## Quick Reference

1. **ANALYZE** topic → break into questions (reason, don't template)
2. **LAUNCH** subagents → each gets a question, decides own tools
3. **SYNTHESIZE** → combine findings, identify patterns
4. **RECORD** → save to scratchpad via record skill
5. **REPORT** → present summary with sources
