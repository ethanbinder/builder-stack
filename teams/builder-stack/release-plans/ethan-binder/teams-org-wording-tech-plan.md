---
title: "Tech Plan: Teams wording — every team within your company org"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Teams wording — "every team within your company org"

**Author**: Ethan Binder

**Objective**: State the scope of the teams convention explicitly: every team **within your company org** gets a workspace.

**PRD & Design Link**:

---

## Problem Statement

The root README's Teams section said "Every team gets a workspace…" without naming whose teams; the teams README said "at your company." Neither conveyed the org-wide scope the user wants.

## Changes Made

- `README.md` Teams section opening sentence → "Every team within your company org gets a workspace with the team name — …" (rest unchanged).
- `teams/README.md` opening line → "**Every team within your company org gets a workspace with the team name.**" for consistency.

## Testing

N/A — two-sentence wording change. `grep -n "company org" README.md teams/README.md` returns one hit each; tables and instructions untouched.

## Risks

- None.
