---
title: "Tech Plan: Add 11 standalone template skills"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Add 11 standalone template skills

**Author**: Ethan Binder

**Objective**: Give every product doc type its own skill — `/canonical-doc`, `/strategic-one-pager`, `/product-spec`, `/design-brief`, `/eng-tech-plan`, `/eng-estimates`, `/qa-spec`, `/experiment-spec`, `/critical-launch-checklist`, `/gtm-plan`, `/notes` — each shipping a customizable default `template.md`, offering company-specific templates, and outputting to the teams workspace, Google Docs, or Confluence.

**PRD & Design Link**:

---

## Problem Statement

All doc generation is bottled up in the monolithic 10-tab `/product-doc` skill with Confluence-specific templates in `references/`. Users can't invoke a single doc type directly, can't easily swap in company-specific formats, and the template files are slated for removal.

## Changes Made

- Added 11 skill directories under `skills/`, each with a `SKILL.md` and a `template.md` (Eng Tech Plan uses the lightweight Author/Objective/Problem/Changes/Testing/Risks format; Canonical Doc uses the Overview + Product Docs links + GitHub/Figma/Roadmap format with 1-/3-month readouts).
- Added a shared **Generating Docs** section to `skills/memory/builder-context.md`: the `template-source` ask (default vs company template, with the data-never-shared note and fork tip), frontmatter rule, and output destinations (teams workspace mapping table, Google Doc with native tabs, Confluence) — ported from `/product-doc` so each skill stays lean.
- Registered `template-source` in `skills/memory/question-registry.md` (two-way, default `repo-default`).
- README: 11 new workflow-table rows (`/strategic-one-pager` in Think, the rest in Plan), footnote updated to 25 rows / 24 skills, plus a Template Skills paragraph covering the company-template option, the data-never-shared guarantee, and forking.
- Purely additive — `/product-doc` and the `references/` templates are untouched until the next PR in this stack retires them.

## Testing

N/A — markdown-only skill additions. Manual smoke: each new SKILL.md has valid `name`/`description` frontmatter (`grep -L '^name:' skills/*/SKILL.md` style check); README table rows render; every skill's Context section points at `skills/memory/builder-context.md`.

## Risks

- Temporary overlap with `/product-doc` (both can generate the same doc types) until the next PR removes it — acceptable mid-stack state, called out in the README ordering.
