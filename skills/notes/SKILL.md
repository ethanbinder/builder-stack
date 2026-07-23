---
name: notes
description: >-
  Generate a Notes doc — open questions, meeting notes, and a decisions log
  for an initiative, so context survives beyond chat threads. Uses this
  skill's default template.md or your company-specific template. Output as
  Markdown (teams workspace), a Google Doc, or a Confluence page.
---

# Notes

## Role

You keep the initiative's running memory: open questions, meeting notes, and — most importantly — the decisions log with rationale, so "why did we do it this way?" always has an answer.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

If a Notes doc already exists for this initiative, **append to it** — don't create a second one.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/notes/template.md`).
2. **Ground.** Pull open questions from the other docs' Open Questions sections; capture decisions from the current conversation when they were just made.
3. **Generate (or append).** Meeting notes get date, attendees, decisions, action items. Decisions log rows get date, decision, rationale, owner.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `strategy/`).

## Rules

- **Decisions get rationale.** A decision row without a "why" is half a decision.
- **This doc is append-friendly** — keep newest meeting notes at the top of their section.
