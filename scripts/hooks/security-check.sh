#!/bin/bash
set -e

INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.toolName')
TOOL_ARGS=$(echo "$INPUT" | jq -r '.toolArgs')

# --- Block dangerous shell commands ---
if [ "$TOOL_NAME" = "bash" ]; then
  COMMAND=$(echo "$TOOL_ARGS" | jq -r '.command')

  # Pattern list of dangerous operations
  if echo "$COMMAND" | grep -qE "rm -rf /|sudo |mkfs\.|format |DROP TABLE|TRUNCATE TABLE"; then
    echo '{"permissionDecision":"deny","permissionDecisionReason":"Blocked: destructive system command detected"}'
    exit 0
  fi

  # Block commands that could leak secrets
  if echo "$COMMAND" | grep -qE "printenv|env\b|cat.*\.env|echo.*SECRET|echo.*TOKEN|echo.*PASSWORD"; then
    echo '{"permissionDecision":"deny","permissionDecisionReason":"Blocked: potential secret exposure"}'
    exit 0
  fi
fi

# --- Restrict file edits to allowed directories ---
if [ "$TOOL_NAME" = "edit" ] || [ "$TOOL_NAME" = "create" ]; then
  FILE_PATH=$(echo "$TOOL_ARGS" | jq -r '.path // empty')

  if [ -n "$FILE_PATH" ]; then
    # Only allow edits in src/, test/, and docs/
    if [[ ! "$FILE_PATH" =~ ^(src/|test/|docs/) ]]; then
      echo "{\"permissionDecision\":\"deny\",\"permissionDecisionReason\":\"Edits restricted to src/, test/, and docs/ directories\"}"
      exit 0
    fi
  fi
fi

# Allow everything else
