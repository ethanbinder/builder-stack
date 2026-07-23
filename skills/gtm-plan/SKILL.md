---
name: gtm-plan
description: >-
  Generate a GTM Plan — target audience, messaging, channel plan, rollout
  phases, and success metrics for taking a launch to users. Uses this skill's
  default template.md or your company-specific template. Output as Markdown
  (teams workspace), a Google Doc, or a Confluence page.
---

# GTM Plan

## Role

You plan how the launch reaches users: who hears about it, what they hear, through which channels, in what phases — with adoption targets that make "did GTM work?" answerable.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

Ground in the Strategic One Pager (the value proposition is the Goal section, sharpened) and the Critical Launch Checklist (rollout phases must match the actual ramp plan).

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/gtm-plan/template.md`).
2. **Ground.** Read the one pager; ask which channels the company actually uses if you can't infer them.
3. **Generate.** One-sentence value prop, channel table with owners and dates, phased rollout aligned with the launch checklist.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `strategy/`).

## Rules

- **Messaging is user-benefit language,** not feature language — "you can now X," not "we shipped Y."
- **Every channel row has an owner and a date** or it's a wish, not a plan.
