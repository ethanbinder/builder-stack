---
title: "Tech Plan: Require /release for all plans and PRs"
author: Ethan Binder
date: 2026-07-23
---

# Tech Plan: Require `/release` for all plans and PRs

**Author**: Ethan Binder

**Objective**: Add a Shipping rule to CLAUDE.md so any plan that ends in a PR — including Claude Code plan-mode plans — routes its commit/push/PR steps through `/release`, and no PR is ever opened with a bare `gh pr create` outside the skill.

**PRD & Design Link**:

---

## Problem Statement

The repo's shipping wiring is one-directional: code-touching skills hand off *to* `/release`, but nothing tells an agent that a plan ending in a PR, or a PR opened outside any skill, must go through `/release`. A PR opened from a plain plan-mode session (builder-stack#1) shipped with a bare `gh pr create` and a one-line body, missing the structured release format entirely.

## Changes Made

- Added a leading bullet to CLAUDE.md's `## Shipping` section: any plan whose outcome includes opening a PR must name `/release` as the mechanism for the commit/push/PR steps, and every PR is opened by invoking `/release` — never a bare `gh pr create` — even when no other skill is active in the session.

## Testing

N/A — docs-only guidance change, no runtime behavior. Manual smoke: the bullet renders correctly in `## Shipping`, and this PR itself follows the `/release` format it mandates (tech plan linked, structured body, Builder Stack footer last).

## Risks

- Guidance-only enforcement: an agent session that never loads CLAUDE.md (e.g. skills symlinked but repo not the working directory) can still bypass the rule; `/release` Phase 0's tech-plan gate remains the backstop.
