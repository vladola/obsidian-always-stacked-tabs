# obsidian-always-stacked-tabs: Agent Instructions

A single-file Obsidian community-style plugin. It keeps main-area tab groups stacked (sliding panes).

## Files

- `main.js`: the whole plugin, plain CommonJS. No build step, no dependencies, no `package.json`.
  Keep it that way unless the plugin genuinely outgrows one file.
- `manifest.json`: Obsidian plugin manifest. `id` must stay `always-stacked-tabs` (it is the
  folder name inside vaults).
- `versions.json`: plugin version → minimum Obsidian version.

## How it works

On `onLayoutReady` and every `workspace` `layout-change`, it walks the root leaves and calls the
internal `WorkspaceTabs.setStacked(true)` on each leaf's parent group. `setStacked` / `isStacked`
are **undocumented internals** (found in Obsidian's `app.js`, behind the "Stack tabs" menu item).
Guard every use with `typeof … === "function"` so a changed API degrades to a no-op, not an error.

## Releasing

1. Bump `version` in `manifest.json` and add it to `versions.json`.
2. Commit using Conventional Commits (`feat:`, `fix:` …).
3. Tag the version exactly (`1.0.1`, no `v`) and create a GitHub release that attaches `main.js`
   and `manifest.json`: `gh release create 1.0.1 main.js manifest.json`. BRAT and manual installs
   depend on those assets.

## Where it is used

Vlad's Zettelkasten vault ships a copy at `.obsidian/plugins/always-stacked-tabs/`. When you change
the plugin here, copy `main.js` and `manifest.json` there too (quit Obsidian first).

## Public repo

This repo is public. Never commit vault contents, personal paths, emails or tokens.
