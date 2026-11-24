---
title: "Tech Plan: /slack-bot skill"
author: Ethan Binder
date: 2026-11-23
---

# Tech Plan: /slack-bot skill

**Author**: Ethan Binder

**Objective**: Add a skill that helps someone build a Slack bot their team can tag to add context to the repo, including the Slack setup.

**PRD & Design Link**:

---

## Problem Statement

Decisions, feedback, and context get settled in Slack threads and never reach the repo. Getting them there today means someone copying them by hand.

## Changes Made

- **`skills/slack-bot/SKILL.md`** — the workflow: choose your own bot or Claude Tag, gather the repo and channels, write the bot, walk through setup, try it.
- **`skills/slack-bot/template.md`** — the bot's files: Slack manifest, config, Node.js code, tests, Dockerfile. A mention reads its thread, one Claude call returns a structured note, and code opens a pull request with one document. No build step is added to this repo.
- **`.claude/docs/slack-bot-setup.md`** — Slack app and tokens, GitHub token, Claude key, hosting, troubleshooting, and the Claude Tag alternative.
- **`skills/memory/question-registry.md`** — `slack-bot-approach` and `slack-bot-intake` (two-way), `slack-bot-public-repo` (one-way).
- **`CLAUDE.md`** — a narrow exception: the bot's docs-only PRs under `organizations/` skip `/release` and the tech plan; a person still reviews and merges.
- **`README.md`, `skills/memory/builder-context.md`** — workflow table, PR and tech-plan rules.

## Testing

- The files were extracted from `template.md` into an empty folder and run there: `npm install`, then `npm test` passes 11 tests covering config, paths, rendering, redaction, the pull request flow, concurrent and repeated mentions, refused channels, and failures.
- The code type-checks against the Slack, GitHub, and Anthropic packages. A mention event was sent through the real Bolt library with the Slack, GitHub, and Claude calls faked.
- `npm run check` reports missing values, a bad channel ID, a bad GitHub token, and (with the GitHub step removed) a bad Slack token.
- Not run: a live Slack workspace, a live Claude call, a real pull request from the bot, or the Docker image.

## Risks

- **Prompt injection.** Slack text reaches the model, and the result is later read by agents. The model has no tools, code chooses the repo, branch, and path, links and HTML are neutralized, and a person reviews every pull request.
- **Data exposure.** The bot refuses public repos, channels it isn't configured for, and externally shared channels by default. Threads go to the Claude API. Secret redaction is best effort.
- **Credentials.** The GitHub token can write to the repo. The guide asks for a separate account, one repo, and branch rules it can't bypass; the skill can't enforce that.
- **The exception** in `CLAUDE.md` is enforced by review, not by a check.
- Dependencies and Slack's settings pages will drift.
