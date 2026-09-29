#!/usr/bin/env bash
# Install one plugin (or --all) from this repo into an Obsidian vault.
# Usage: ./install.sh <plugin-id|--all> <vault-path>   (FORCE=1 skips the "Obsidian running" check)
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
[ $# -eq 2 ] || { echo "usage: $0 <plugin-id|--all> <vault-path>" >&2; exit 1; }
target="$1"; vault="$2"

[ -d "$vault/.obsidian" ] || { echo "not an Obsidian vault (no .obsidian/): $vault" >&2; exit 1; }
if [ "${FORCE:-}" != 1 ] && pgrep -xq Obsidian; then echo "quit Obsidian first (it overwrites community-plugins.json)" >&2; exit 1; fi
command -v jq >/dev/null || { echo "jq is required" >&2; exit 1; }

if [ "$target" = "--all" ]; then
  ids=$(ls "$here/plugins")
else
  [ -f "$here/plugins/$target/manifest.json" ] || { echo "unknown plugin: $target" >&2; exit 1; }
  ids="$target"
fi

list="$vault/.obsidian/community-plugins.json"
[ -f "$list" ] || echo '[]' > "$list"

for id in $ids; do
  src="$here/plugins/$id"
  dest="$vault/.obsidian/plugins/$id"
  mkdir -p "$dest"
  for f in main.js manifest.json styles.css; do
    [ -f "$src/$f" ] && cp "$src/$f" "$dest/$f"
  done
  tmp=$(mktemp)
  jq --arg id "$id" '. + [$id] | unique' "$list" > "$tmp" && mv "$tmp" "$list"
  echo "installed $id $(jq -r .version "$src/manifest.json") → $dest"
done
