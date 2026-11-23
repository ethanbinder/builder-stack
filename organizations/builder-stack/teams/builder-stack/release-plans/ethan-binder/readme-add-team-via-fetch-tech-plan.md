---
title: "Tech Plan (small): README — add the fetch-and-type path for creating a team"
author: "Ethan Binder"
date: 2026-07-23
---

# Tech Plan (small): README — add the fetch-and-type path for creating a team

## Problem Statement

The root `README.md`'s **Adding a team?** line only documents the manual path (`cp -r teams/_template ...`). The repo also supports an interactive path — after a `git fetch` / `git pull`, the post-git hook re-invokes `/start`, whose Phase 0 team prompt offers **Create a new team**: type a name and the workspace is scaffolded from the template. That path was undocumented.

## Changes Made

- `README.md` — extended the **Adding a team?** line in the Teams section to also describe the interactive path: fetch the repo, let the `/start` greeting's team prompt run, choose **Create a new team**, and type the team name.

## Testing

N/A — docs-only change, no runtime behavior. Manual smoke: the Teams section renders with both paths and the existing links to `teams/README.md` resolve.

## Risks

None — single-paragraph README wording change; no skill, hook, or convention behavior altered.
