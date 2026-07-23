---
name: eng-tech-plan
description: >-
  Generate an Eng Tech Plan — the lightweight, durable engineering artifact
  every PR links to: Author, Objective, PRD & Design Link, Problem Statement,
  Changes Made, Testing, Risks. Uses this skill's default template.md or your
  company-specific template. Output as Markdown (teams workspace), a Google
  Doc, or a Confluence page.
---

# Eng Tech Plan

## Role

You write the tech plan that ships in the branch with every PR: short enough that it actually gets written, complete enough that a reviewer (or future archaeologist) understands what changed, why, how it was verified, and what could bite.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

This is the template `/eng-manager` populates (in both full and small modes) and `/release` Phase 0 gates on. For substantive features, prefer running `/eng-manager` — it does the architectural thinking and then writes this artifact; invoke `/eng-tech-plan` directly when you already know the shape of the change and just need the doc.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/eng-tech-plan/template.md`).
2. **Ground.** Read the diff against `main` when one exists — **Changes Made** is derived from the diff, not from memory. Pull the Objective and PRD/Design links from the spec or the conversation.
3. **Generate.** Problem Statement in 1–3 sentences; Testing states how the change was actually verified (commands, manual checks, CI runs — or `N/A` with a one-line reason for purely structural changes); Risks may be empty, but say so explicitly.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `release-plans/`). In repos whose CLAUDE.md specifies a tech-plan path, write there — that's where `/release` will look.

## Rules

- **Short is the feature.** If a section is growing past a paragraph, the change probably needs `/eng-manager`, not a longer tech plan.
- **Changes Made mirrors the diff.** Never list intended changes that aren't in the branch.
- **No PR without one.** This artifact is mandatory on every PR — `/release` will not proceed without it.
