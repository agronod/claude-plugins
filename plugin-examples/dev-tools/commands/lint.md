---
description: Run linting on the current project
---

# Lint Command

Run the project's configured linter to check code quality.

## Instructions

1. First, detect the project type by checking for configuration files:
   - `package.json` with eslint config → Run `npm run lint` or `npx eslint .`
   - `pyproject.toml` or `setup.cfg` with flake8/pylint → Run appropriate Python linter
   - `.golangci.yml` → Run `golangci-lint run`
   - `Cargo.toml` → Run `cargo clippy`

2. If no linter is configured, suggest setting one up based on the project language.

3. Parse the linting output and provide a summary:
   - Total number of errors/warnings
   - Group issues by file
   - Highlight critical issues

4. If the user wants, offer to fix auto-fixable issues (e.g., `eslint --fix`).

## Example Output

```
Linting complete:
- 3 errors, 12 warnings across 5 files
- Critical: 2 unused variables in src/utils.ts
- Run with --fix to auto-correct 8 issues
```
