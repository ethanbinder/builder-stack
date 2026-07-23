---
title: "Tech Plan (small): Canonical Doc — Initiative Overview heading + single post-launch readout"
author: "Ethan Binder"
date: 2026-07-23
---

# Tech Plan (small): Canonical Doc — Initiative Overview heading + single post-launch readout

## Problem Statement

The Canonical Doc template opened with a "Project Overview" heading and tracked two readouts (1-month and 3-month). The heading should read "Initiative Overview," and the readout record should be a single "1-month post-launch readout" line.

## Changes Made

- `skills/canonical-doc/template.md` — renamed the `# [Project Name] — Canonical Doc` title to `# [Initiative Name] — Canonical Doc`; renamed `## Project Overview` → `## Initiative Overview`; replaced the `1-month readout` line with `1-month post-launch readout`; removed the `3-month readout` line.
- `skills/canonical-doc/SKILL.md` — consistency: Workflow step 2 now says "the four Initiative Overview questions"; the Readouts rule now references the single 1-month post-launch readout line.

## Testing

N/A — markdown template/skill wording only, no runtime behavior. Smoke: `grep -rn "Project Overview\|3-month" skills/canonical-doc/` returns nothing.

## Risks

None — template heading and line rename; existing generated Canonical Docs are untouched (the skill updates docs in place and never deletes pending lines).
