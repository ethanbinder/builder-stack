#!/bin/bash
set -euo pipefail

INPUT=$(cat)

# Match git pull / fetch / clone in the .tool_input.command field of the
# PostToolUse hook JSON. Regex is applied against raw input (no jq
# dependency). False positives would require another JSON field to contain
# the same pattern, which is vanishingly unlikely in PostToolUse payloads.
if echo "$INPUT" | grep -qE '"command":[[:space:]]*"[^"]*git[[:space:]]+(pull|fetch|clone)\b'; then
  # Detect the Builder Stack repo (or a company clone/fork of it) by its
  # files rather than its remote URL, so renamed clones still match.
  ROOT=$(git rev-parse --show-toplevel 2>/dev/null || true)
  if [ -n "$ROOT" ] && [ -f "$ROOT/skills/start/SKILL.md" ] && { [ -f "$ROOT/organizations/README.md" ] || [ -f "$ROOT/teams/README.md" ]; }; then
    cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"The user just pulled/fetched/cloned the Builder Stack repo. Invoke the /start skill now in Welcome mode: reply with the Builder Stack welcome message from skills/start/SKILL.md verbatim, filling in [organization list] from the Current Organizations table in organizations/README.md (leaving out the example-org-* examples), or following the skill's older-clone fallback if that file is missing (mark the saved Organization: fact as the current organization if one is set). Show it every time, even if an organization and team are already set, then act on the reply per Welcome mode."}}
EOF
  else
    cat <<'EOF'
{"hookSpecificOutput":{"hookEventName":"PostToolUse","additionalContext":"The user just pulled/fetched/cloned. Invoke the /start skill now — treat this as a new session: run its Phase 0 organization and team check first (if an organizations/ directory, or a legacy teams/ directory, exists and no Team: fact is set, ask which organization, then which team, offering three options each time: choose, create new, or continue without one for now), then greet from Phase 1 so the user can route into the right lane (0 → 1 or fast iteration) for whatever the pull surfaced."}}
EOF
  fi
fi
exit 0
