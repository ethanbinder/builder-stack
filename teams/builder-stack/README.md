# builder-stack

The team behind Builder Stack itself. This workspace dogfoods the exact convention every team at your company follows — poke around it to see the pattern in action (start with [`release-plans/ethan-binder/`](release-plans/ethan-binder/)).

## What lives here

| Folder | What goes in it |
|--------|-----------------|
| [`decks/`](decks/) | Slide decks and presentation narratives |
| [`strategic-one-pagers/`](strategic-one-pagers/) | One-page strategic framing docs — problem, vision, goal |
| [`user-feedback/`](user-feedback/) | Raw and synthesized user feedback, research notes |
| [`data-analysis/`](data-analysis/) | Data analysis briefs, research readouts, and the team's key metrics dashboards |
| [`product-specs/`](product-specs/) | Product specifications and requirements |
| [`prototypes/`](prototypes/) | Prototype write-ups, links, and demo notes |
| [`release-plans/`](release-plans/) | Tech plans, launch checklists, rollout plans |
| [`roadmap/`](roadmap/) | Quarterly roadmaps and planning docs |
| [`strategy/`](strategy/) | Longer-form strategy docs and memos |

## How it works

1. **Pick the folder** that matches the kind of document you're adding.
2. **Create (or open) your author folder** inside it — kebab-case your name, e.g. `ethan-binder/`.
3. **Add your document** as a markdown file named after its title in kebab-case, e.g. `q3-retention-strategy.md`.
4. **Start the file with frontmatter**:

   ```yaml
   ---
   title: Q3 Retention Strategy
   author: Ethan Binder
   date: 2026-07-22
   ---
   ```

Same pattern, every folder, every team. See [`teams/README.md`](../README.md) for how to add a new team.
