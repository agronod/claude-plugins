---
description: Format code files in the current project
---

# Format Command

Run the project's code formatter to ensure consistent style.

## Instructions

1. Detect the formatter by checking for configuration files:
   - `package.json` with prettier → Run `npx prettier --write .`
   - `.prettierrc` → Run prettier
   - `pyproject.toml` with black/ruff → Run `black .` or `ruff format .`
   - `rustfmt.toml` or Rust project → Run `cargo fmt`
   - `.clang-format` → Run `clang-format`
   - Go project → Run `go fmt ./...`

2. If no formatter is configured:
   - Suggest a formatter based on project type
   - Offer to set up a basic configuration

3. Run the formatter and report:
   - Number of files formatted
   - Any files that couldn't be formatted
   - Suggest adding format check to CI if not present

## Options

If the user specifies a path, only format that file or directory:
- `/format src/` - Format only the src directory
- `/format file.ts` - Format a specific file

## Example Output

```
Formatting complete:
- 12 files formatted
- Using Prettier with project config
- Skipped: node_modules, dist
```
