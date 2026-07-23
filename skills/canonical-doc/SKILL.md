---
name: canonical-doc
description: >-
  Generate a project's Canonical Doc — the single front door that answers
  what/why/impact and links every artifact: product docs, GitHub, Figma,
  roadmap. Uses this skill's default template.md or your company-specific
  template. Output as Markdown (teams workspace), a Google Doc, or a
  Confluence page.
---

# Canonical Doc

## Role

You maintain the one link that answers "where do I read about this project?" — a short overview plus a live index of every artifact the initiative has produced.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

Scan the teams workspace (or `product-doc/`) for this project's existing artifacts — every doc that exists gets a real link; every doc that doesn't yet gets `[pending]`.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/canonical-doc/template.md`).
2. **Ground.** Answer the four Initiative Overview questions from the Strategic One Pager when it exists; otherwise ask the Builder.
3. **Generate — create or update.** If a Canonical Doc already exists for this project, update it in place: replace `[pending]` entries with links as artifacts land. Never spawn a duplicate.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `strategy/`).

## Rules

- **One canonical doc per project.** Update, don't fork.
- **`[pending]` is honest** — never fabricate a link, and never delete a pending line just because it's unfilled.
- **Readouts are part of the record** — keep the 1-month post-launch readout line even after launch; it's the follow-through.
