# Slack bot setup

How to set up the bot that `/slack-bot` writes. You need a Slack workspace where you can install apps (or an admin who can approve one), write access to the GitHub repo, a Claude API account, and Node.js 22 or newer.

Slack changes its settings pages from time to time. If a label here doesn't match, check [Slack's guide](https://docs.slack.dev/tools/bolt-js/creating-an-app).

## 1. Create the Slack app

1. Open [api.slack.com/apps?new_app=1](https://api.slack.com/apps?new_app=1) and choose to create an app from a manifest.
2. Pick your workspace. To practice first, use a test workspace.
3. Paste `manifest.yaml`, click **Next**, review, and click **Create**.

The manifest turns on Socket Mode, so the bot connects out to Slack and needs no public URL. It asks for:

| Scope | Why |
|-------|-----|
| `app_mentions:read` | Get a message when someone tags the bot |
| `channels:history` | Read the tagged thread in public channels the bot is in |
| `chat:write` | Reply in the thread |
| `users:read` | Show names instead of user IDs |
| `groups:history` *(optional)* | Read tagged threads in private channels |

## 2. Get the Slack tokens

1. **App-level token.** Under **Basic Information → App-Level Tokens**, generate a token with the `connections:write` scope. It starts with `xapp-`. This is `SLACK_APP_TOKEN`.
2. **Bot token.** Under **OAuth & Permissions**, install the app to your workspace and approve it. Copy the bot token, which starts with `xoxb-`. This is `SLACK_BOT_TOKEN`.

Some workspaces only let admins install apps. If yours does, Slack offers a request instead; send your admin the scope table above.

Slack can uninstall an app when the person who installed it leaves the workspace or becomes a guest, so a long-lived owner is safer.

## 3. Get the GitHub token

1. Use a separate machine account if you can. If the bot runs as you, you can't approve its pull requests, and the token may be able to get around branch rules that you can.
2. Create a [fine-grained personal access token](https://github.com/settings/personal-access-tokens/new) with access to **only** the Builder Stack repo.
3. Give it **Contents: read and write** and **Pull requests: read and write**. Nothing else. Set an expiry date.
4. Protect the base branch so it requires a pull request and a review, and don't let the bot's account bypass that.

This is `GITHUB_TOKEN`. If your GitHub organization requires approval for fine-grained tokens, an owner has to approve it.

## 4. Get the Claude API key

Create a key in the [Claude Console](https://platform.claude.com/), ideally in its own workspace with a spend limit. This is `ANTHROPIC_API_KEY`. Each mention makes one API call that includes the whole thread.

## 5. Fill in `.env` and check

```bash
cp .env.example .env
```

Open `.env` in an editor and paste in the four values. Don't commit it, and don't paste tokens into Slack or a Claude chat.

```bash
npm run check
```

A `Ready: …` line means the Slack bot token, the GitHub token, the repo, and the workspaces in `config.json` all work.

## 6. Try it

1. Start the bot:

   ```bash
   npm start
   ```

2. In Slack, run `/invite @Builder Stack` in a channel listed in `config.json`.
3. Tag it in a thread: `@Builder Stack save this decision`.
4. It replies with a pull request link. Read it before you merge.

Files and images in a thread aren't read, and the bot doesn't answer direct messages.

## 7. Host it

Socket Mode keeps a connection open, so the bot needs one process that's always running. A laptop works for a trial. For real use, run the `Dockerfile` as a background worker on any host that keeps a container running, with one instance. Serverless functions that stop between requests won't work.

- Run `npm install` first, so `package-lock.json` exists for the build.
- Put the four values in the host's secret settings. `.env` isn't copied into the image.
- Restart after editing `config.json`.
- If the bot stops mid-request, tag it again.

## Troubleshooting

- **No reply at all.** Check that the process is running, the bot is in the channel, and Socket Mode is on.
- **"This channel isn't connected to a workspace yet."** Add the channel's ID to `config.json` and restart.
- **`missing_scope`.** Add the scope in **OAuth & Permissions**, then reinstall the app. New scopes only apply after a reinstall.
- **`channel_not_found` or `not_in_channel`.** Invite the bot to the channel. Private channels also need `groups:history`.
- **"… is public".** The bot won't write Slack content to a public repo. Point it at a private one.
- **"… does not exist on …".** The organization or team in `config.json` isn't on that branch. Create it with `/start` and merge it first.
- **GitHub 403 or 404.** The token has expired, lacks a permission, isn't approved, or doesn't include this repo.
- **Claude authentication error on the first mention.** Check `ANTHROPIC_API_KEY`.
- **A token leaked.** Revoke it where you created it, make a new one, and restart.

## Good to know

- **Who sees what.** Threads go to the Claude API and, as a summary, to everyone who can read the repo. Say so in the channel.
- **External channels.** Channels shared with another company are refused unless `allowExternalChannels` is `true`.
- **Distribution.** This is an internal app for your own workspace. Slack limits thread reading to one request per minute for apps sold or distributed commercially outside its Marketplace ([details](https://docs.slack.dev/changelog/2025/05/29/rate-limit-changes-for-non-marketplace-apps)), and Socket Mode apps can't be listed there.

## Claude Tag instead

If your company has a Claude Team or Enterprise plan, [Claude Tag](https://claude.com/docs/claude-tag/overview) is a hosted `@Claude` for Slack (in public beta when this was written). There's no bot to build. A Claude organization owner and a Slack admin set it up with [this guide](https://claude.com/docs/claude-tag/admins/setup-overview), and a GitHub organization owner [connects the repo](https://claude.com/docs/claude-tag/admins/configure-github).

Name the repo when you tag it: `@Claude in your-company/builder-stack, add this decision to the growth team's strategy folder and open a PR`. Once it has cloned the repo, it reads `CLAUDE.md` and `.claude/skills/`. It doesn't run the hooks in `.claude/settings.json`, and Builder Stack's skills live in `skills/`, so point it at the one you want, such as `skills/notes/SKILL.md`. Its pull requests follow the repo's normal rules, not the Slack bot exception.
