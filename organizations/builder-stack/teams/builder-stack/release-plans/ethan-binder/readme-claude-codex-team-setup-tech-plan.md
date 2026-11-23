---
title: "Tech Plan (small): README — name Claude and Codex in guided team creation"
author: "Ethan Binder"
date: 2026-07-23
---

# Tech Plan (small): README — name Claude and Codex in guided team creation

## Problem Statement

The root `README.md` describes the guided team-creation flow as a Claude-only option and leads with manual scaffolding commands. Builder Stack supports the same `/start` workflow in Claude and Codex, so the copy does not accurately represent the available guided path.

## Changes Made

- `README.md` — make the guided workflow the primary team-creation path, name both Claude and Codex, and keep the link to `teams/README.md` for full instructions.

## Testing

Docs-only change. Confirm the old wording is absent, the replacement appears once, Markdown links still resolve, and `git diff --check` passes.

## Risks

Low — this changes documentation only and does not alter team scaffolding, hooks, or `/start` behavior.
