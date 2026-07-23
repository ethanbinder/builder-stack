# Google Workspace setup

Builder Stack skills that output to Google Docs or Google Slides (`/product-doc`, `/deck`) need Google Drive connected to whichever Claude surface you're running in. Pick the surface you already use and follow the matching section below.

## Quick check

Run one of these prompts in your current Claude session. If it works, you're set — skip the rest of this doc.

- **Claude Chat / Cowork:** *"List the five Google Docs I edited most recently."*
- **Claude Code:** *"Use the Google Drive tools to list my five most recently edited Google Docs."*

If Claude answers with your actual docs, the connection is live. If it says it can't access Drive, keep reading.

## Claude Chat

1. Open **Settings → Connectors** in Claude Chat.
2. Find **Google Drive** in the list and click **Connect**.
3. Sign in with the Google account that owns the Drive you want to use. Grant the requested scopes — you need Drive, Docs, and Slides access.
4. Return to your chat and retry the quick check above.

If a teammate set this up for your workspace, the connector may already be available — you still need to authorize it for your own account.

## Claude Cowork

1. Open **Settings → Connectors** in Claude Cowork (same path as Chat).
2. Connect **Google Drive** and authorize the same Drive, Docs, and Slides scopes.
3. Cowork projects can share connectors across teammates — if your workspace admin has enabled the Google Drive connector at the org level, you just need to authorize your own account; you don't need admin rights.
4. Retry the quick check.

## Claude Code

Claude Code uses MCP servers instead of the Connector UI. You have two install paths:

- **Recommended:** install a Google Drive MCP server from the [MCP registry](https://github.com/modelcontextprotocol/servers) or the Anthropic MCP catalog. Follow the server's README for OAuth setup.
- **Alternative:** configure a community Google Drive / Docs / Slides MCP server manually.

MCP server config lives in either:

- `~/.claude/mcp_servers.json` — user-level (available in every project)
- `.mcp.json` at your project root — project-level (shared via the repo)

After editing config, restart Claude Code so it picks up the new server. Then run the quick-check prompt above. If the MCP tool call works, you're set.

## Troubleshooting

- **"Permission denied" on a Doc or Slide I own.** Re-run the connector authorization and make sure you accepted the Docs/Slides scopes, not just Drive read-only. Some connectors default to read-only scopes and need to be re-authorized.
- **"I see my Docs but not my Slides" (or vice versa).** The connector or MCP server likely only has one of the two APIs enabled. Check the scopes granted and re-authorize with both Docs and Slides.
- **"I can list files but can't create them."** You have read-only scopes. Re-authorize the connector with write access.
- **"The connector disappeared from Settings."** Anthropic rolls connectors out gradually — if you don't see Google Drive yet, check back later or use the Claude Code MCP path instead.

## When to use which surface

- **Claude Chat** is the fastest path for one-off Docs or Slides when you don't need code context. Best for a strategic one pager written over coffee.
- **Claude Cowork** is best when the artifact should be visible to your team from day one — Cowork projects make sharing the doc and the conversation that produced it natural.
- **Claude Code** is best when the Doc or Slides deck should reference code, repo context, or existing files in the working directory. `/product-doc` and `/deck` both read your project's `CLAUDE.md` and any existing `product-doc/` artifacts, which is easiest from Code.

You don't need to commit to one — it's fine to use different surfaces for different initiatives.
