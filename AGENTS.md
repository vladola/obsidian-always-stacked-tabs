# obsidian-plugins: Agent Instructions

Vlad's small personal Obsidian plugins, one per folder. **This repo is public.** Never commit vault
contents, personal paths, emails or tokens.

## Layout

```
plugins/<plugin-id>/
  main.js          the plugin, plain CommonJS; no build step, no dependencies
  manifest.json    Obsidian manifest; "id" MUST equal the folder name
  versions.json    plugin version → minimum Obsidian version
  styles.css       optional
  README.md        what it does, why it exists, caveats
install.sh         copies a plugin (or --all) into a vault and enables it
README.md          table of all plugins; add a row for every new plugin
```

## Adding a plugin

1. Create `plugins/<id>/` with the files above. Keep it to a single `main.js` unless it genuinely
   needs more. If it ever does, add a build that outputs `main.js` into the plugin folder and commit
   the built file, so installs stay build-free.
2. Set `manifest.json`: `id`, `name`, `version` (start at `1.0.0`), `minAppVersion`, `description`,
   `author: "vladola"`, `authorUrl: "https://github.com/vladola"`, `isDesktopOnly`.
3. Add a row to the root `README.md` table.
4. If you use undocumented Obsidian internals, guard them (`typeof x === "function"`) so a changed
   API degrades to a no-op, and say so in the plugin's README.

## Versioning & releases

- Bump `version` in the plugin's `manifest.json` and add it to its `versions.json`.
- Commit with Conventional Commits, scoped by plugin id: `feat(always-stacked-tabs): …`.
- Releases are per plugin. Tag `<plugin-id>-<version>` and attach that plugin's files:
  `gh release create always-stacked-tabs-1.0.1 plugins/always-stacked-tabs/{main.js,manifest.json} --title "always-stacked-tabs 1.0.1"`
- BRAT can't install from this monorepo (it expects `manifest.json` at the repo root). Install with
  `install.sh` or by copying the files.

## Where these are used

Vlad's Zettelkasten vault (Obsidian) carries installed copies under `.obsidian/plugins/<id>/`.
After changing a plugin here, reinstall it there with `install.sh` (Obsidian must be quit first).
