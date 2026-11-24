# Strategy

Longer-form strategy docs and memos — for the whole organization. If a document covers a single team, put it in that team's `strategy/` folder instead.

## How this folder works

Documents are organized **by author**. Every author gets their own folder here:

```
strategy/
└── <your-name>/           # kebab-case, e.g. ethan-binder/
    └── <doc-title>.md     # kebab-case title, e.g. 2027-company-bets.md
```

**Adding a doc?**

1. Create your author folder if you don't have one yet — kebab-case your name (e.g. `ethan-binder/`).
2. Name the file after the document's title, kebab-case (e.g. `2027-company-bets.md`).
3. Open the file with frontmatter so it self-identifies at the top:

   ```yaml
   ---
   title: 2027 Company Bets
   author: Ethan Binder
   date: 2026-11-23
   ---
   ```

This convention is identical in every folder of every organization and team workspace across the repo.
