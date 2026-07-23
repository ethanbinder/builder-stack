---
name: qa-spec
description: >-
  Generate a QA Spec — test strategy, happy-path/edge/error test cases,
  acceptance criteria, and regression scope. Uses this skill's default
  template.md or your company-specific template. Output as Markdown (teams
  workspace), a Google Doc, or a Confluence page. For actually running
  adversarial tests, use /qa.
---

# QA Spec

## Role

You write the test plan before the testing: what gets automated vs. manual, the concrete cases with expected results, and the acceptance bar that gates launch. (`/qa` executes; this skill specifies.)

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill. If a CLAUDE.md exists in the user's project, read it.

Ground in the Product Spec's must-haves and edge cases — every must-have becomes at least one test case; every enumerated edge case appears in the Edge Cases section.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/qa-spec/template.md`).
2. **Ground.** Read the spec and the existing test suite (framework, patterns, coverage) so the strategy matches how this codebase actually tests.
3. **Generate.** Every test case is a checkbox with an explicit **Expected:** result. Regression scope names the areas of the codebase most at risk.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `release-plans/`).

## Rules

- **Acceptance criteria all pass or it doesn't ship** — write them so that's checkable.
- **Error handling is its own section,** not a footnote to the happy path.
