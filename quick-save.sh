#!/bin/bash
# Usage: ./quick-save.sh [-c] [-w]

set -euo pipefail

# -- preflight --
command -v typst &>/dev/null || { echo "error: typst not found in PATH" >&2; exit 1; }

for f in contact.typ data.typ main.typ; do
  [[ -f "$f" ]] || { echo "error: $f not found" >&2; exit 1; }
done

# -- args --
CMD="compile"
CLEAR=false

while getopts ":cw" opt; do
  case $opt in
    c) CLEAR=true ;;
    w) CMD="watch" ;;
    *) echo "usage: $0 [-c] [-w]" >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

# -- clear --
if $CLEAR; then
  rm -rf exports
  echo "cleared exports/"
fi

# -- parse metadata --
NAME=$(grep '^#let name' contact.typ | sed 's/.*"\([^"]*\)".*/\1/' | head -1)
ROLE=$(grep 'target-role' data.typ   | sed 's/.*"\([^"]*\)".*/\1/' | head -1 \
  | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | tr -s ' ' '_' | sed 's/^_//;s/_$//')

[[ -n "$NAME" ]] || { echo "error: could not parse name from contact.typ" >&2; exit 1; }
[[ -n "$ROLE" ]] || { echo "error: could not parse target-role from data.typ" >&2; exit 1; }

# Restrict to safe filename characters
INITIALS=$(echo "$NAME" | awk '{for(i=1;i<=NF;i++) printf substr($i,1,1)}' | tr -dc '[:alnum:]')
[[ -n "$INITIALS" ]] || { echo "error: could not derive initials from name" >&2; exit 1; }

OUT="exports/Resume_${INITIALS}_${ROLE}.pdf"

mkdir -p exports

# -- collision check --
if [[ -f "$OUT" && "$CMD" == "compile" ]]; then
  BASE="exports/Resume_${INITIALS}_${ROLE}"
  N=1
  while [[ -f "${BASE}-${N}.pdf" ]]; do
    N=$(( N + 1 ))
  done
  OUT="${BASE}-${N}.pdf"
  echo "note: file exists, writing to $OUT"
fi

# -- compile --
echo "$CMD → $OUT"
TMPLOG=$(mktemp)
trap 'rm -f "$TMPLOG"' EXIT

set +e
typst "$CMD" main.typ "$OUT" 2>"$TMPLOG"
TYPST_EXIT=$?
set -e

grep -Ev '@preview/scienceicons|no whitespace before raw text|= hint:|[│┌─]|^[[:space:]]*$' "$TMPLOG" >&2 || true
exit $TYPST_EXIT