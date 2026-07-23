# Question Registry

The single source of truth for every interruption Builder Stack skills can throw at a user. Each ask has a stable kebab-case **id**, a **door_type** that governs whether it can be silenced, and a **default option** used when a user sets `never-ask` on a two-way ask.

Inspired by [gstack's `scripts/question-registry.ts`](https://github.com/garrytan/gstack), but kept as a readable markdown table to match Builder Stack's "skills are plain markdown, no build step" convention.

## How to read this table

- **id** — `<skill>-<slug>`. Stable. Do not rename without updating every SKILL.md that references it.
- **door_type**:
  - `two-way` — routine. User can silence via `tune: never-ask`. Auto-decide with the default option when silenced.
  - `one-way` — load-bearing. Silencing it defeats the skill's purpose, or the action is destructive / high-stakes. Always ask, even when the user said `never-ask` (add safety note).
- **default** — the option the skill auto-picks on `never-ask` for two-way asks. Chosen to be the least-surprising, least-destructive path.
- **offers tune hint?** — whether the skill, after a two-way ask, emits the one-line `Reply \`tune: never-ask\` to silence this next time.` hint.

See `skills/memory/SKILL.md` for how preferences are written and the user-origin gate that prevents profile-poisoning.

## Registry

| id | skill | door_type | description | default (on `never-ask`) | offers tune hint? |
|---|---|---|---|---|---|
| `start-lane-ambiguity` | start | two-way | Routing fallback when the user's reply names a domain but no task ("something in analytics"). | treat as `0 → 1` (invoke `/office-hours`) | yes |
| `start-team-select` | start | two-way | Phase 0 — when the repo has a `teams/` directory and no `Team:` fact is persisted, offer three options: choose an existing team, create a new one from `teams/_template`, or continue without a team for now. If skipped, re-asked once at the Phase 3 hand-off when the user starts working; a second skip ends the asking for the session. | `skip` (continue without a team) | yes |
| `template-source` | all template skills | two-way | Before generating any doc, offer the repo's default `template.md` vs a user-supplied company-specific template (with the data-never-shared note and fork tip). See `skills/memory/builder-context.md` § Generating Docs. | `repo-default` (use the skill's own `template.md`) | yes |
| `office-hours-intake` | office-hours | two-way | Ask the Builder to describe the initiative in one paragraph (who, what, why now). | infer initiative from the message that triggered `/office-hours`; proceed with a one-sentence advisor restatement | yes |
| `office-hours-strategic-batch` | office-hours | two-way | Batched Phase 2 prompt: Wand Wave + Gap Scan + Strategic Bet in one reply. | skip Phase 2 entirely; the design doc's Strategic Framing section records "skipped per preference" and downstream skills proceed without the 2/5/10-year horizons | yes |
| `office-hours-forcing-batch-1` | office-hours | two-way | Batched Phase 3 round 1: Demand Reality + Status Quo + Desperate Specificity. | skip round 1; design doc notes "skipped per preference" for those three questions | yes |
| `office-hours-forcing-batch-2` | office-hours | two-way | Batched Phase 3 round 2: Narrowest Wedge + Observation & Surprise + Future-Fit. | skip round 2; design doc notes "skipped per preference" for those three questions | yes |
| `office-hours-premise-response` | office-hours | **one-way** | Phase 4 — Builder responds to the 2–3 sharpest contradictions the advisor surfaced. This is the skill's load-bearing adversarial step; silencing it turns `/office-hours` into a doc-generator with no stress-test. | (n/a — always asks) | no |
| `office-hours-mode-select` | office-hours | two-way | Phase 6 — pick Expansion / Selective Expansion / Hold Scope / Reduction. Advisor always recommends one with a one-line reason. | accept the advisor's recommended mode | yes |
| `office-hours-next-skill` | office-hours | two-way | Phase 7 — run `/strategic-one-pager` next or `/data-analysis` first? | `/strategic-one-pager` (the default downstream hand-off) | yes |
| `release-tech-plan-prompt` | release | two-way | Phase 0 — when the tech plan is missing at the resolved tech-plan path (default `product-doc/04b-tech-plan.md`), choose between writing a `full` tech plan (via `/eng-manager`) or a `small` one (via `/eng-manager --small`, auto-populated from the diff). Skip is **not** an option — every PR must link to a tech plan. | `small` (auto-populated from the diff; zero friction for trivial PRs while still satisfying the mandatory-tech-plan rule) | yes |

## Adding a new ask

When a skill introduces a new `AskUserQuestion`-shaped moment:

1. Add a row to this table. Pick an id of the form `<skill-name>-<short-slug>`.
2. Classify it:
   - **two-way** by default.
   - **one-way** only if (a) silencing it would defeat the skill's core purpose, or (b) the action is destructive / high-stakes (data loss, force-push, credential rotation, schema migration, security boundary).
3. Pick a conservative default — the option a cautious user would pick, not the most ambitious one.
4. In the skill's SKILL.md, wrap the ask with the preference-check block (see `skills/office-hours/SKILL.md` for the canonical example).
5. Update `README.md` per the lockstep rule in `CLAUDE.md`.
