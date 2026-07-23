# Teams

**Every team within your company org gets a workspace with the team name.** A team workspace is where that team's product documents live — decks, strategy, specs, release plans — organized the same way for every team, so anyone at the company can find anything without asking.

## How a workspace is organized

```
teams/
└── <team-name>/                  # one folder per team, kebab-case
    ├── decks/                    # slide decks and presentation narratives
    ├── strategic-one-pagers/     # one-page strategic framing docs
    ├── user-feedback/            # raw and synthesized user feedback
    ├── data-analysis/            # analysis briefs + key metrics dashboards
    ├── product-specs/            # product specifications
    ├── prototypes/               # prototype write-ups and demo notes
    ├── release-plans/            # tech plans, launch checklists, rollout plans
    ├── roadmap/                  # quarterly roadmaps and planning docs
    └── strategy/                 # longer-form strategy docs and memos
```

Inside each of those folders, **every author gets their own folder** (kebab-case name, e.g. `ethan-binder/`), and each document is a markdown file named after its title (e.g. `q3-retention-strategy.md`) that opens with `title` / `author` / `date` frontmatter. Each folder's README explains the convention right where you need it.

## Current Teams

| Team | Workspace |
|------|-----------|
| builder-stack | [`teams/builder-stack/`](builder-stack/) |

> Keep this table in lockstep with the folders: adding or removing a team updates this list (and the Teams section of the root README) in the same PR.

## Adding a team? Here's how

1. Copy the template — it scaffolds all eight doc folders with their READMEs:

   ```bash
   cp -r teams/_template teams/<your-team-name>
   ```

2. Open `teams/<your-team-name>/README.md` and fill in your team's name and mission.
3. Add your team to the **Current Teams** table above (and the root `README.md`'s Teams section).
4. Open a PR with all of the above in one change.

That's it — your team now has a workspace, and every teammate can start adding documents under their own author folder.
