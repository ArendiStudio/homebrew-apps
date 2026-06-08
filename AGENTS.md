# Agent Instructions

This is the public Homebrew tap and binary distribution repo for Arendi apps.

Before substantive work read:

- `README.md`
- `packages/*/README.md` for package-specific behavior

Critical rules:

- Treat this repo as public and permanent. Do not commit anything that should
  not be visible forever.
- Never commit private source code, source archives, `.git`, `.arendi`,
  `agent-self-docs`, `src`, `crates`, `Cargo.toml`, `Cargo.lock`, debug
  symbols, source maps, or copied private docs into public artifacts.
- Public tarballs must contain compiled payloads and minimal package metadata
  only.
- Do not hand-edit release tarballs or checksums. Generate and audit them from
  source-owned release scripts.
- Before committing artifact changes, run the source-owned artifact sync/check
  path and verify formula syntax, JSON manifests, checksums, and tarball
  contents.
- If an artifact audit finds source/control files or suspicious payload
  contents, stop and report it instead of publishing.
- Keep README/package docs user-facing. Do not expose private implementation
  details, vulnerabilities, or internal repo structure unless explicitly
  approved.
