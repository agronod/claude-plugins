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

  # Build the modified prompt with steering instructions prepended
  STEERING_INSTRUCTION="IMPORTANT FIRST STEP: Before doing anything else, read the relevant .agents/steering files to understand project patterns and conventions. Use Glob to find files in .agents/steering/**/* then Read the domain-relevant context files (e.g., backend/patterns/context.md for API work, frontend/ for UI work).

After reading steering context, proceed with the original task:

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
