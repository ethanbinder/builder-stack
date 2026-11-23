---
title: "Tech Plan: Drop the long-form Skills section from README"
author: Ethan Binder
date: 2026-04-25
---

# Tech Plan: Drop the long-form `## Skills` section from README

**Author**: Ethan Binder

**Objective**: Remove the verbose `## Skills` section (and its four subsections — Start, Strategy, Engineering, Meta) from `README.md`. The Builder Workflow table at the top of the README already lists every skill, so the long-form section is duplicative and clutters the page. Update `CLAUDE.md`'s lockstep convention to drop its now-stale reference to the removed subsections.

**PRD & Design Link**:

---

## Problem Statement

`README.md` carries the full skill catalog twice: once as a one-row-per-skill workflow table near the top (lines 21–38), and again as a long-form prose section under `## Skills` (lines 125–159) split into Start / Strategy / Engineering / Meta subsections. The two views describe the same skills with the same scope, so a reader who lands on the README scrolls past the same content twice. The workflow table is the more scannable form and is the one most readers use; the long-form section restates it without adding meaningful new information.

`CLAUDE.md` line 20 codifies a lockstep rule that requires updates to "the longer per-skill description in the Strategy/Engineering/Meta sections" on every skill change. Once the Skills section is gone, that clause is a dangling reference and would mislead future contributors into reinstating the section.

## Changes Made

- **`README.md`** — delete lines 125–159 in the pre-edit numbering (the entire `## Skills` heading plus the four `### Start`, `### Strategy`, `### Engineering`, `### Meta` subsections and every per-skill paragraph beneath them). The blank line separator and the next heading (`## Philosophy`) remain in place, so the document flows directly from `### Minimal alternative` into `## Philosophy`. The Builder Workflow table (still lines 21–38), Quick Start, Philosophy, Contributing, and License sections are untouched.
- **`CLAUDE.md`** — update the lockstep bullet on line 20 to drop "and the longer per-skill description in the Strategy/Engineering/Meta sections" while leaving the rest of the rule intact. The new text still requires the workflow-table row to be updated whenever a skill changes; only the now-nonexistent secondary location is removed.

## Testing

N/A — markdown-only documentation change with no runtime behavior. Manual smoke: render the updated `README.md` (GitHub web view post-merge, or any markdown previewer) and confirm the page transitions cleanly from `### Minimal alternative` into `## Philosophy` with no orphaned headings or anchor links. Confirm `grep -nE "Strategy|Engineering|Meta" README.md CLAUDE.md` returns no matches.

## Risks

- **None material.** No code, skill behavior, install flow, or external link is affected. The removed section's content is fully covered by the workflow table at the top of the README and by each skill's own `SKILL.md`. No README anchor (`#skills`, `#start`, `#strategy`, etc.) appears to be linked from elsewhere in the repo or from external skill files; a quick grep across `skills/`, `references/`, `docs/`, and `CLAUDE.md` for those anchors turns up no inbound references. The CLAUDE.md edit is intentional and tightens (rather than weakens) the lockstep rule by pointing it at the single remaining canonical location.
