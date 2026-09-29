# Always stacked tabs

A tiny Obsidian plugin that keeps the tab groups in the main editor area **stacked**, so notes
slide in to the right like Andy Matuschak's notes site.

Obsidian's built-in *Stack tabs* is a per-tab-group toggle. It's lost whenever the layout is rebuilt
(on startup, by plugins such as Homepage that replace open notes, by new splits). This plugin
re-applies it on layout ready and on every `layout-change`.

Pairs well with [Open Tab Settings](https://github.com/jesse-r-s-hines/obsidian-open-tab-settings)
(open links in a new tab next to the current one).

## Install

**Manual:** copy `main.js` and `manifest.json` into
`<vault>/.obsidian/plugins/always-stacked-tabs/`, then enable *Always stacked tabs* under
Settings → Community plugins.

**BRAT:** add `vladola/obsidian-always-stacked-tabs` as a beta plugin.

## Caveat

It uses Obsidian's internal `WorkspaceTabs.setStacked()` / `isStacked` (the same method behind the
*Stack tabs* menu item). They aren't part of the public API, so a future Obsidian release could
change them. If it does, the plugin silently does nothing.

## License

MIT
