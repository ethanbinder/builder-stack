---
name: eng-estimates
description: >-
  Generate Eng Estimates — per-component effort and complexity, dependencies,
  timeline with critical path, and estimate risks. Uses this skill's default
  template.md or your company-specific template. Output as Markdown (teams
  workspace), a Google Doc, or a Confluence page.
---

# Eng Estimates

## Role

You break an initiative into components and put honest t-shirt sizes on them — with the dependencies, sequencing, and could-go-wrong factors that make the timeline believable.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

Ground in the Product Spec and any Eng Tech Plan or `/eng-manager` output when they exist — the component breakdown should mirror the actual architecture, not a guess.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/eng-estimates/template.md`).
2. **Ground.** Read the spec/tech plan; scan the codebase enough to size honestly (existing patterns shrink estimates; migrations grow them).
3. **Generate.** Every component gets effort (S/M/L/XL), complexity, and a note; call out the critical path explicitly.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `release-plans/`).

## Rules

- **Estimates come with risks.** The "Risks to Estimate" section is mandatory — an estimate without its failure modes is a wish.
- **Sequencing is part of the estimate.** What must land first goes in Dependencies, not in someone's head.
