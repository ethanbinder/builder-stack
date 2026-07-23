# Data Analysis

Data analysis briefs, research readouts, and the team's key metrics dashboards — for this team.

## Key Metrics Dashboards

The dashboards this team watches, registered here so they're always one click away. Keep this table current — add a row whenever an analysis surfaces a dashboard worth keeping.

| Dashboard | Link | Owner | What it answers |
|-----------|------|-------|-----------------|
| [Example: Core Funnel] | [paste link] | [name] | [e.g. where do users drop off between signup and activation?] |

## How this folder works

Documents are organized **by author**. Every team member gets their own folder here:

```
data-analysis/
└── <your-name>/           # kebab-case, e.g. ethan-binder/
    └── <doc-title>.md     # kebab-case title, e.g. q3-retention-deep-dive.md
```

**Adding a doc?**

1. Create your author folder if you don't have one yet — kebab-case your name (e.g. `ethan-binder/`).
2. Name the file after the document's title, kebab-case (e.g. `q3-retention-deep-dive.md`).
3. Open the file with frontmatter so it self-identifies at the top:

   ```yaml
   ---
   title: Q3 Retention Deep Dive
   author: Ethan Binder
   date: 2026-07-22
   ---
   ```

This convention is identical in every folder of every team workspace across the repo. The `/data-analysis` skill writes its briefs here automatically.
