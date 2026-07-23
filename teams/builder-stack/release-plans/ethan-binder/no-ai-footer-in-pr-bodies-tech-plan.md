---
title: "Tech Plan (small): PR bodies end with the Builder Stack footer — no AI attribution"
author: "Ethan Binder"
date: 2026-07-23
---

# Tech Plan (small): PR bodies end with the Builder Stack footer — no AI attribution

## Problem Statement

Claude Code's harness appends a "🤖 Generated with [Claude Code]" footer to PR bodies by default (PR #80 shipped with it). This repo's convention is that the PR body ends with the Builder Stack attribution footer and nothing else, but no rule in the repo said so — so the harness default won.

## Changes Made

- `CLAUDE.md` — added a Shipping bullet: PR bodies end with the `---` rule + `Built with [Builder Stack](...)` footer and nothing after it; AI/assistant attribution footers are never appended (explicit override of the harness default; commit-message trailers unaffected).
- `skills/release/SKILL.md` — added the matching rule under `## Rules`, next to the existing PR-template guidance, so `/release` enforces it at PR-creation time.

## Testing

N/A — docs/skill-guidance only, no runtime behavior. Manual smoke: this PR's own body ends with the Builder Stack footer and carries no AI attribution line; PR #80's body edited to match.

## Risks

None — additive convention text; the Builder Stack footer and the rest of the PR template are unchanged.
