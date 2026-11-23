---
title: "Tech Plan: Root cleanup — relocate shared files, retire root product-doc/"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Root cleanup — relocate shared files, retire root `product-doc/`

**Author**: Ethan Binder

**Objective**: Slim the repo root to `teams/`, `skills/`, `README.md`, `install.sh` (plus `CLAUDE.md`, `LICENSE`, and hidden `.claude/`) by relocating the shared support files and retiring the root `product-doc/` folder, without breaking any skill.

**PRD & Design Link**:

---

## Problem Statement

The repo root carried three support folders (`docs/`, `references/`, `product-doc/`) that predate the teams-workspace structure. The shared context and question registry belong with the `/memory` skill that owns them (and travel with the skill-symlink install); setup docs belong under `.claude/`; and the repo's own tech plans now have a proper home in its team workspace.

## Changes Made

- Moved `docs/` → `.claude/docs/`; updated the two skills that read `google-workspace-setup.md` (`/deck`, `/product-doc`).
- Moved `references/builder-preamble.md` → `skills/memory/builder-context.md` and `references/question-registry.md` → `skills/memory/question-registry.md`; swept every path mention across all 13 SKILL.md files, `CLAUDE.md`, and `README.md`. (The 9 doc templates stay in `references/` until the template-skills PRs later in this stack retire them.)
- `/release` and `/eng-manager` now honor a CLAUDE.md-specified tech-plan path, defaulting to `product-doc/04b-tech-plan.md` when none is specified — no behavior change for other repos.
- This repo's `CLAUDE.md` sets the tech-plan path to `teams/builder-stack/release-plans/<author>/<title>-tech-plan.md`; updated its Structure section and lockstep rule accordingly.
- Deleted root `product-doc/` (its one artifact was migrated into the team workspace in PR 1 of this stack; historical PR links use commit-SHA URLs and remain valid). This file is the first tech plan at the new path.
- Reworded installer step 2 and the matching README bullet (no functional change — the step still adds the repo root to `additionalDirectories`).

## Testing

`bash -n install.sh` passes; `bash -n .claude/hooks/post-git.sh` passes. `grep -rn "references/builder-preamble\|references/question-registry" skills/ CLAUDE.md README.md install.sh` returns nothing. Root listing shows only `teams/`, `skills/`, `README.md`, `install.sh`, `CLAUDE.md`, `LICENSE` (+ `.claude/`).

## Risks

- Users with sessions started before this merge could reference the old `references/` paths from stale context; self-heals on next session since skills re-read their SKILL.md.
- The CLAUDE.md tech-plan-path override is new surface in `/release`/`/eng-manager`; scoped to a single sentence with the default unchanged, so repos without an override are unaffected.
