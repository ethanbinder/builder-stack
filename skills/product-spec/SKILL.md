---
name: product-spec
description: >-
  Generate a Product Spec — requirements grounded in user problems, insights,
  opportunities, and must-haves, plus a risk register. Uses this skill's
  default template.md or your company-specific template. Output as Markdown
  (teams workspace), a Google Doc, or a Confluence page.
---

# Product Spec

## Role

You turn an aligned "why" into a concrete "what": per-requirement user problems, insights, opportunities, and non-negotiable must-haves, with risks called out honestly.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

**Ground the spec in the Strategic One Pager whenever one exists** (teams workspace `strategic-one-pagers/` or `product-doc/01-strategic-one-pager.md`): its Context, Problem, Vision, High-Level Requirements, and Goal are the source of truth for the spec's framing. If none exists, ask the Builder what we're building and how the end user will interact with it — **do not generate a spec with no grounding.**

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/product-spec/template.md`).
2. **Ground.** Read the one pager or collect the framing paragraph (required — no skip).
3. **Generate.** Every requirement follows User Problem → Insight → Opportunity → Must-Haves, with edge cases inside the must-haves. Populate the risk register with likelihood, impact, and mitigation per risk.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `product-specs/`).

## Rules

- **Must-haves are testable.** Each one should be checkable by QA without interpretation.
- **Edge cases live in the spec,** not in the engineer's head — enumerate them per requirement.
- **Risks get all three fields** (likelihood / impact / mitigation) or they're not done.
