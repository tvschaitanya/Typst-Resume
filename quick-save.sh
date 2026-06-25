#!/bin/bash
# Usage: ./quick-save.sh [-c] [watch]

set -euo pipefail

# -- preflight --
command -v typst &>/dev/null || { echo "error: typst not found in PATH" >&2; exit 1; }

for f in contact.typ data.typ main.typ; do
  [[ -f "$f" ]] || { echo "error: $f not found" >&2; exit 1; }
done

# -- args --
CMD="compile"
CLEAR=false

while getopts ":c" opt; do
  case $opt in
    c) CLEAR=true ;;
    *) echo "usage: $0 [-c] [watch]" >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

[[ "${1:-}" == "watch" ]] && CMD="watch"

# -- clear --
if $CLEAR; then
  rm -rf exports
  echo "cleared exports/"
fi

# -- parse metadata --
NAME=$(grep '^#let name' contact.typ | sed 's/.*"\([^"]*\)".*/\1/' | head -1)
ROLE=$(grep 'target-role' data.typ   | sed 's/.*"\([^"]*\)".*/\1/' | head -1 \
  | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | tr -s ' ' '_' | tr -s '_')

[[ -n "$NAME" ]] || { echo "error: could not parse name from contact.typ" >&2; exit 1; }
[[ -n "$ROLE" ]] || { echo "error: could not parse target-role from data.typ" >&2; exit 1; }

INITIALS=$(echo "$NAME" | awk '{for(i=1;i<=NF;i++) printf substr($i,1,1)}')
OUT="exports/Resume_${INITIALS}_${ROLE}.pdf"

mkdir -p exports

# -- collision check --
if [[ -f "$OUT" && "$CMD" == "compile" ]]; then
  STAMP=$(date +"%Y-%m-%d_%I%M%p")
  OUT="exports/Resume_${INITIALS}_${ROLE}_${STAMP}.pdf"
  echo "note: file exists, writing to $OUT"
fi

echo "$CMD → $OUT"
typst "$CMD" main.typ "$OUT"