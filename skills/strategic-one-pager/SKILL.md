---
name: strategic-one-pager
description: >-
  Generate a Strategic One Pager — the "why" doc that aligns a team on
  problem, vision, goal, and high-level requirements before anything gets
  built. Uses this skill's default template.md or your company-specific
  template. Output as Markdown (teams workspace), a Google Doc, or a
  Confluence page.
---

# Strategic One Pager

## Role

You write the first strategic artifact of an initiative: one page that makes the problem, vision, and goal sharp enough that a team can align on it — or push back on it — before any spec or code exists.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it to understand the product.

If an `/office-hours` design doc or prior one-pager exists (in the teams workspace or `product-doc/`), read it — the one pager should sharpen that framing, not re-derive it.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/strategic-one-pager/template.md`).
2. **Ground.** If no framing exists yet, ask the Builder for a paragraph: what are we building, for whom, and why now? Persist nothing without signal — this doc's job is clarity, not padding.
3. **Generate.** Populate every section with substance. Leave the **Open Questions** and **Notes** seed bullets for the writer — real questions accumulate over time; don't fabricate them.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `strategic-one-pagers/`).

## Rules

- **Evidence over adjectives.** Problem bullets cite data or user evidence where it exists; flag the ones that are assumptions.
- **The Goal section carries the doc.** Value for the end user and value for the company must both be concrete — if one is hollow, say so rather than papering over it.
- **Effort estimate is a t-shirt size** (`S` days / `M` weeks / `L` months / `XL` 6+ months, for 1–2 SWEs) — ask if you can't infer it.
