#!/bin/bash
set -euo pipefail

INPUT=$(cat)

# Match git pull / fetch / clone in the .tool_input.command field of the
# PostToolUse hook JSON. Regex is applied against raw input (no jq
# dependency). False positives would require another JSON field to contain
# the same pattern, which is vanishingly unlikely in PostToolUse payloads.
if echo "$INPUT" | grep -qE '"command":[[:space:]]*"[^"]*git[[:space:]]+(pull|fetch|clone)\b'; then
  cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"The user just pulled/fetched/cloned. Invoke the /start skill now — treat this as a new session: run its Phase 0 team check first (if a teams/ directory exists and no Team: fact is set, show the current team list from teams/README.md and offer three options: choose a team, create a new team, or continue without one for now), then greet from Phase 1 so the user can route into the right lane (0 → 1 or fast iteration) for whatever the pull surfaced."}}
EOF
fi
exit 0
