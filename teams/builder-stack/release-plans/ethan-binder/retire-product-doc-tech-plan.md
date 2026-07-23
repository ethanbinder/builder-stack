---
title: "Tech Plan: Retire /product-doc and wipe the legacy templates"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Retire `/product-doc` and wipe the legacy templates

**Author**: Ethan Binder

**Objective**: Complete the template overhaul — delete the monolithic `/product-doc` skill and the entire legacy `references/` template directory, leaving zero trace of the legacy launch-checklist naming anywhere in the repo, with every consumer rewired to the 11 standalone template skills added in the previous PR.

**PRD & Design Link**:

---

## Problem Statement

With the 11 standalone template skills landed, `/product-doc` and the 9 remaining `references/` template files are duplicative legacy — and they carry retired naming that must not appear anywhere in the repo.

## Changes Made

- Deleted `skills/product-doc/` and the entire `references/` directory (all 7 confluence templates including the legacy launch checklist, plus both tech-plan templates).
- `/eng-manager` now populates `skills/eng-tech-plan/template.md` in both full and small modes (one lightweight format: Author / Objective / PRD & Design Link / Problem Statement / Changes Made / Testing / Risks); all tech-plan path mentions in `/eng-manager` and `/release` generalized to "the resolved tech-plan path."
- `/start` and `/office-hours` hand-offs rerouted: the 0 → 1 lane is now `/office-hours` → `/strategic-one-pager` → `/product-spec` → `/eng-manager`; `office-hours-next-skill` registry default updated; `/data-insights` grounding text updated.
- `skills/memory/question-registry.md`: dropped all six `product-doc-*` rows (their asks died with the skill; team capture now lives in `start-team-select`).
- README: removed both `/product-doc` workflow rows and the row-count footnote (each remaining skill has exactly one row), updated the Try-them block and the `/start` row; CLAUDE.md: dropped the `references/` structure entry and the stale footnote wording.
- `skills/memory/builder-context.md` phase table updated to the new skill set.

## Testing

A case-insensitive repo-wide grep for the retired launch-checklist name (excluding `.git/`) returns zero hits — the hard requirement. `grep -rn "references/" skills/ README.md CLAUDE.md install.sh` returns zero repo-path hits. All remaining `product-doc/` strings are the documented user-project default output path, not repo files.

## Risks

- Users mid-flight with `/product-doc` muscle memory lose the command; the README workflow table and `/start` routing point at the replacement skills.
- External links into the deleted `references/` templates break; historical PR links pinned to commit SHAs remain valid.
