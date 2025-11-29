# Devkit

Development toolkit with AI-powered specification, implementation, testing, and git workflows.

## Features

### Skills (13 total)

#### Context Management

- **context-prime** - Loads project documentation from `.agents/steering/` to give Claude context about your codebase. Supports `quick` mode (brief summary, continue with task) or `full` mode (comprehensive analysis with confidence assessment). Use before starting work on unfamiliar projects.

- **steering-sync** - Generates AI-optimized convention documentation in `.agents/steering/`. Analyzes your codebase to extract patterns, architecture decisions, and coding standards into structured markdown that context-prime can load.

- **project-init** - Initializes a project with AI-friendly documentation: creates CLAUDE.md with project-specific instructions and sets up the `.agents/` directory structure. Use when starting AI collaboration on a new codebase.

#### Specification Workflow

- **spec-requirements** - Interactively gathers requirements through structured prompts: feature description, examples, documentation sources, and project-specific considerations. Creates a PRP file at `.agents/specs/[name]/1-requirements.md`.

- **spec-plan** - Creates a high-level specification from requirements or a description. Loads project context, assesses confidence, and produces a lean spec with summary, technical approach, success criteria, and implementation phases. Saves to `.agents/specs/[name]/2-plan.md`.

- **spec-implement** - Takes a specification and creates detailed implementation code. Reads the spec, breaks it into tasks, and generates production-ready code following project patterns.

#### Testing

- **test-generate** - Generates tests using an integration-first philosophy: real implementations for internal code, mocks only for external dependencies (APIs, databases). Analyzes code complexity to select optimal test strategy. Supports Jest, Vitest, pytest, xUnit, and auto-detection.

#### Git Workflow

- **git-commit** - Analyzes staged changes and generates a conventional commit message (feat/fix/docs/refactor/test/chore). Shows diff summary, proposes message, and waits for confirmation. Detects breaking changes and multi-file refactors.

- **git-pr** - Creates a pull request with structured WHY-HOW description. Analyzes branch changes, generates summary and test plan, pushes if needed, and creates PR via GitHub CLI.

#### Research

- **research** - Researches topics by launching parallel subagents. Breaks the topic into questions, each agent researches independently using Context7/GitHub MCP/WebSearch, then synthesizes findings into recommendations. Supports quick/standard/thorough depth levels.

#### Utilities

- **help** - AI method selector for when you're stuck. Analyzes your problem and recommends optimal approaches: thinking modes, memory strategies, agent patterns, or workflow combinations. Use when you don't know where to start.

- **record** - Creates and maintains scratchpads in `.agents/scratchpads/`. Use to track investigations, decisions, research notes, or any information you want to persist across sessions.

- **feedback** - Helps report bugs or suggestions for the plugin. Guides you through creating a GitHub issue with proper structure.

### Agents (1 total)

- **researcher** - External research agent for answering questions using web, documentation, and code sources

### Commands (6 total)

- `/devkit:prime` - Load project context
- `/devkit:sync` - Update AI steering documentation
- `/devkit:init` - Initialize project with CLAUDE.md
- `/devkit:commit` - Create conventional commit
- `/devkit:pr` - Create pull request
- `/devkit:research` - Research a topic

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

### Research a topic

```
Use the research skill to research best practices for OAuth2 in Next.js
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
2. **Research**: Use `research` to gather information on unfamiliar topics
3. **Gather requirements**: Use `spec-requirements` if requirements are unclear
4. **Plan**: Use `spec-plan` to create a high-level specification
5. **Implement**: Use `spec-implement` to generate detailed plan and code
6. **Test**: Use `test-generate` to create integration tests
7. **Commit**: Use `git-commit` to commit with conventional messages
8. **PR**: Use `git-pr` to create a structured pull request

## Requirements

- Claude Code CLI with plugin support
- Git for commit and PR skills
- GitHub CLI (`gh`) for PR creation (optional, for GitHub repos)

## Related

- Creates documentation in `.agents/steering/` directory
- Specifications stored in `.agents/specs/` directory
- Scratchpads stored in `.agents/scratchpads/` directory
