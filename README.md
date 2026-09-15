# Resume

`resume.typ` (Typst) is the source. PDFs are never committed and are rebuilt on demand, deterministic given the pinned toolchain (typst 0.15.1 + Inter).

**Latest PDF:** https://github.com/miraclx/resume/releases/latest/download/Miraculous-Owonubi-Resume.pdf — CI builds and releases it on every `vN` tag.

## Build locally
- `./build.sh` — build the latest into `build/Miraculous-Owonubi-Resume.pdf`. Drag that to job uploads; it's named for the recruiter.
- `./build.sh <hash>` — rebuild any past version from its commit into `build/<hash>-resume.pdf`.

## Release
Tag a milestone (`git tag vN && git push --tags`); CI (`.github/workflows/release.yml`) builds the PDF and attaches it to a GitHub Release. Tag-only, never on every commit.

## Layout
- `build/` — local build output (untracked).
- `stage/` — local toolchain: `typst-bin` + `fonts/` (untracked).
- `.gitignore` names only `build/` and `stage/`.

History: `git log --oneline resume.typ`.
