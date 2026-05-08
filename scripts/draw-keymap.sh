#!/usr/bin/env bash
# Usage: draw-keymap.sh <name>
# Run from repo root.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DRAW_DIR="$REPO_ROOT/draw"
CONFIG_DIR="$REPO_ROOT/config"

name="${1:?Usage: draw-keymap.sh <lily58|corne|blecorne|toucan|toucan36>}"

case "$name" in
  lily58|corne)
    layout_args=""
    ;;
  blecorne)
    layout_args="-k crkbd/rev1 -l LAYOUT_split_3x6_3"
    ;;
  toucan)
    layout_args="-j $CONFIG_DIR/toucan.json"
    ;;
  toucan36)
    layout_args="-j $CONFIG_DIR/toucan36.json"
    ;;
  *)
    echo "Unknown keyboard: $name" >&2; exit 1
    ;;
esac

keymap -c "$DRAW_DIR/config.yaml" parse \
  -z "$CONFIG_DIR/${name}.keymap" \
  > "$DRAW_DIR/${name}.yaml"

# shellcheck disable=SC2086
keymap -c "$DRAW_DIR/config.yaml" draw \
  $layout_args \
  "$DRAW_DIR/${name}.yaml" \
  > "$DRAW_DIR/${name}.svg"

echo "drew $name → draw/${name}.svg"
