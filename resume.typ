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
  #v(3pt)
  #pad(x: 12%)[#text(fill: muted, style: "italic", size: 10pt)[I build the infrastructure other engineers depend on. Correctness first, cleverness never: illegal states unrepresentable, tests that can't lie.]]
  #v(5pt)
  #text(size: 9pt)[
    Remote · GMT+1 #h(5pt)|#h(5pt) #link("mailto:omiraculous@gmail.com")[omiraculous\@gmail.com] #h(5pt)|#h(5pt) #link("https://github.com/miraclx")[github.com/miraclx] #h(5pt)|#h(5pt) #link("https://www.linkedin.com/in/miraclx")[linkedin.com/in/miraclx]
  ]
]
#v(3pt)

= Experience

#entry[Independent Engineering & Open Source][September 2025 – Present]
#role[Rust Systems & Protocol Engineering][Remote]
- *theia* (Rust, #link("https://github.com/theia-hq")[github.com/theia-hq]): a public-key-addressed peer-to-peer overlay and services layer. Reach any machine by its ed25519 identity, not its IP or location, across NATs, with no address, account, or server in between. I ran it on iroh, then hand-wrote my own QUIC-over-UDP stack to the same trait and proved the two interchangeable under one conformance suite that ships decoy transports so it cannot pass by accident.
  - *nauthy* (capability auth): the key IS the identity, so authorization roots at the key the transport already proved, on biscuit and ed25519, verified offline against a single held key, no coordinator; attenuable, expiring, revocable, with a single-use admission witness whose replay-safety is enforced at compile time.
  - *Services:* any node exposes named, capability-gated services reachable by key, keyless SSH (the stream's admission is the only credential), HTTP fetch, BLAKE3-verified file transfer, and link measurement, all behind one CLI (swoosh), backed by 300+ integration tests.
- *Execution engine & storage:* built the sequencing and execution layer for private Ethereum L2s in Rust: an actor-model core and a purpose-built zero-copy storage engine with snapshot-isolated reads and atomic block-commit, on revm and alloy.
- *Edge caching & proxy:* built and deployed an edge-aware caching reverse proxy with distributed edge nodes for high-latency, last-mile networks.

#entry[Calimero Network][September 2023 – August 2025]
#role[Engineering Lead #h(6pt) (April 2024 – August 2025)][London, UK]
- Drove the protocol's shift from a transactional blockchain model to an eventually-consistent design, unlocking non-determinism and expanding its design space, and authored the spec paper that was formally adopted and implemented.
- Led the node architecture overhaul from monolithic to an actor model, and built recursive state sync between nodes (privileged state catchup, blob sharing, key distribution).
- Primary reviewer across the codebase: every protocol proposal and the bulk of merged PRs.

#role[Senior Software Engineer, Protocol #h(6pt) (September 2023 – May 2024)][]
- The Calimero protocol started as my internal-hackathon submission and became the company's direction; I built its core: the networking stack (rust-libp2p, hole-punching and relay for resilient connectivity between distant nodes), a WASM runtime layer on Wasmer with a trivially swappable engine, layered zero-copy storage abstractions, and the guest-app SDK (proc-macros plus FFI to the WASM host).
- Wrote a paper on end-to-end encryption for dynamic groups; mentored the team through its adoption of Rust.

#block(breakable: false)[
  #entry[NEAR (Pagoda, Inc.)][March 2021 – June 2023]
  #role[Senior Software Engineer, Core & Developer Tools #h(6pt) (December 2021 – June 2023)][San Francisco, CA]
  - Sole author and maintainer of the Rust NEAR JSON-RPC client, which seeded the sandboxed node testing environment, the Rust NEAR CLI, and the indexer for the official NEAR explorer.
  - Contributed to cargo-near and introduced contract ABIs to NEAR; discovered and documented exploits in the NEAR BOS platform that led to a working group for reinventing its virtual machine.
  - Cut CI and Docker build times by up to 82%, most notably for the FastAuth account-recovery node tests.

  #role[Senior Software Engineer, Node Interfaces #h(6pt) (March 2021 – December 2021)][]
  - Led the standardization of a strictly-typed AccountId, drove workspace crates to independence for crates.io, and built the tooling (themis) and CI pipelines for crate compliance, fuzz, and simulation testing.
]

#block(breakable: false)[
  #entry[Open Source & Freelance][January 2016 – Present]
  #role[Software Engineer][Remote]
  - *freyr* (Node.js): an open-source music-downloader CLI (Spotify, Apple Music, Deezer) with metadata and library organization. 2.3k+ stars, 15k+ DockerHub pulls.
  - *cargo-workspaces* (Rust): a maintained fork with substantial patches for nearcore's workspace complexity; *xget* (Node.js): a concurrent chunked web-content downloader.
]

= Skills
#text(size: 9.5pt)[
  *Languages:* Rust (expert); Python, JavaScript, TypeScript (proficient); C/C++, Go (reading fluency).

  *Systems & networking:* P2P and mesh networking, libp2p, iroh, custom transports, QUIC, NAT traversal, async Rust (tokio); storage engines (RocksDB, LMDB); operating systems, Linux internals, virtualization, containers.

  *Distributed systems & protocol:* consensus and protocol design, Ethereum execution (reth, revm, alloy), WebAssembly (WASM) runtimes, applied cryptography and capability security.

  *Craft:* clean API design (libraries, REST, JSON-RPC), CLI and TUI, CI/CD, debugging, profiling, reverse engineering, exhaustive testing (unit, integration, fuzz).
]

= Education
#entry[Redeemer's University, Osun, Nigeria][July 2018 – May 2021]
#role[B.Sc., Computer Science][]
#text(size: 9.5pt)[Operating Systems, Compiler Architecture, Language Development, Databases, Algorithms.]

#v(5pt)
#text(size: 9.5pt)[*#text(fill: accent)[Interests:]* distributed systems, applied cryptography, zero-knowledge proofs, information theory, fault tolerance.]
