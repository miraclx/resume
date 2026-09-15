#!/usr/bin/env bash
# Build the resume. The source at a commit IS that version.
#   ./build.sh          build HEAD -> build/Miraculous-Owonubi-Resume.pdf (the drag-to-upload file),
#                       and archive an auto-numbered versions/N-resume-<hash>.pdf
#                       (N = next in the dir, deduped by hash, skipped on a dirty tree)
#   ./build.sh <ref>    rebuild any past version from its commit -> build/<ref>-resume.pdf
#
# Toolchain in stage/ (typst 0.15.1 + Inter). build/ and versions/ are untracked.
set -euo pipefail
cd "$(dirname "$0")"

TYPST="stage/typst-bin"
FONTS="stage/fonts"
mkdir -p build versions

compile() { "$TYPST" compile --font-path "$FONTS" "$1" "$2"; }

# Rebuild a specific past version on demand.
if [ "${1:-}" ]; then
  git show "${1}:resume.typ" > "stage/_rebuild.typ"
  out="build/${1}-resume.pdf"
  compile "stage/_rebuild.typ" "$out"
  echo "built: $out"
  exit 0
fi

# Latest (HEAD): the named drag file always reflects the current source.
named="build/Miraculous-Owonubi-Resume.pdf"
compile resume.typ "$named"
echo "built: $named"

# Archive an ordered snapshot: numbered to match the dir, stamped with the commit.
if [ -n "$(git status --porcelain resume.typ 2>/dev/null)" ]; then
  echo "archive: skipped (uncommitted changes; commit to archive HEAD)"
else
  hash="$(git rev-parse --short HEAD)"
  if ls versions/*-resume-"$hash".pdf >/dev/null 2>&1; then
    echo "archive: HEAD ($hash) already saved"
  else
    last="$(ls versions 2>/dev/null | sed -n 's/^\([0-9]\{1,\}\)-resume-.*\.pdf$/\1/p' | sort -n | tail -1)"
    n=$(( ${last:-0} + 1 ))
    cp "$named" "versions/${n}-resume-${hash}.pdf"
    echo "archived: versions/${n}-resume-${hash}.pdf"
  fi
fi
