---
title: "Tech Plan (small): Link personal website in README bio"
author: "Ethan Binder"
date: 2026-10-03
---

# Tech Plan (small): Link personal website in README bio

## Problem Statement

The README bio links only to Ethan's GitHub. Readers have no pointer to his personal website.

## Changes Made

- `README.md` — extend the bio's closing parenthetical to `(View Ethan's GitHub and personal website: ethanbinder.com)`, with `ethanbinder.com` hyperlinked to https://ethanbinder.com.

## Testing

README-only change. Confirm the line renders with both links and `git diff --check` passes.

## Risks

None. Single-line copy change; no skill behavior affected.
