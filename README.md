# Resume

`resume.typ` (Typst) is the source. PDFs are never committed and are rebuilt on demand, deterministic given the pinned toolchain in `stage/` (typst-bin v0.15.1 + Inter).

## Build
- `./build.sh` — build the latest into `build/Miraculous-Owonubi-Resume.pdf`. Drag that to job uploads; it's named for the recruiter.
- `./build.sh <hash>` — rebuild any past version from its commit into `build/<hash>-resume.pdf`.

## Layout
- `build/` — build output (untracked).
- `stage/` — toolchain: `typst-bin` + `fonts/` (untracked).
- `.gitignore` names only `build/` and `stage/`.

History: `git log --oneline resume.typ`; milestones are tagged `vN`.
