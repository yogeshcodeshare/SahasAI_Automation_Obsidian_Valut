# AGENTS.md — Sahas AI Centralized Memory Vault

This repo is a plain-Markdown Obsidian vault used as shared long-term memory by
Claude Code, Codex, Claude.ai, ChatGPT and the Hermes agent.

**The full operating manual is [CLAUDE.md](CLAUDE.md). Read it before doing anything.**
It is tool-agnostic despite the filename — folder taxonomy, note format, retrieval
order and the write-back protocol all live there.

## Quick contract
- **Pull before reading, push after writing.** (`pull.ps1` / `sync.ps1`, or plain git.)
- **Additive only.** Never delete or overwrite a user-authored note. Update or create.
- **Plain Markdown**, one idea per note, front-matter required (`title`, `created`, `tags`, `source`).
- **Find things via `MOC.md` → the folder's `_index.md` → the folder**, not blind full-text search.
- **Never commit secrets** (keys, tokens, client PII).
- **On merge conflict: stop and report.** Never force-push.

## Folder map
`00_Inbox` raw captures · `01_Agency` offerings/SOPs/pricing · `02_Clients` one folder per client ·
`03_Projects` active builds · `04_Knowledge` reference & research · `05_Agent-Memory` agent long-term memory
(`Hermes/` is Hermes's own store) · `06_Sources` per-tool chat exports · `_templates` templates.

## Ingestion
New material lands in `00_Inbox` first, then gets normalized (front-matter), classified into the
folder above, linked from `MOC.md`, and only then removed from the Inbox.

Status: structure and protocol are in place. Knowledge ingestion happens via the
`/ingest-sahasai-obsidian` workflow.
