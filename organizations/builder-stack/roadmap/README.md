# Roadmap

Roadmaps and planning docs — for the whole organization. If a document covers a single team, put it in that team's `roadmap/` folder instead.

## How this folder works

Documents are organized **by author**. Every author gets their own folder here:

```
roadmap/
└── <your-name>/           # kebab-case, e.g. ethan-binder/
    └── <doc-title>.md     # kebab-case title, e.g. h1-2027-roadmap.md
```

**Adding a doc?**

1. Create your author folder if you don't have one yet — kebab-case your name (e.g. `ethan-binder/`).
2. Name the file after the document's title, kebab-case (e.g. `h1-2027-roadmap.md`).
3. Open the file with frontmatter so it self-identifies at the top:

   ```yaml
   ---
   title: H1 2027 Roadmap
   author: Ethan Binder
   date: 2026-11-23
   ---
   ```

This convention is identical in every folder of every organization and team workspace across the repo.
