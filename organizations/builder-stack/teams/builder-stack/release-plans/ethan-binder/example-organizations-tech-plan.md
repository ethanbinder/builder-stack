---
title: "Tech Plan: Example organizations and teams"
author: Ethan Binder
date: 2026-11-23
---

# Tech Plan: Example organizations and teams

**Author**: Ethan Binder

**Objective**: Let people click from organizations, to an organization, to its teams, with examples to look at.

**PRD & Design Link**:

---

## Problem Statement

`organizations/` listed one organization with one team, below a long explanation, so the hierarchy was hard to see by clicking through it.

## Changes Made

- **`organizations/example-org-a`, `-b`, `-c`** — three example organizations, each with `example-team-a`, `-b`, and `-c`, made with the documented template commands (99 scaffold READMEs).
- **`organizations/README.md`** — the organization list comes first and links to each one, and it says what the examples are and how to remove them.
- **Organization READMEs and template** — Current Teams links each team by name, with what it owns.
- **`README.md`** — the Organizations table has one row per organization with linked teams.
- **`skills/start/SKILL.md`, `.claude/hooks/post-git.sh`, `skills/memory/builder-context.md`** — leave `example-org-*` out of the organization picker and workspace lookup, so nobody saves real docs to an example.

## Testing

Relative links in `README.md` and `organizations/` were checked; the only miss is a literal `...` in an older tech plan. A script confirmed the tables match the folders at every level. `bash -n` passes on the hook and its output is valid JSON. The `/start` conversation was not re-run.

## Risks

- Copies of the repo start with 99 example files. They can be deleted in one step, along with their table rows.
- Someone naming a real organization `example-org-*` would not see it in the picker.
