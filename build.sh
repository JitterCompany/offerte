#!/bin/bash
# Build one or all offertes
# Usage:
#   ./build.sh quotes/2604-001.typ    # Build one
#   ./build.sh                          # Build all

set -euo pipefail
cd "$(dirname "$0")"

build_quote() {
  local typ_file="$1"
  local basename=$(basename "$typ_file" .typ)
  local output="output/offerte-${basename}.pdf"

  echo "Building ${output}..."
  typst compile "$typ_file" "$output" --root .
  echo "  -> ${output}"
}

if [ $# -eq 1 ]; then
  build_quote "$1"
else
  echo "Building all quotes..."
  for f in quotes/*.typ; do
    build_quote "$f"
  done
  echo "Done."
fi
