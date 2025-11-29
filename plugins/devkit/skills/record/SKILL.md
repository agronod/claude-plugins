---
description: USE THIS SKILL when users ask to record or track information, keep notes on specific topics, document findings or decisions, or create a scratchpad for any purpose
---

# Scratchpad Recording System

## Required Information

### Required
- **mission**: What to track and record. Ask "What would you like me to track and record?"

### Optional (with defaults)
- **strategy**: How to organize scratchpads. Defaults to "single". Options:
  - `single`: Everything in one organized file
  - `topic-based`: Natural topic separation as themes emerge
  - `timestamped`: Chronological organization by session
- **mode**: When to update. Defaults to "immediate". Options:
  - `immediate`: One-time recording task
  - `continuous`: Ongoing recording throughout the session

If the user has already provided this information, proceed directly.

## Instructions

### Scratchpad Setup

**ENSURE** scratchpad infrastructure exists:
- **VERIFY** `.agents/scratchpads/` directory exists (create if needed)
- **ORGANIZE** files based on the strategy approach:
  - **single**: One file named after the mission
  - **topic-based**: Separate files per topic as they emerge
  - **timestamped**: New file per session with date prefix

### Recording Directive

**THINK** about what matters for the mission and RECORD it intelligently.

#### What to Record

Based on the mission, capture what's relevant:
- Decisions and rationale
- Findings and discoveries
- Problems and solutions
- Code snippets and commands
- Ideas and future work
- Questions and answers
- Resources and references
- Whatever helps accomplish the mission

Don't force structure - let the content guide organization.

### For Immediate Mode

**PERFORM** the recording task NOW:

1. **ANALYZE** what needs to be recorded for the mission
2. **GATHER** the relevant information
3. **CREATE** scratchpad file at `.agents/scratchpads/[appropriate-name].md`
4. **WRITE** the information clearly and usefully
5. **REPORT** completion to user

This is a ONE-TIME task - complete it and you're done.

### For Continuous Mode

**COMMIT** to recording throughout this work session:

You will now CONTINUOUSLY maintain scratchpads for the mission without being reminded.

**WHEN** to update:
- After significant actions or decisions
- When discovering important information
- At natural breakpoints in work
- Whenever something relevant to the mission occurs

**HOW** to update:
- Be proactive - don't wait to be asked
- Keep information organized and useful
- Brief notification when updating: "📝 Recorded [what]"
- Focus on what matters for the mission

## File Location

**Path**: `.agents/scratchpads/` directory
**Git**: Automatically excluded from version control (.agents/ should be in .gitignore)

## Quick Reference

1. ENSURE `.agents/scratchpads/` directory exists
2. ORGANIZE files based on strategy (single, topic-based, timestamped)
3. **Immediate mode**: Complete the recording task now
4. **Continuous mode**: Maintain scratchpads throughout the session
