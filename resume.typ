// Miraculous Owonubi - resume (Typst)
// Compile:  ./typst-bin compile resume.typ resume.pdf
// Owned/maintained by the assistant; to change anything, just say what and it gets edited here.

#set page(paper: "us-letter", margin: (x: 0.8in, top: 0.6in, bottom: 0.6in))
#set text(font: ("Inter", "Helvetica Neue", "Arial"), size: 10pt, fill: rgb("#1a2332"))
#set par(leading: 0.66em, justify: false)

#let accent = rgb("#1f3a5f")
#let muted = rgb("#555555")

#set list(indent: 0.5em, spacing: 0.82em, marker: (text(fill: accent)[•], text(fill: accent)[◦]))

#show link: set text(fill: accent)

#show heading: it => block(above: 13pt, below: 4pt)[
  #set text(fill: accent, weight: "bold", size: 13.5pt, tracking: 0.08em)
  #smallcaps(it.body)
  #v(-4pt)
  #line(length: 100%, stroke: 0.6pt + accent.lighten(45%))
]

#let entry(title, date) = block(above: 14pt, below: 3.5pt)[
  #grid(columns: (1fr, auto), align: (left, right),
    text(weight: "bold", size: 11pt)[#title],
    text(fill: muted)[#date])
]
#let role(r, loc) = block(below: 5.5pt)[
  #grid(columns: (1fr, auto), align: (left, right),
    emph(r),
    text(fill: muted, size: 9pt)[#loc])
]

// ===================== HEADER =====================
#align(center)[
  #text(size: 26pt, weight: "bold", fill: accent)[Miraculous Owonubi]
  #v(3pt)
  #text(fill: accent, weight: "medium", size: 11pt, tracking: 0.02em)[Senior Rust Engineer  ·  Distributed Systems, P2P Networking, Protocol]
  #v(6pt)
  #text(size: 8.5pt)[
    Remote · GMT+1 #h(4pt)|#h(4pt) #link("mailto:omiraculous@gmail.com")[omiraculous\@gmail.com] #h(5pt)|#h(5pt) #link("https://miraclx.github.io")[miraclx.github.io] #h(5pt)|#h(5pt) #link("https://github.com/miraclx")[github.com/miraclx] #h(5pt)|#h(5pt) #link("https://www.linkedin.com/in/miraclx")[linkedin.com/in/miraclx]
  ]
]
#v(3pt)

= Highlights
- *NEAR Protocol* (core engineer): creator and principal author of its Rust JSON-RPC client, and 80+ merged PRs across nearcore itself (the 2.6k-star reference client).
- *Calimero* (engineering lead): drove the protocol's redesign, authored the adopted spec paper, primary reviewer across a 200+ PR codebase.
- Shipped, adopted open source: *freyr* at 2.3k stars and 42k Docker pulls, plus upstream work in tickrs, Apache Arrow, rustyline, and dialoguer.

= Experience

