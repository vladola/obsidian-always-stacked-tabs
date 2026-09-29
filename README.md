# obsidian-plugins

Small personal Obsidian plugins, one folder each under `plugins/`. No build step: each plugin is
plain `main.js` + `manifest.json` (+ optional `styles.css`).

| Plugin | What it does |
| --- | --- |
| [always-stacked-tabs](plugins/always-stacked-tabs) | Keeps main-area tab groups stacked (Andy Matuschak-style sliding panes) across restarts and layout rebuilds |

## Install into a vault

Quit Obsidian first, then:

```bash
./install.sh <plugin-id> "/path/to/vault"     # e.g. ./install.sh always-stacked-tabs ~/MyVault
./install.sh --all "/path/to/vault"
```

This copies the plugin into `<vault>/.obsidian/plugins/<id>/` and enables it in
`community-plugins.json`. Community plugins must be turned on in the vault (Settings → Community plugins).

## License

MIT
