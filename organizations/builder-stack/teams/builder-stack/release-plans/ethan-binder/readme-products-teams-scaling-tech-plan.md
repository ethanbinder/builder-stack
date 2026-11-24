---
title: "Tech Plan (small): Update README products and teams bio"
author: "Ethan Binder"
date: 2026-11-24
---

# Tech Plan (small): Update README products and teams bio

## Problem Statement

The bio at the top of `README.md` describes building products, but does not reflect scaling products and teams.

## Changes Made

- `README.md` — update the bio to say Ethan is "energized by building & scaling products + teams that move business metrics." The metric list, links, and rest of the bio remain unchanged.

## Testing

Docs-only change. Confirm the requested sentence appears exactly once, the previous sentence is absent, all links remain intact, and `git diff --check` passes.

## Risks

Low. This is a single-sentence copy change with no effect on skills, setup, or install flow.
