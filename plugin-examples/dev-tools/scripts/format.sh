#!/bin/bash
# Auto-format script triggered after Write/Edit operations
# This script detects the project type and runs the appropriate formatter

# Get the file that was modified from the hook context
FILE="${CLAUDE_TOOL_ARG_FILE_PATH:-}"

if [ -z "$FILE" ]; then
    exit 0
fi

# Get file extension
EXT="${FILE##*.}"

# Check for formatters and run the appropriate one
format_file() {
    case "$EXT" in
        js|jsx|ts|tsx|json|css|scss|md|yaml|yml)
            if command -v prettier &> /dev/null; then
                prettier --write "$FILE" 2>/dev/null
            elif [ -f "node_modules/.bin/prettier" ]; then
                node_modules/.bin/prettier --write "$FILE" 2>/dev/null
            fi
            ;;
        py)
            if command -v black &> /dev/null; then
                black --quiet "$FILE" 2>/dev/null
            elif command -v ruff &> /dev/null; then
                ruff format "$FILE" 2>/dev/null
            fi
            ;;
        go)
            if command -v gofmt &> /dev/null; then
                gofmt -w "$FILE" 2>/dev/null
            fi
            ;;
        rs)
            if command -v rustfmt &> /dev/null; then
                rustfmt "$FILE" 2>/dev/null
            fi
            ;;
    esac
}

# Only format if file exists and is a regular file
if [ -f "$FILE" ]; then
    format_file
fi

exit 0
