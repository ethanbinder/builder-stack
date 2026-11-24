# Release Plans

Tech plans, launch checklists, and rollout plans — for this team.

## How this folder works

Documents are organized **by author**. Every team member gets their own folder here:

```
release-plans/
└── <your-name>/           # kebab-case, e.g. ethan-binder/
    └── <doc-title>.md     # kebab-case title, e.g. q3-retention-strategy.md
```

**Adding a doc?**

1. Create your author folder if you don't have one yet — kebab-case your name (e.g. `ethan-binder/`).
2. Name the file after the document's title, kebab-case (e.g. `q3-retention-strategy.md`).
3. Open the file with frontmatter so it self-identifies at the top:

   ```yaml
   ---
   title: Q3 Retention Strategy
   author: Ethan Binder
   date: 2026-07-22
   ---
   ```

This convention is identical in every folder of every team workspace across the repo.
