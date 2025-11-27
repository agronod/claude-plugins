---
description: USE THIS SKILL when users ask to create requirements document, gather structured requirements, prepare for specification generation, or document feature requirements with examples
---

# Create Product Requirements Prompt (PRP)

## Required Information

### Optional
- **feature**: Brief feature description. If not provided, will be gathered interactively.
- **folder**: Spec folder name (without path). If not provided, will be generated from feature description.
- **output_dir**: Output directory for PRP file. Defaults to `.agents/specs/`

If the user has provided a feature description in their request, use that directly.

## Instructions

### Action 1: Interactive Requirements Gathering

**GATHER REQUIREMENTS NOW** using the structured PRP template through interactive prompts:

#### 1A: Feature Description
If feature was not provided:
**ASK**: "What feature would you like to create requirements for?"
**WAIT** for user response
**CAPTURE** the feature description

If feature was provided:
Use the provided feature description.

#### 1B: Examples Gathering
**ASK**: "Are there any examples in your project (examples/ folder, similar features, or reference implementations) that should be referenced during development?"
**WAIT** for user response
**CAPTURE** examples and references

#### 1C: Documentation Sources
**ASK**: "What documentation, web pages, MCP servers (like Context7), or external resources will need to be referenced during development?"
**WAIT** for user response
**CAPTURE** documentation sources

#### 1D: Project-Specific Considerations
**ASK**: "Are there any project-specific gotchas, constraints, or requirements that AI coding assistants often miss with your projects?"
**WAIT** for user response
**CAPTURE** considerations and gotchas

### Action 2: Generate Folder Name

**DETERMINE** folder name NOW:
- If folder was provided: use the provided folder name
- Otherwise: Generate from feature description (kebab-case format)
  - Example: "user authentication system" → "user-authentication-system"

### Action 3: Create PRP File

**CREATE** the spec folder directory if it doesn't exist:
- **ENSURE** directory `.agents/specs/[folder-name]/` exists
- **USE** your directory creation capabilities

**CREATE** the PRP file at `.agents/specs/[folder-name]/1-requirements.md`:
- **USE** your file writing capability

```markdown
# Product Requirements Prompt (PRP)

## FEATURE:
[Insert the feature description gathered above]

## EXAMPLES:
[Insert any examples from the project, examples/ folder, or reference implementations that should be considered during development]

## DOCUMENTATION:
[Insert any documentation sources - web pages, MCP servers like Context7, API docs, etc. that will need to be referenced during development]

## OTHER CONSIDERATIONS:
[Insert any project-specific gotchas, constraints, or requirements that AI coding assistants often miss with your projects]

---
Created: [current date]
```

### Action 4: Report Completion

**REPORT**: ✅ PRP file created at `.agents/specs/[folder-name]/1-requirements.md`

**SUGGEST NEXT SKILL**: To proceed with specification generation in the same folder:
```
Use the spec-plan skill with folder=[folder-name]
```

**NOTE**: The spec-plan skill will create `2-plan.md` in the same folder as this requirements file

## Execution Reminder

**CRITICAL REMINDERS**:
- **ALWAYS CREATE THE FILE** using your file writing capability
- **ALWAYS REPORT** the saved file path
- **ALWAYS USE INTERACTIVE MODE** - wait for user responses
- **NEVER SKIP** the interactive gathering steps
- **CAPTURE ALL SECTIONS** - feature, examples, documentation, considerations
