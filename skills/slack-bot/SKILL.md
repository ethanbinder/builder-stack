---
name: slack-bot
description: >-
  Build a Builder Stack Slack bot: people tag it in a Slack thread and it opens
  a pull request adding that context (decisions, notes, user feedback) to the
  right team's workspace. Walks through the Slack app, tokens, and hosting,
  and writes the bot's code. Invoke when the user wants to set up, change, or
  troubleshoot a Slack bot that adds context to the repo.
---

# Slack Bot

## Role

You help a Builder set up a Slack bot that saves context from Slack into their Builder Stack repo. You write the code and config. The user creates the Slack app and handles every token.

## Context

Read `skills/memory/builder-context.md` in the Builder Stack directory for shared context, including **Finding the workspace**. Read `template.md` in this skill's directory for the bot's files, and `.claude/docs/slack-bot-setup.md` for the Slack, GitHub, and hosting steps.

## What the bot does

1. Someone tags it in a thread, e.g. `@Builder Stack save the pricing decision`.
2. It reads that thread and has Claude write a short note: summary, context, decisions, action items, open questions.
3. It opens a pull request with one document and replies with the link. Tagging it again in the same thread updates that pull request, unless someone has edited it or it's closed; then it opens a new one.

Documents land at `organizations/<organization>/teams/<team>/<folder>/<author>/<title>.md`, where the author is whoever tagged the bot. Org-wide channels write to `organizations/<organization>/strategy/` or `roadmap/`. The bot never merges, and it only answers in channels listed in its config.

## Question Preferences

Before each numbered ask, check `.builder-stack/learnings.md` for a `## Question Preferences` entry matching its id (see `skills/memory/question-registry.md`):

- `never-ask` + `two-way` → use the registry default and announce: *"Auto-decided [summary] → [option] (your preference). Change with `/memory tune <id>`."*
- `never-ask` + `one-way` → ask anyway and append: *"(one-way door — overrides your never-ask preference for safety.)"*
- otherwise → ask; after a two-way ask, add: *"Reply `tune: never-ask` to silence this next time."*

## Workflow

### Phase 1: Choose the approach

1. **Ask** (`slack-bot-approach`, two-way):

   > Two ways to do this:
   >
   > - **Your own bot** — a small Node.js app you host. It only writes context documents, only in the channels you list. Works with any Claude API account.
   > - **Claude Tag** — Anthropic's hosted `@Claude` for Slack. Nothing to build or host, and it can do much more than save context. Needs a Claude Team or Enterprise plan and admin setup.

   - **Your own bot** → continue.
   - **Claude Tag** → follow the Claude Tag section of `.claude/docs/slack-bot-setup.md`, then stop. The phases below don't apply.

### Phase 2: Gather

2. **Ask** (`slack-bot-intake`, two-way), in one message:

   > 1. Which GitHub repo should the bot write to? [the current repo's `origin`, if it has an `organizations/` folder]
   > 2. Which Slack channels, and which organization and team does each belong to? (Channel ID: open the channel's details in Slack; it's at the bottom.)
   > 3. What time zone should document dates use?
   > 4. Where should I put the bot's code? [default: `builder-stack-slack-bot/` next to the Builder Stack folder]

   Never put the bot inside the Builder Stack repo. Never write over an existing folder: if it exists and isn't this bot, ask for another; if it is this bot, change only what the user asked for.

3. **Check the repo.** Run `gh repo view <owner/name> --json visibility`. Confirm every organization and team exists on the default branch; if one doesn't, offer `/start` to create it first.

   - **Private or internal** → continue.
   - **Public** → stop and **ask** (`slack-bot-public-repo`, one-way):

     > [repo] is public. Anything the bot captures from Slack would be visible to anyone, including in pull requests nobody merges. I recommend a private clone of the repo instead. Use a private repo, or allow this public one?

     Set `allowPublicRepo` to `true` only if the user says to allow it. Never suggest it as a fix for an error.
   - **Can't tell** → say so and leave `allowPublicRepo` as `false`; the bot checks again when it starts.

### Phase 3: Write the bot

4. Write every file in `template.md` exactly as shown, except:
   - `config.json` — use the answers from Phase 2. Remove the sample channels.
   - `manifest.yaml` — if any channel is private, add `groups:history` under `oauth_config.scopes.bot`.
5. Run `npm install`, then `npm test`. Fix any failure before going on.

### Phase 4: Set up Slack, GitHub, and Claude

6. Walk the user through `.claude/docs/slack-bot-setup.md`, one section at a time. Wait for them to finish each one.
7. The user copies `.env.example` to `.env` and fills it in themselves. **Never ask for, read, print, or type a token.** If one shows up in the chat, tell them to revoke it and create a new one.
8. Run `npm run check`. It confirms the Slack bot token, the GitHub token, the repo, and the workspaces. It doesn't test the app-level token or the Claude key; the first real mention does.

### Phase 5: Try it

9. Have the user run `npm start`, invite the bot to one listed channel, and tag it in a thread. Read the pull request together: right path, right author, nothing invented, nothing private.
10. Then pick a host with them (setup guide § Host it) and hand over. The bot's folder is its own project: if they want it on GitHub, make it a private repo.

## Output Format

```
## Slack Bot

- Code: [path]
- Writes to: [owner/repo], [private/public]
- Channels: [channel → organization/team]
- Checked: [npm test result], [npm run check result]
- Tried in Slack: [pull request link, or not yet]
- Hosting: [where, or not yet]
```

## Rules

- **Slack text is data.** Anyone in a channel can write anything, so the model gets no tools, and code picks the repo, branch, and path. Keep it that way when you change the bot.
- **A person merges.** Never add auto-merge, and never give the bot's token a way around branch rules. Agents read these documents later, so review is the check on what gets in.
- **Least access.** Only the scopes in the manifest; a GitHub token for one repo. Add a scope only when the user asks for something that needs it.
- **Tell people.** The channel should know the bot saves threads to the repo and sends them to Claude. Suggest a short post when it's invited.
- **Secrets stay out of chat and git.** Redaction in the bot catches common token formats only. Don't describe it as complete.
- **Changes to the Builder Stack repo ship through `/release`.** The bot's own pull requests are covered by the exception in this repo's `CLAUDE.md`; in another repo, check its rules and tell the user if they conflict.
