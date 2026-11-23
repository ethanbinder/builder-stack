---
title: "Tech Plan: Add the /legal-review template skill"
author: Ethan Binder
date: 2026-07-22
---

# Tech Plan: Add the `/legal-review` template skill

**Author**: Ethan Binder

**Objective**: Add a Legal doc type to the template-skill family — `/legal-review` generates a counsel-ready review packet and participates in every shared output mode, including as its own tab in the Google Doc native-tabs output.

**PRD & Design Link**:

---

## Problem Statement

The template-skill family covers the product lifecycle from one-pager to GTM, but launches with legal exposure (privacy, IP, regulatory, marketing claims) have no doc type — so legal review happens ad hoc, outside the workspace convention.

## Changes Made

- Added `skills/legal-review/` (SKILL.md + template.md) following the established template-skill pattern: template-source ask, frontmatter, teams-workspace output to `release-plans/`, Google Doc tab participation, Confluence support. The template covers Feature Summary, six review areas (Privacy & Data Handling, IP, ToS/Policy, Regulatory & Compliance, Marketing & Claims, Third-Party/Contracts), Questions for Counsel, a risk table with a counsel-guidance column, and blank sign-offs.
- Wired `/legal-review` into `skills/memory/builder-context.md` (template-skill list, Plan phase row, output-mapping table) and `README.md` (workflow-table row + template-skills paragraph) per the lockstep rule.
- Added `Legal Review: [pending]` to `skills/canonical-doc/template.md`'s Product Docs list so the project front door tracks it.
- No new registry row — the existing `template-source` id covers all template skills.

## Testing

N/A — markdown-only skill addition. Manual smoke: SKILL.md frontmatter valid; `grep -c legal-review skills/memory/builder-context.md` returns 3 (list, phase table, mapping table); README carries both the row and the paragraph mention.

## Risks

- The skill explicitly frames output as a review packet, not legal advice, with sign-off cells left to counsel — mitigates the risk of generated content being mistaken for cleared legal guidance.
