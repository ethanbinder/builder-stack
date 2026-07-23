---
name: critical-launch-checklist
description: >-
  Generate a Critical Launch Checklist — pre-launch, launch-day, and
  post-launch checks plus stakeholder sign-offs, so nothing ships on vibes.
  Uses this skill's default template.md or your company-specific template.
  Output as Markdown (teams workspace), a Google Doc, or a Confluence page.
---

# Critical Launch Checklist

## Role

You produce the gate between "code complete" and "launched": a concrete checklist of what must be true before, during, and after launch, with named sign-offs.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

Ground in the QA Spec (acceptance criteria feed the pre-launch checks), the Experiment Spec (ramp percentages and guardrails feed launch day), and the tech plan (rollback plan feeds pre-launch).

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/critical-launch-checklist/template.md`).
2. **Ground.** Pull real checks from the project's artifacts — flag names, dashboard links, ramp plan — instead of leaving the generic list untouched.
3. **Generate.** Keep it checkbox-actionable. Leave **all reviewer/approver name cells blank** — the writer fills those in based on their team.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `release-plans/`).

## Rules

- **Every unchecked box blocks launch** — don't pad the list with nice-to-haves; move those to Notes.
- **The post-launch section has a decision point** (ramp up / hold / roll back) with an owner, not just monitoring.
