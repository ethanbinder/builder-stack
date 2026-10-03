---
title: "Tech Plan (small): Builder Stack welcome message on every fetch"
author: "Ethan Binder"
date: 2026-10-03
---

# Tech Plan (small): Builder Stack welcome message on every fetch

## Problem Statement

After someone fetches the Builder Stack repo, the AI shows a generic "What are you building?" greeting. It only shows a team prompt when no team is saved. Nothing introduces Builder Stack as a company-wide Team OS. An AI that reads the GitHub page (e.g. "fetch https://github.com/ethanbinder/builder-stack" in chat) gets no greeting instructions at all.

## Changes Made

- `skills/start/SKILL.md`: new **Welcome mode** holding the canonical welcome message, which shows on every fetch of the Builder Stack repo along with the team picker (use an existing team or create a new one). The reply routes into the existing Phase 0 choose/create logic and then Phase 2/3 lane routing. The re-greet rule now branches on Builder Stack repo vs. other repos.
- `.claude/hooks/post-git.sh`: detects the Builder Stack repo (or a company clone/fork) by its files (`skills/start/SKILL.md` + `teams/README.md`). In that repo it emits Welcome-mode context. Every other repo keeps the existing context unchanged, which matters because `install.sh` installs this hook globally.
- `README.md`: a "For AI assistants" block at the top with the welcome message inline, so web fetchers greet the same way. The `/start` workflow row, the "Adding a team?" paragraph and installer step 3 are updated to match.
- `CLAUDE.md`: the Onboarding section names Welcome mode.
- `skills/memory/question-registry.md`: the `start-team-select` description notes the Welcome-mode behavior.

## Testing

- `echo '{"tool_input":{"command":"git fetch origin"}}' | .claude/hooks/post-git.sh` inside the repo prints the Welcome-mode context.
- The same command from `/tmp` (not Builder Stack) prints the original context.
- A non-git command prints nothing (exit 0).
- `git diff --check` passes.

## Risks

Low.
- The hook still matches its regex against the raw command text, so a command that merely contains "git fetch" (e.g. in a heredoc) can trigger the welcome. This behavior predates the change.
- The README block depends on web-fetching AIs choosing to follow it. Some assistants treat repo content as untrusted and may ignore it.
- Local Codex copies of the hook (e.g. an untracked `.codex/hooks/post-git.sh`) must be re-copied to pick up the change.
