#!/bin/bash

# Hook: Inject steering context instructions into Explore/Plan subagents
# Modifies the prompt to include steering file reading as the first step

INPUT=$(cat)

TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name')
SUBAGENT_TYPE=$(echo "$INPUT" | jq -r '.tool_input.subagent_type // empty')
ORIGINAL_PROMPT=$(echo "$INPUT" | jq -r '.tool_input.prompt // empty')
DESCRIPTION=$(echo "$INPUT" | jq -r '.tool_input.description // empty')

# Only inject for Task with Explore or Plan subagents
if [[ "$TOOL_NAME" == "Task" && "$SUBAGENT_TYPE" =~ ^(Explore|Plan)$ ]]; then

  # Skip if prompt already mentions context-prime (e.g., from /prime command)
  if [[ "$ORIGINAL_PROMPT" == *"context-prime"* ]]; then
    echo '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"allow"}}'
    exit 0
  fi

  # Build the modified prompt with steering instructions prepended
  STEERING_INSTRUCTION="IMPORTANT FIRST STEP: Use the context-prime skill with mode=quick to load project conventions relevant to your task. This will read the .agents/steering files and give you a brief summary of coding patterns and conventions to follow.

After loading context, proceed with the original task:

"

  # Escape the prompt for JSON
  MODIFIED_PROMPT=$(echo "${STEERING_INSTRUCTION}${ORIGINAL_PROMPT}" | jq -Rs '.')

  # Return modified tool input - preserve all original fields
  echo "{
    \"hookSpecificOutput\": {
      \"hookEventName\": \"PreToolUse\",
      \"permissionDecision\": \"allow\",
      \"updatedInput\": {
        \"subagent_type\": \"${SUBAGENT_TYPE}\",
        \"description\": \"${DESCRIPTION}\",
        \"prompt\": ${MODIFIED_PROMPT}
      }
    }
  }"
  exit 0
fi

# Allow all other tool calls unchanged
echo '{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "allow"
  }
}'
exit 0
