---
title: "Tech Plan: Remove skills/product-doc resurrected by a stacked-merge conflict"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Remove `skills/product-doc` resurrected by a stacked-merge conflict

**Author**: Ethan Binder

**Objective**: Delete the orphaned `skills/product-doc/SKILL.md` that a modify/delete conflict resolution re-added to `main` while squash-merging the 8-PR restructure stack.

**PRD & Design Link**:

---

## Problem Statement

PR #73 deleted `skills/product-doc/`, but merging the stack's later branches with `main` hit a modify/delete conflict on `skills/product-doc/SKILL.md` (modified by PR #71's path sweep on `main`, deleted in the branch), and the resolution re-staged the working-tree copy. `main` ended up with a single orphaned legacy file that carries retired template paths and naming; nothing references it.

## Changes Made

- Deleted `skills/product-doc/` (one file, `SKILL.md`). No other file mentions the skill — routing, registry, README, and CLAUDE.md were already rewired in PR #73.

## Testing

Repo-wide greps after deletion: retired-checklist naming → 0 hits; `references/` repo paths in skills/README/CLAUDE.md/install.sh → 0 hits; `skills/` contains 24 directories; `bash -n install.sh` passes.

## Risks

- None — the file was unreachable dead weight; removing it restores exactly the state PR #73 shipped.
