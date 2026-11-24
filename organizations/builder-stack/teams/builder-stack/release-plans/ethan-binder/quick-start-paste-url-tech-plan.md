---
title: "Tech Plan: Quick Start by pasting the repo URL"
author: Ethan Binder
date: 2026-11-23
---

# Tech Plan: Quick Start by pasting the repo URL

**Author**: Ethan Binder

**Objective**: Make the fastest way to start with Builder Stack "paste the URL into your LLM and it forks the repo for you."

**PRD & Design Link**:

---

## Problem Statement

The Quick Start opened with manual clone steps. A direct clone of the original repo also gives people nowhere of their own to push company or project docs.

## Changes Made

- **`README.md` Quick Start** — opens with a copyable URL and request to paste into Claude Code or Codex, what the LLM needs, and how to ask for a private copy.
- The manual steps stay, under "Or set it up yourself". The clone step becomes fork and private-copy commands; a last step creates the organization and first team.
- The auto-update line now says it follows your copy, since that is what the hook pulls.

## Testing

The private-copy steps were run with local stand-ins for GitHub: `origin` is the copy, `upstream` is the original, and `git pull` follows the copy. The `gh` flags were checked against its help, and the new links load. Not run: a real fork or private copy on GitHub, or an LLM following the pasted request end to end.

## Risks

- A fork of a public repo is public. The README says so and gives the private option.
- `gh` can send pull requests from a fork to the original repo. The steps set the default repo to the copy.
