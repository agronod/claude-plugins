# Devkit

Development toolkit with AI-powered specification, implementation, testing, and git workflows.

## Features

### Skills (12 total)

#### Context Management
- **context-prime** - Load project context for AI understanding with purpose-based relevance
- **context-update** - Generate AI-optimized convention documentation in `.agents/steering`
- **project-init** - Initialize AI-friendly project with CLAUDE.md and steering docs

#### Specification Workflow
- **spec-prp** - Create Product Requirements Prompt for structured requirements gathering
- **spec-plan** - Create high-level specification and planning for features
- **spec-implement** - Create detailed implementation plan then execute code generation

#### Testing
- **test-generate** - Generate comprehensive tests using integration-first philosophy

#### Git Workflow
- **git-commit** - Create git commits with conventional commit messages
- **git-pr** - Create pull requests with structured WHY-HOW descriptions

#### Utilities
- **help** - AI method selector for optimal problem-solving approaches
- **record** - Create and maintain scratchpads for information recording
- **feedback** - GitHub issue helper for reporting bugs and suggestions

### Agents (2 total)

- **code-explorer** - Deep codebase analysis agent for discovering patterns and architecture
- **git-analyzer** - Git history analysis agent for understanding changes and evolution

### Hooks

- **PreToolUse** on Task tool - Automatically injects steering context into Explore/Plan subagents

## Installation

```shell
/plugin install devkit@agronod-plugins
```

## Skill Usage Examples

### Initialize a new project
```
Use the project-init skill to set up AI-friendly documentation
```

### Create a specification
```
Use the spec-plan skill to create a specification for user authentication
```

### Generate tests
```
Use the test-generate skill to create integration tests for src/services/
```

### Create a commit
```
Use the git-commit skill to commit my staged changes
```

### Create a pull request
```
Use the git-pr skill to create a PR for this branch
```

## Workflow Example

A typical feature development workflow using devkit:

1. **Load context**: Use `context-prime` to understand the project
2. **Gather requirements**: Use `spec-prp` if requirements are unclear
3. **Plan**: Use `spec-plan` to create a high-level specification
4. **Implement**: Use `spec-implement` to generate detailed plan and code
5. **Test**: Use `test-generate` to create integration tests
6. **Commit**: Use `git-commit` to commit with conventional messages
7. **PR**: Use `git-pr` to create a structured pull request

## Directory Structure

```
plugins/devkit/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   ├── context-prime/SKILL.md
│   ├── context-update/SKILL.md
│   ├── project-init/SKILL.md
│   ├── spec-plan/SKILL.md
│   ├── spec-implement/SKILL.md
│   ├── spec-prp/SKILL.md
│   ├── git-commit/SKILL.md
│   ├── git-pr/SKILL.md
│   ├── test-generate/SKILL.md
│   ├── help/SKILL.md
│   ├── record/SKILL.md
│   └── feedback/SKILL.md
├── agents/
│   ├── code-explorer.md
│   └── git-analyzer.md
├── resources/
│   ├── claude-md-template.md
│   └── pr-description.md
├── hooks/
│   └── hooks.json
├── scripts/
│   └── check-steering-read.sh
└── README.md
```

## Requirements

- Claude Code CLI with plugin support
- Git for commit and PR skills
- GitHub CLI (`gh`) for PR creation (optional, for GitHub repos)

## Related

- Creates documentation in `.agents/steering/` directory
- Specifications stored in `.agents/specs/` directory
- Scratchpads stored in `.agents/scratchpads/` directory
