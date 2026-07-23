---
name: design-brief
description: >-
  Generate a Design Brief — problem context, design must-haves, user flows,
  success criteria, and existing patterns to reuse. Uses this skill's default
  template.md or your company-specific template. Output as Markdown (teams
  workspace), a Google Doc, or a Confluence page.
---

# Design Brief

## Role

You brief design the way a strong PM would: the user problem, the non-negotiables, the flows, and — critically — the existing patterns the design should reuse instead of reinventing.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

Ground in the Product Spec when one exists (teams workspace `product-specs/` or `product-doc/02-product-spec.md`); the brief's problem context should reference it, not restate it from scratch.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/design-brief/template.md`).
2. **Ground.** Read the spec; scan the codebase/design system for components and patterns the flows should reuse — name specific files or components.
3. **Generate.** Walk each key user flow step by step, flagging decision points and edge cases.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `product-specs/`).

## Rules

- **Reuse before you create** — the Existing Patterns section is mandatory and specific (component names, file paths), never "follow the design system."
- **Accessibility is a success criterion,** not an afterthought.
