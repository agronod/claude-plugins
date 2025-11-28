---
description: USE THIS SKILL when setting up AI-readable documentation for a codebase, documenting conventions for consistent AI contributions, creating task-specific context chunks, updating documentation as codebase evolves, migrating from flat to hierarchical structure, or applying targeted patches to existing documentation
---

# Generate AI Context Documentation

## Required Information

### Optional
- **patch**: Targeted patch description for updating steering documentation. Use this when you want to make specific improvements or corrections without a full codebase scan.

If the user specifies what to update, use that as the patch description. Otherwise, perform a full analysis.

## Instructions

### Phase 1: Determine Mode & Extract Timestamp

**MAP** .agents/steering 3 level structure (Priority: 1. tree, 2. find)

**DETECT MODE**:
- No .agents/steering/ → **initial** (full analysis)
- Only flat .md files (ARCHITECTURE.md, etc.) → **migrate** (transform structure)
- BOTH flat files AND domain folders → **migrate** (fix broken migration)
- Only domain folders with context.md files → **incremental** (update)

**EXTRACT TIMESTAMP AND COMMIT** (for incremental mode):
- Read .agents/steering/CONTEXT.md
- Find line starting with "Generated: " and store timestamp (e.g., "2025-09-16")
- Find line starting with "Commit: " and store commit SHA (if present)
- If no commit SHA found, use timestamp to find commit with git log

### Phase 2: Analyze Codebase

#### 2a. Map Structure

**IF initial OR migrate**:
- Find README and source code files to understand project structure
- List root directory contents to understand project organization
- Understand project organization (monolith, client/server, microservices, layers)
- Identify natural domain boundaries

**IF incremental**:

If a patch description was provided:
- **THINK HARD** about patch description
- **IDENTIFY** which domains/aspects are affected by this change
- **MAP** description keywords to .agents/steering/ domains and subdirectories
- **DETERMINE** which context.md files need updating

If no patch description:
- **USE TIMESTAMP AND COMMIT** from Phase 1 to find changes:
  - **FIND BASE COMMIT**: Run `git log --until="[timestamp]" --format="%H" -n 1` to get commit SHA at last update
  - **GET NET CHANGES**: Run `git diff --name-status [base-commit]..HEAD` to see actual file changes (A=Added, M=Modified, D=Deleted, R=Renamed)
  - **ANALYZE SCOPE**: Run `git diff --stat [base-commit]..HEAD` for change magnitude
  - Filter for source files (exclude .agents/, docs, tests unless patterns changed)
  - Map changed files to domains based on file paths

**THINK HARD** about whether current structure still fits:
- Does the domain organization still match codebase boundaries?
- Do changed files suggest new architectural patterns needing new aspects?
- Would any existing context.md files benefit from splitting or merging?
- Do folder names still align with current codebase terminology?

**Decide**:
- **KEEP STRUCTURE**: Current organization is still optimal → proceed with content updates only
- **RESTRUCTURE**: Changes reveal structural improvements needed → specify:
  - SPLIT: Which files to split and into what subfolders
  - MERGE: Which related files to consolidate
  - ADD: New aspect folders needed
  - RENAME: Folders to rename for clarity

**State your decision explicitly** before proceeding to content updates.

- **READ EXISTING CONTEXT** for affected domains
- **SKIP** unchanged domains entirely

#### 2b. Read Foundations (initial/migrate only)

**IF initial OR migrate**:
- Package manifest (package.json, go.mod, requirements.txt, Cargo.toml)
- README.md for project overview
- Main config files (*.config.*, .eslintrc, etc.)
- Extract primary language, frameworks, build commands

**IF incremental**:
- SKIP this step - already documented
- Only read if foundations themselves changed

#### 2c. Selective Pattern Extraction

**IF initial OR migrate**:
- Read files that best represent conventions:
  - Recently modified core files → current conventions
  - Test files → testing patterns
  - API/handler files → interface patterns
  - Main/index file → application structure
  - Key domain files → business logic patterns

