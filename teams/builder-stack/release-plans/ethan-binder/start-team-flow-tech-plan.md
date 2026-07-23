---
title: "Tech Plan: Three-option team prompt on fetch; drop the README welcome line"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Three-option team prompt on fetch; drop the README welcome line

**Author**: Ethan Binder

**Objective**: Make the post-fetch team prompt an explicit three-way choice (choose a team / create a new team / continue without one for now), re-ask once — skippably — when the user starts working, and remove the decorative README welcome line.

**PRD & Design Link**:

---

## Problem Statement

The team check offered only pick-or-create and never re-asked after a skip, so users who deferred the choice were never nudged again; and the README's "Welcome! 👋" line added fluff the Teams section below it already covers.

## Changes Made

- **`skills/start/SKILL.md`** — Phase 0 now presents exactly three options (choose / create / continue without); Phase 3 gains a deferred re-ask fired once when a Phase 0 skipper starts working, skippable again, after which the session stays quiet (template skills and `/data-analysis` still run their own team check only when they need an output home).
- **`skills/memory/question-registry.md`** — `start-team-select` row updated for the three options and the one-time deferred re-ask; default remains `skip`.
- **`.claude/hooks/post-git.sh`** — injected context now names the three options and drops the "welcome them" phrasing (string change only; hook logic untouched).
- **`README.md`** — deleted the "Welcome! 👋 Just cloned the repo?" line; the Teams section is unchanged.

## Testing

`bash -n .claude/hooks/post-git.sh` passes; `grep -c Welcome README.md` returns 0; manual read-through of `/start` confirms the Phase 0 → Phase 3 skip path is coherent.

## Risks

- One extra (skippable, silenceable via `/memory tune start-team-select never-ask`) interruption at first hand-off for users who deferred the team choice — intended behavior.
