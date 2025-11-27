# Devkit

Injects steering context instructions into Explore/Plan subagents automatically.

## What It Does

When you use Task tool with Explore or Plan subagents, devkit automatically prepends instructions to read `.agents/steering` files first. This ensures subagents follow project patterns and conventions.

## Installation

```shell
/plugin install devkit@agronod-plugins
```

## How It Works

Uses a `PreToolUse` hook that:

1. Intercepts Task tool calls targeting Explore or Plan subagents
2. Prepends steering context reading instructions to the prompt
3. Allows all other tool calls unchanged

## Components

- **Hook:** `PreToolUse` on Task tool
- **Script:** `scripts/check-steering-read.sh`

## Requirements

This plugin is most useful when your project has `.agents/steering` context files.
