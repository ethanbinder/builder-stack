---
title: "Tech Plan (small): Credit Codex contributions in release commits"
author: "Ethan Binder"
date: 2026-07-23
---

# Tech Plan (small): Credit Codex contributions in release commits

## Problem Statement

Builder Stack's `/release` workflow creates commits with the local user's Git identity but does not record Codex when Codex materially authored the change. GitHub therefore attributes those commits only to the user and cannot credit the linked `codex` account as a contributor.

## Changes Made

- `skills/release/SKILL.md` — require the GitHub-linked `Co-authored-by: Codex <noreply@openai.com>` trailer when Codex materially authored a committed change, and keep that attribution out of PR-body footers.
- `README.md` — update the `/release` workflow summary to document conditional Codex co-author attribution.

## Testing

Docs-only workflow change. Confirm the trailer appears consistently in `/release`, the README workflow row matches the new behavior, and `git diff --check` passes.

## Risks

Low. The rule could over-credit Codex if applied to review-only work, so it explicitly limits attribution to changes Codex materially authored.
