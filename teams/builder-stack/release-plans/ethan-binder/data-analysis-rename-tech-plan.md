---
title: "Tech Plan: Rename /data-insights to /data-analysis; add the team dashboards home"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Rename `/data-insights` → `/data-analysis`; add the team dashboards home

**Author**: Ethan Binder

**Objective**: Rename the `/data-insights` skill to `/data-analysis`, and give every team workspace a `data-analysis/` folder that holds analysis briefs **and** the team's key metrics dashboards.

**PRD & Design Link**:

---

## Problem Statement

The skill's name is changing to `/data-analysis`, and teams had no designated home for the metrics dashboards their analyses produce and rely on — dashboard links lived in chat threads and bookmarks.

## Changes Made

- `git mv skills/data-insights skills/data-analysis`; frontmatter and headings renamed; the skill's output is now teams-aware — briefs go to `teams/<team>/data-analysis/<author>/<title>.md` with frontmatter (fallback `product-doc/01b-data-analysis.md` in repos without `teams/`), and a new final step registers surfaced dashboards in the team's dashboards table.
- Added `data-analysis/` to the team workspace (9 folders now): new READMEs in `teams/_template/` and `teams/builder-stack/` following the standard doc-type pattern plus a team-level **Key Metrics Dashboards** table (Dashboard | Link | Owner | What it answers); tree diagram in `teams/README.md` and folder tables in both team READMEs updated.
- Swept `/data-insights` mentions in `README.md`, `skills/memory/builder-context.md` (phase table; plus a `data-analysis/` output-mapping row), `skills/memory/question-registry.md`, and `skills/office-hours/SKILL.md`. Historical tech plans left untouched as dated records.

## Testing

N/A — markdown-only rename and folder addition. Manual smoke: `grep -rn data-insights` across skills/README/CLAUDE.md/teams returns only historical release-plan records; both team workspaces contain `data-analysis/README.md`; the installer's symlink loop picks up the renamed directory and its sync script prunes the dead `data-insights` symlink automatically.

## Risks

- Users with the old `/data-insights` symlink keep a dead link until their next SessionStart sync runs (it prunes dead symlinks); invoking the old name simply fails fast with no side effects.
