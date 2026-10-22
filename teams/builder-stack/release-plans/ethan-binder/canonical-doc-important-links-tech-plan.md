---
title: "Tech Plan (small): Canonical Doc — Important Links section"
author: "Ethan Binder"
date: 2026-10-21
---

# Tech Plan (small): Canonical Doc — Important Links section

## Problem Statement

The Canonical Doc template scattered its links across separate `## GitHub` and `## Figma` sections with paste-a-link placeholders, and had no slot for data sources. Readers need one place for the initiative's key links, each honestly marked `[pending]` until it lands.

## Changes Made

- `skills/canonical-doc/template.md` — added `## Important Links` below `## Product Docs` with Strategic One Pager, Product Spec, Tech Plan, Experiment Spec, GitHub Repos, Data Sources, Legal Review, and Figma, all `[pending]`. Folded the former standalone `## GitHub` and `## Figma` sections into it (as `GitHub Repos` and `Figma`). `## Roadmap` is unchanged.
- `skills/canonical-doc/SKILL.md` — frontmatter description now lists "important links (GitHub repos, data sources, Figma)" in place of "GitHub, Figma".
- `README.md` — `/canonical-doc` workflow-table row updated to match (lockstep rule).

## Testing

N/A — markdown template/skill wording only, no runtime behavior. Smoke: `grep -n "^## " skills/canonical-doc/template.md` shows Initiative Overview → Product Docs → Important Links → Roadmap, with no standalone GitHub/Figma headings.

## Risks

None — template-only change; existing generated Canonical Docs are untouched (the skill updates docs in place and never deletes pending lines).
