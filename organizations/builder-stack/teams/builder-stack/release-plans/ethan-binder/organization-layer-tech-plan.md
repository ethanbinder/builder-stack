---
title: "Tech Plan: Organization layer above teams"
author: Ethan Binder
date: 2026-11-23
---

# Tech Plan: Organization layer above teams

**Author**: Ethan Binder

**Objective**: Add an Organization level above teams, so a company can group teams by organization and keep org-wide docs in one place.

**PRD & Design Link**:

---

## Problem Statement

Teams were the top level of the hierarchy (`teams/<team>/`). A company with several organizations had no way to group its teams, and documents spanning several teams had no home.

## Changes Made

- **Layout** — `teams/` becomes `organizations/<organization>/teams/<team>/`. Each organization has a README (mission, Current Teams) and org-wide `strategy/` and `roadmap/` folders. The existing `builder-stack` team moves into a `builder-stack` organization with its history kept.
- **Templates** — new `organizations/_template/`; the team scaffold moves to `organizations/_template/teams/_template/`.
- **`skills/start/SKILL.md`** — Welcome mode and Phase 0 ask for the organization, then the team. Naming a team directly picks its organization too. Creating an organization also creates its first team. Creating never copies over an existing folder.
- **`skills/memory/builder-context.md`** — new "Finding the workspace" section resolves the `Organization:` and `Team:` facts, including a saved `Team:` with no organization and the older `teams/` layout. Adds the org-wide output rule.
- **`skills/memory/question-registry.md`** — new `start-organization-select` (two-way, default `skip`); `start-team-select` updated.
- **`skills/data-analysis`, `skills/eng-manager`, `skills/release`** — output and tech-plan paths.
- **`.claude/hooks/post-git.sh`** — detects Builder Stack by `organizations/README.md` or the older `teams/README.md`; injected text names organizations.
- **`CLAUDE.md`, `README.md`, `organizations/README.md`** — conventions, tables, and how to add or migrate.

## Testing

- `bash -n .claude/hooks/post-git.sh` passes. Run in throwaway repos: the new layout and the older layout both get the welcome text, an unrelated repo gets the generic text, and a non-git command gets nothing.
- The documented add-organization, add-team, and migration commands were run in copies and produced the expected folders, with no leftover `_template`.
- Relative links in `README.md` and `organizations/` were checked; none are broken by the move.
- The `/start` conversation itself has not been run end to end on the new text.

## Risks

- **Company clones** keep their teams in a top-level `teams/` after pulling this. Skills still read and write them there; `organizations/README.md` documents the move. Edits a clone made to files this change moves or deletes (such as its own `teams/README.md` table) may conflict on merge.
- **Old links** to files under `teams/` on `main` stop resolving. Links pinned to a commit SHA still work.
- **Untracked local Codex files** (`AGENTS.md`, `.codex/`) are not part of the repo and still describe `teams/`.
- Older tech plans still mention `teams/` paths; they are left as a historical record.
