---
title: "Tech Plan: Stacked-PR guidance in the code-shipping skills"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Stacked-PR guidance in the code-shipping skills

**Author**: Ethan Binder

**Objective**: Teach `/eng-manager`, `/engineer`, and `/release` to keep PRs small and, when work is large, to plan / build / ship it as a stack of small, ordered, independently-reviewable PRs.

**PRD & Design Link**:

---

## Problem Statement

The skills enforce one-branch-one-PR discipline but say nothing about what to do when a change is too big for one reviewable PR — so large work lands as monolithic diffs instead of stacks.

## Changes Made

- Added a **Stacked PRs** section to `skills/release/SKILL.md` (mechanics: `gh pr create --base <previous-branch>`, self-contained PRs with their own tech plans, stack position noted in the body, base-first merge order with retargeting).
- Added a **Stacked PRs** section to `skills/eng-manager/SKILL.md` (propose the stack split as part of the plan: named stages, base-branch order, independently verifiable slices).
- Added a **Stacked PRs** section to `skills/engineer/SKILL.md` (split oversized tasks so each piece maps to one stack entry; don't pile independent stages into one branch).
- Added one Shipping bullet to `CLAUDE.md`: large changes ship as stacked PRs — small, ordered, reviewable, merged base-first.

## Testing

N/A — markdown-only guidance additions with no runtime behavior. Manual smoke: each skill's new section renders under its own `## Stacked PRs` heading before `## Workflow`; this very PR stack (6 PRs, chained bases) follows the documented convention.

## Risks

- None material. Guidance is additive and consistent with the existing "each logical change gets its own branch and PR" rule.