#entry[Independent Engineering & Consulting][September 2025 – Present]
#role[Rust Systems & Protocol Engineering][Remote]
- *Real-time bidding (adtech):* profiled the hot path to cut sustained tail-latency spikes from roughly 250ms to within a hard 150ms budget at tens of thousands of RPS, then built the analytics pipeline that turns the bid-stream into signals (competitor-landscape, security, forensics).
- *theia* (Rust, #link("https://github.com/theia-hq")[github.com/theia-hq]): a public-key-addressed overlay and services layer I architected and built. Reach any machine by its ed25519 key rather than its IP, then gate each service on a capability rooted in that same key: attenuable, expiring, verified offline, and revocable via a denylist the node checks at admission. Runs over iroh (which handles NAT traversal) or a UDP transport I wrote from scratch to learn one; any node exposes capability-gated services (keyless SSH, HTTP fetch, BLAKE3-verified transfer, link measurement) behind one CLI (swoosh), backed by 300+ integration tests.
- *Private EVM L2:* built the sequencing and execution engine in Rust: an actor-model core and a purpose-built zero-copy storage layer with snapshot-isolated reads and atomic block-commit, on revm and alloy.
- *BIM / 3D reconstruction:* built software that reconstructs LOD200 building models from noisy, occluded real-world point-cloud scans: denoising, clutter and furniture removal, and classification of architectural elements (walls, windows, stairs, arches), with a guided UX that folds the user into the analysis.

#entry[Calimero Network][September 2023 – August 2025]
#role[Engineering Lead #h(6pt) (April 2024 – August 2025)][London, UK]
- Redesigned the protocol from its original transactional model to an eventually-consistent design, unlocking non-determinism and expanding its design space, and authored the spec paper that was formally adopted and implemented.
- Led the node architecture overhaul from monolithic to an actor model, and built recursive state sync between nodes (privileged state catchup, blob sharing, key distribution).
- Primary reviewer across the codebase: protocol proposals and the bulk of merged PRs.

#role[Senior Software Engineer, Protocol #h(6pt) (September 2023 – March 2024)][]
- The Calimero protocol started as my internal-hackathon submission and became the company's direction; I built its core: the networking stack (rust-libp2p, hole-punching and relay for resilient connectivity between distant nodes), a WASM runtime layer on Wasmer with a trivially swappable engine, layered zero-copy storage abstractions, and the guest-app SDK (proc-macros plus FFI to the WASM host).
- Wrote a paper on end-to-end encryption for dynamic groups; mentored the team through its adoption of Rust.

#block(breakable: false)[
  #entry[NEAR (Pagoda, Inc.)][March 2021 – June 2023]
  #role[Senior Software Engineer, Core & Developer Tools #h(6pt) (December 2021 – June 2023)][San Francisco, CA]
  - 80+ merged PRs across nearcore (the 2.6k-star NEAR reference client) and its Rust tooling; creator and principal author of the Rust NEAR JSON-RPC client, which seeded the sandboxed node testing environment, the Rust NEAR CLI, and the indexer for the official NEAR explorer.
  - Introduced contract ABIs to NEAR: authored the NearSchema derive in near-sdk-rs and contributed to cargo-near; discovered and documented exploits in the NEAR BOS platform that fed into a working group for reinventing its virtual machine.
  - Cut CI and Docker build times by up to 82%, most notably for the FastAuth account-recovery node tests.

  #role[Senior Software Engineer, Node Interfaces #h(6pt) (March 2021 – December 2021)][]
  - Led the standardization of a strictly-typed AccountId, drove workspace crates to independence for crates.io, and built the tooling (themis) and CI pipelines for crate compliance, fuzz, and simulation testing.
]

#block(breakable: false)[
  #entry[Open Source & Freelance][January 2016 – Present]
  #role[Software Engineer][Remote]
  - *freyr* (Node.js): an open-source music-downloader CLI (Spotify, Apple Music, Deezer) with metadata and library organization. 2.3k+ stars, 42k+ DockerHub pulls.
  - *cargo-workspaces* (Rust): a maintained fork with substantial patches for nearcore's workspace complexity; *xget* (Node.js): a concurrent chunked web-content downloader.
  - *Upstream:* merged contributions to tickrs (1.7k-star stock TUI, 17 PRs), Apache Arrow's object_store, rustyline, and dialoguer.
]

= Skills
#text(size: 9.5pt)[
  *Languages:* Rust; Python, JavaScript, TypeScript (proficient); C/C++, Go (reading fluency).

  *Systems & networking:* P2P and mesh networking, libp2p, iroh, custom transports, QUIC, NAT traversal, async Rust (tokio); storage engines (RocksDB, LMDB); operating systems, Linux internals, virtualization, containers.

  *Distributed systems & protocol:* consensus and protocol design, Ethereum execution (revm, alloy), WebAssembly (WASM) runtimes, applied cryptography and capability security.

  *Craft:* clean API design (libraries, REST, JSON-RPC), CLI and TUI, CI/CD, debugging, profiling, reverse engineering, exhaustive testing (unit, integration, fuzz).
]

= Education
#entry[Redeemer's University, Osun, Nigeria][July 2018 – May 2021]
#role[B.Sc., Computer Science][]
#text(size: 9.5pt)[Operating Systems, Compiler Architecture, Language Development, Databases, Algorithms.]

#v(5pt)
#text(size: 9.5pt)[*#text(fill: accent)[Interests:]* distributed systems, applied cryptography, zero-knowledge proofs, information theory, fault tolerance.]
