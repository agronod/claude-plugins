---
description: USE THIS SKILL when users ask to create specs/specifications for any feature or change, plan new features or refactoring, document requirements and approach, or align UI/code with designs (Figma, mockups, etc.)
---

# Create Specification and High-Level Plan

## Required Information

### Optional
- **description**: Description of what to build or user story. If not provided, will be gathered from context or asked.

If the user has already provided a description of what they want to build, use that directly.

## Instructions

### Interactive Behavior Requirements
**CRITICAL**: This skill includes interactive prompts that require user input.
- When you see **ASK**, you MUST pause and wait for user response
- When you see **WAIT**, you MUST NOT proceed until receiving user input
- **NEVER** make choices on behalf of the user
- **NEVER** auto-select options when confidence is below threshold
- User engagement is REQUIRED at decision points

**Purpose**: Create specification for the provided description or analyze user's request if not provided.

### Step 1: Load Mission-Based Context

If a description was provided:
**ANALYZE** the description:
- **SCAN** the description for file paths or references
- **READ** any referenced files using your file reading capability
- **EXTRACT** keywords for context-prime

If no description was provided:
**GATHER** requirements from user or existing context

- **IDENTIFY** core technical areas (e.g., "authentication", "testing", "api", "patterns", "architecture")
- **OPTIMIZE** for document filename and content matching
- **FOCUS** on what documentation context-prime needs to find

**INVOKE** the context-prime skill NOW with discovery-optimized keywords.

**WAIT** for context-prime to load documentation for the purpose of:
- Identifying existing patterns applicable to the requirements
- Finding architectural constraints and validation criteria
- Discovering similar implementations and examples
- Extracting project type, technology stack, and quality standards
- Identifying code organization and documentation patterns
- Understanding testing and validation approaches
- Loading global context integration (CLAUDE.md + project patterns)

### Step 3: Assess Confidence in Problem Understanding

**Think hard** about your confidence level in understanding this problem.
Can you define success criteria? Do you see a path forward?

**Confidence Assessment**:
- Evaluate your understanding of the problem and requirements
- Confidence thresholds:
  * ≥ 0.8: **PROCEED** with specification creation
  * 0.7-0.8: **PROCEED** with noted assumptions
  * < 0.7: **RECOMMEND** clarification or spec-prp skill

### Step 4: Analyze Context

**Think hard** about the requirements and architecture.
Consider the core purpose, measurable goals, technical requirements, and user needs.

**DETERMINE**:
- Main purpose and measurable goals
- Complexity level estimation
- Key technical requirements and quality standards
- Stakeholders and users with interaction patterns

### Step 5: Assess Confidence

**EVALUATE** your understanding with simple checks:

**CHECK** these key areas:
☐ Requirements clear and complete?
☐ Success criteria definable?
☐ Found relevant code/patterns to extend?
☐ Technical approach clear?
☐ Can define implementation phases?

**DETERMINE CONFIDENCE**:
- **HIGH**: All or most checks passed → proceed
- **MEDIUM**: Some gaps but core understood → proceed with assumptions
- **LOW**: Multiple critical gaps → need clarification

**IDENTIFY SPECIFIC GAPS** (if any):
- Missing: [What specific information would help]
- Unclear: [What needs clarification]
- Assumption: [What you're assuming]

### Step 6: Handle Low Confidence

**IF CONFIDENCE IS LOW**:
- **CREATE** minimal spec with gaps clearly noted
- **HIGHLIGHT** what information is missing
- **RECOMMEND**: "Consider using spec-prp skill for structured requirements gathering"
- **ASK**: "Please provide more context about [specific gaps] or use spec-prp"
- **WAIT** for user to provide clarification or approve proceeding

### Step 7: Proceed with Specification

**CREATE** specification based on available information:
- If HIGH confidence → Full specification
- If MEDIUM confidence → Specification with noted assumptions
- If LOW confidence → Partial specification with clear gaps

### File Creation Procedure

1. **DETERMINE** folder name from description or title (kebab-case)
2. **CREATE** the directory structure at `.agents/specs/[folder-name]/`
3. **CHECK** if `1-requirements.md` exists in the folder:
   - **IF EXISTS**: Read and incorporate requirements into specification
   - **IF NOT EXISTS**: Note that spec-prp can be used for structured requirements gathering
4. **CREATE** the specification file at `.agents/specs/[folder-name]/2-plan.md`
5. **REPORT**: ✅ Specification saved to `.agents/specs/[folder-name]/2-plan.md`
6. **ASK**: "Does this specification capture your intent? Ready to proceed with detailed implementation planning?"
7. **WAIT** for user response
8. **SUGGEST**: If approved, use `spec-implement` skill for detailed plan and code

### Specification Structure

**CREATE** a lean, focused specification for validation and guidance:

```markdown
# [Specification Title derived from description]
[Brief description of what's being built and why - one line]

## Summary
- [Specific action/task 1: what will be done]
- [Specific action/task 2: how it will be implemented]
- [Specific action/task 3: key technical decision or approach]

## Confidence: [High|Medium|Low]
✓ [What's clear/found]
⚠️ [Any assumptions or gaps]
💡 [What would help, if confidence not high]

## Context & Approach

### Relevant Codebase
- `[path/to/file]`: [What to extend/modify and why]
- `[path/to/file]`: [Existing pattern to follow]
- Key pattern: [Describe pattern found in codebase]

### Technical Approach
- [Primary technical decision]
- [How this extends existing code]
- [Key architectural choice]

### Key Interfaces
```typescript
// Only include if critical for understanding
interface [Name] {
  [method]: [signature]
}
```

### Assumptions & Gaps
- **Assumption**: [What we're assuming]
- **Missing**: [What information would help]
- **Risk**: [Any significant risks identified]

## Success Criteria
- [ ] [Specific, measurable outcome]
- [ ] [User-facing feature working]
- [ ] [Technical requirement met]
- [ ] [Integration complete]
- [ ] [Performance target achieved]

## Implementation Phases
1. **Phase 1**: [Core functionality - what gets built first]
2. **Phase 2**: [Additional features - what comes next]
3. **Phase 3**: [Polish/optimization - final improvements]
```

## Execution Reminder

**YOU MUST**:
1. ANALYZE to understand WHAT to build and HOW to build it
2. CREATE the folder structure at `.agents/specs/[folder-name]/`
3. CREATE a LEAN specification in `2-plan.md` (Summary of work plan, Confidence, Context, Success Criteria)
4. FOCUS on concrete actions (human validates plan) and clear steps (agent can follow)
5. SAVE the specification and await user confirmation

**REMEMBER**:
- Keep it LEAN - only essential sections
- Summary shows the WORK PLAN (what will be done), not feature description
- Confidence score with clear indicators of gaps
- Success criteria as checkboxes
- This is step 1 of 2 - detailed planning comes in spec-implement
