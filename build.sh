#!/usr/bin/env bash
# Build the resume. The source at a commit IS that version; PDFs are never committed, only rebuilt.
#   ./build.sh          compile the latest -> build/Miraculous-Owonubi-Resume.pdf (your drag-to-upload file)
#   ./build.sh <ref>    rebuild any past version from its commit -> build/<ref>-resume.pdf
#
# Toolchain in stage/ (typst-bin v0.15.1 + fonts/Inter). Toolchain and output are untracked.
set -euo pipefail
cd "$(dirname "$0")"

TYPST="stage/typst-bin"
FONTS="stage/fonts"
mkdir -p build

if [ "${1:-}" ]; then
  git show "${1}:resume.typ" > "stage/_rebuild.typ"
  out="build/${1}-resume.pdf"
  "$TYPST" compile --font-path "$FONTS" "stage/_rebuild.typ" "$out"
else
  out="build/Miraculous-Owonubi-Resume.pdf"
  "$TYPST" compile --font-path "$FONTS" resume.typ "$out"
fi
echo "built: $out"