**IF incremental**:
- **ONLY READ CHANGED FILES** from git diff
- **COMPARE** with existing documentation
- **EXTRACT PATTERNS** only from changed areas

### Phase 3: Generate Documentation

#### Structure Creation (initial/migrate only)

**CREATE** two-level hierarchy:
```
.agents/steering/
├── [domain]/                      # Natural boundary
│   ├── overview/context.md        # Architecture, structure
│   ├── patterns/context.md        # General patterns
│   ├── patterns-async/context.md  # If async patterns are extensive
│   ├── testing/context.md         # Test approach
│   └── [aspect]/context.md        # Other aspects if needed
```

**CRITICAL RULES**:
- ALL files MUST be named `context.md`
- NO other filenames allowed
- NEVER put context.md directly in domain folder - ALWAYS use subdirectories
- If content too large, split using subfolders (patterns-async/, patterns-auth/)
- NO empty folders - only create if you have content
- Each context.md should be 500-1500 tokens ideally

#### Content Generation

**FOR EACH** context.md, **DECIDE** format based on complexity:

**Simple patterns** → File references:
```markdown
## Naming Convention
- Functions: camelCase
- Files: kebab-case
- See: src/utils/*.ts for examples
```

**Complex patterns** → Code examples:
```markdown
## Error Handling Pattern
\`\`\`typescript
try {
  const result = await operation();
  return { success: true, data: result };
} catch (error) {
  logger.error('Operation failed', error);
  return { success: false, error: error.message };
}
\`\`\`
Used in: src/handlers/*.ts
```

**WRITE** each context.md with:
```markdown
# [Topic]
Keywords: [search terms]

## Conventions
[Pattern with appropriate format based on complexity]

## Rules
- MUST: [required conventions]
- PREFER: [recommended approaches]
- AVOID: [anti-patterns]

## References
- Key files: [paths to study]
- Related contexts: [other relevant files]
```

#### Parallel Execution

**CRITICAL**: Execute all operations in parallel!
- Write all context.md files simultaneously using multiple Write tool calls
- Execute all updates in parallel using Edit operations

### Phase 4: Cleanup & Finalize

**IF migrate mode**:
**LIST** files to remove (all flat .md files in .agents/steering/ root)

**CREATE/UPDATE** .agents/steering/CONTEXT.md (if not a patch):
```markdown
# AI Context Documentation
Generated: [current date and time in YYYY-MM-DD hh:mm format]
Commit: [current HEAD commit SHA from git rev-parse HEAD]
Mode: [initial|migrate|incremental]

## Last Updated
- Updated: [domains that were updated]
- Structure: [kept as-is OR list changes]
- Files analyzed: [count]

## Structure
- [domain]: [brief description]

## Usage
Load with context-prime skill for task-specific context.
```

**REPORT** completion:
```
Context documentation complete

Mode: [initial|migrate|incremental]

Documentation structure:
- Domains: [list]
- Context files: [count]

Key conventions documented:
- [top 3-5 patterns found]

[If migrate mode] Files to remove:
- [list flat .md files in .agents/steering/ root]
```

## Critical Reminders

- ALL files MUST be named context.md (use folders for organization)
- NO empty folders - only create folders with content
- Split large content using hyphenated folders (patterns-async/, patterns-auth/)
- DETECT mixed state (flat + domains) as migration needed
- REPORT old files that need deletion after migration
- REMOVE FLAT FILES after migration to avoid confusion

## Incremental Mode Efficiency

**CRITICAL for incremental updates**:
- **NEVER** re-read unchanged files
- **ALWAYS** use timestamp from CONTEXT.md to detect changes
- **ONLY** analyze files that changed since last update
- **PRESERVE** existing documentation for unchanged domains
- **UPDATE** only affected context.md files
- This reduces file reads by ~90% on typical updates
