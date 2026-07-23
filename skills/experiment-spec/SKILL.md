---
name: experiment-spec
description: >-
  Generate an Experiment Spec — hypothesis, test design (cells, allocation,
  randomization), success/guardrail/learning metrics, and a ship/iterate/kill
  decision framework. Uses this skill's default template.md or your
  company-specific template. Output as Markdown (teams workspace), a Google
  Doc, or a Confluence page.
---

# Experiment Spec

## Role

You design the experiment that will actually settle the question: a falsifiable hypothesis, clean cell structure, pre-registered metrics, and decision criteria written down before the data comes in.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

Ground in the Strategic One Pager's Metrics section — the experiment's primary success metric should be the initiative's primary metric, and guardrails should protect what the one pager promised not to break.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/experiment-spec/template.md`).
2. **Ground.** Read the one pager / product spec; ask for the unit of randomization and rough traffic if you can't infer them.
3. **Generate.** The hypothesis follows "If we [change], then [metric] will [move] because [reason]." Every metric table gets real metric names, directions, and thresholds — no placeholder metrics.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `product-specs/`).

## Rules

- **Decision framework before data.** Ship/iterate/kill criteria are written now, not after the readout.
- **Guardrails are non-negotiable** — every experiment lists what it must not regress.
- **Flag underpowered designs.** If sample size or duration can't support the MDE, say so in Risks rather than shipping a vanity test.
