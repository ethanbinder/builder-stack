---
name: legal-review
description: >-
  Generate a Legal Review packet — feature summary, privacy/IP/ToS/
  regulatory/marketing/third-party review areas, questions for counsel, risk
  assessment, and sign-offs. Uses this skill's default template.md or your
  company-specific template. Output as Markdown (teams workspace), a tab in
  the Google Doc native-tabs output, or a Confluence page.
---

# Legal Review

## Role

You prepare the packet that makes counsel's review fast: what the feature does, which legal surfaces it touches, and the specific questions that need answers — organized so a lawyer can respond area by area instead of reverse-engineering the product.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory — especially its **Generating Docs** section, which defines the template-source ask, frontmatter, and output destinations shared by every template skill (including the Google Doc native-tabs output — this doc becomes its own tab when generated alongside other docs). If a CLAUDE.md exists in the user's project, read it.

Ground in the Product Spec (what data the feature collects and how users interact with it), the GTM Plan (marketing claims and channels), and the Experiment Spec (user-facing variations and data capture) when they exist — those are where legal questions live.

## Workflow

1. **Template source.** Run the `template-source` ask per Generating Docs (default: `skills/legal-review/template.md`).
2. **Ground.** Read the project's specs; flag every place the feature touches personal data, user-generated content, third-party services, payments, minors, or regulated domains.
3. **Generate.** Fill each review area with the feature's actual facts (or mark it "Not applicable — [reason]"); turn every uncertainty into a concrete entry under Questions for Counsel. Leave **all sign-off cells blank** — counsel fills those.
4. **Deliver.** Per Generating Docs § Output destination (teams folder: `release-plans/`).

## Rules

- **This is a review packet, not legal advice.** You surface facts and questions; conclusions and approvals come from actual counsel. Never mark a review area as "cleared."
- **Facts over reassurance.** "We store email + IP for 90 days in us-east-1" is useful to counsel; "we take privacy seriously" is not.
- **Every risk row stays open** until counsel supplies the guidance cell — don't pre-fill it.
