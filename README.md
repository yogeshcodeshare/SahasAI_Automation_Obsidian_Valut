# SahasAI Automation — Obsidian Vault (Centralized Memory)

This vault is the single shared brain for my AI automation agency (Sahas AI).
It is plain Markdown, synced with Git so the same notes are available on my laptop,
on any server running the Hermes agent, and readable by Claude / ChatGPT / Codex.

## Folders
- 00_Inbox — raw unsorted captures
- 01_Agency — Sahas AI offerings, SOPs, pricing, positioning
- 02_Clients — one folder per client
- 03_Projects — active builds
- 04_Knowledge — reference and research
- 05_Agent-Memory — long-term memory Hermes reads and writes
- 06_Sources — per-tool conversation logs (Claude / ChatGPT / Codex / Hermes)
- _templates — note templates

## Sync
Git is the sync method. GitHub hosts the remote; no separate Obsidian server is needed.
Auto-sync via the "Obsidian Git" community plugin, or run sync.ps1 manually.

Status: structure only — content ingestion happens in a later step.
