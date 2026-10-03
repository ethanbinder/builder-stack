---
title: "Tech Plan (small): Move the Builder Stack welcome out of the README"
author: "Ethan Binder"
date: 2026-10-03
---

# Tech Plan (small): Move the Builder Stack welcome out of the README

## Problem Statement

PR #6 put the Builder Stack welcome message in a visible "For AI assistants" block at the top of `README.md`. The welcome should be something the agent returns to the user, not README content. It also only fired after a fetch, not when someone simply started using the repo in a new session.

## Changes Made

- `README.md`: remove the "For AI assistants" block. The `/start` workflow row now says the welcome runs on a fetch *or* a new session in the repo.
- `CLAUDE.md`: Onboarding routes a new session with no concrete task (or a "what is this / how do I use it" question) to `/start` **Welcome mode**, which replies with the welcome message verbatim.
- `skills/start/SKILL.md`: Welcome-mode triggers are now (a) the post-git hook, (b) a new session without a concrete task, and (c) the user asking what Builder Stack is or how to use it. This replaces the README-dependent "AI fetched the GitHub URL" trigger. The description is updated to match.
- `skills/memory/question-registry.md`: the `start-team-select` description is updated to match.

## Testing

- `head README.md` shows the title followed by the bio, and `grep -c "For AI assistants" README.md` returns 0.
- The post-git hook is unchanged and still emits Welcome-mode context on `git fetch`.
- `git diff --check` passes.

## Risks

Low. An AI that reads the GitHub page without cloning no longer gets greeting instructions. That's intended: the welcome is now limited to agents running inside the repo.
