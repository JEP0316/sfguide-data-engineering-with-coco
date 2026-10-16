#!/bin/bash
# validate-bash.sh — PreToolUse hook for the bash tool.
# Blocks dbt commands that target production (--target prod / --target=prod / -t prod).
INPUT=$(cat)

# Collapse whitespace so the check works regardless of JSON formatting.
FLAT=$(printf '%s' "$INPUT" | tr '\n\t' '  ')

if printf '%s' "$FLAT" | grep -Eq '(^|[^A-Za-z0-9_])dbt([^A-Za-z0-9_]|$)' &&
   printf '%s' "$FLAT" | grep -Eq '(--target[ =]+|-t +)prod([^A-Za-z0-9_]|$)'; then
  REASON="Blocked: direct production dbt runs are not allowed. Do not use --target prod locally; deploy to production through the CI/CD pipeline instead (open a PR to main)."
  # Block via JSON on stdout with exit 0: JSON output is only honored on a successful exit,
  # and a wrapper shell (e.g. PowerShell) can rewrite exit 2 to 1, which is treated as a non-blocking error.
  printf '{"decision":"block","reason":"%s","hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"%s"}}\n' "$REASON" "$REASON"
  exit 0
fi

exit 0
