# Organizations

**Every organization in your company gets a workspace, and every team lives inside one.** An organization holds the documents that span its teams. A team workspace is where that team's own product documents live — decks, strategy, specs, release plans. Both are organized the same way everywhere, so anyone at the company can find anything without asking.

## How it's organized

```
organizations/
└── <organization-name>/              # one folder per organization, kebab-case
    ├── README.md                     # mission + Current Teams
    ├── strategy/                     # org-wide strategy docs and memos
    ├── roadmap/                      # org-wide roadmaps and planning docs
    └── teams/
        └── <team-name>/              # one folder per team, kebab-case
            ├── decks/                # slide decks and presentation narratives
            ├── strategic-one-pagers/ # one-page strategic framing docs
            ├── user-feedback/        # raw and synthesized user feedback
            ├── data-analysis/        # analysis briefs + key metrics dashboards
            ├── product-specs/        # product specifications
            ├── prototypes/           # prototype write-ups and demo notes
            ├── release-plans/        # tech plans, launch checklists, rollout plans
            ├── roadmap/              # quarterly roadmaps and planning docs
            └── strategy/             # longer-form strategy docs and memos
```

Inside each document folder, **every author gets their own folder** (kebab-case name, e.g. `ethan-binder/`), and each document is a markdown file named after its title (e.g. `q3-retention-strategy.md`) that opens with `title` / `author` / `date` frontmatter. Each folder's README explains the convention right where you need it.

**Org-wide or team?** If a document covers one team, it goes in that team's workspace. If it spans several teams in the organization, it goes in the organization's `strategy/` or `roadmap/`.

## Current Organizations

| Organization | Workspace |
|--------------|-----------|
| builder-stack | [`organizations/builder-stack/`](builder-stack/) |

> Keep this table in lockstep with the folders: adding or removing an organization updates this list (and the Organizations section of the root README) in the same PR. Each organization's README keeps its own Current Teams table.

## Adding an organization? Here's how

Every organization starts with its first team.

1. Copy the organization template, then rename the team scaffold inside it to your first team:

   ```bash
   cp -r organizations/_template organizations/<your-organization-name>
   mv organizations/<your-organization-name>/teams/_template organizations/<your-organization-name>/teams/<your-first-team-name>
   ```

2. Open `organizations/<your-organization-name>/README.md`, fill in the name and mission, and list your first team in its **Current Teams** table.
3. Open your first team's README and fill in the team's name and mission.
4. Add the organization to the **Current Organizations** table above, and the organization and team to the root `README.md`'s Organizations section.
5. Open a PR with all of the above in one change.

## Adding a team? Here's how

1. Copy the team template into your organization — it scaffolds every document folder with its README:

   ```bash
   cp -r organizations/_template/teams/_template organizations/<your-organization-name>/teams/<your-team-name>
   ```

2. Open the new team's `README.md` and fill in your team's name and mission.
3. Add your team to the **Current Teams** table in `organizations/<your-organization-name>/README.md` (and the root `README.md`'s Organizations section).
4. Open a PR with all of the above in one change.

That's it — your team now has a workspace, and every teammate can start adding documents under their own author folder.

## Migrating from a top-level `teams/` folder

Older clones keep team workspaces at `teams/<team>/`. Those still work: Builder Stack keeps reading and writing them there until you move them. To migrate a team:

1. If its organization doesn't exist yet, create it from the template, **removing** the team scaffold — the team you're moving takes its place:

   ```bash
   cp -r organizations/_template organizations/<your-organization-name>
   rm -r organizations/<your-organization-name>/teams/_template
   mkdir -p organizations/<your-organization-name>/teams
   ```

2. Move the workspace, keeping its history:

   ```bash
   git mv teams/<your-team-name> organizations/<your-organization-name>/teams/<your-team-name>
   ```

3. Update the organization's **Current Teams** table, the **Current Organizations** table above, the root `README.md`, and any path in `CLAUDE.md` that names the old location (such as the tech-plan path) — all in the same PR.
