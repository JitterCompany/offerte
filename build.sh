#!/bin/bash
# Build one or all offertes
# Usage:
#   ./build.sh quotes/2604-001/2604-001.typ    # Build one
#   ./build.sh                                   # Build all

set -euo pipefail

TEMPLATE_DIR="$(cd "$(dirname "$0")" && pwd)"

build_quote() {
  local typ_file="$1"
  local typ_dir="$(cd "$(dirname "$typ_file")" && pwd)"
  local basename="$(basename "$typ_file" .typ)"
  local output="${typ_dir}/${basename}.pdf"

  echo "Building ${output}..."
  typst compile "$typ_file" "$output" --root "$TEMPLATE_DIR"
  echo "  -> ${output}"
}

if [ $# -eq 1 ]; then
  build_quote "$1"
else
  echo "Building all quotes..."
  for f in quotes/*/*.typ; do
    build_quote "$f"
  done
  echo "Done."
fi
