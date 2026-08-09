---
title: Obsidian vault access protocol
created: 2026-08-09
updated: 2026-08-09
date: 2026-08-09
tags: [procedure, vault, hermes]
source: Yogesh's chief-of-staff operating rules
origin: ai
author: default
maturity: supported
confidence: high
---

# Obsidian vault access protocol

The Sahas AI Obsidian vault is the source of truth for agency, client, project, and documented-decision facts. Honcho is conversational memory; Multica is the task board.

**How to apply:** Pull before reading. Start with `MOC.md`, then the relevant folder `_index.md`, then the target note and linked notes. Cite the note path or wikilink in answers. Read all folders, but write only to `00_Inbox`, `03_Projects`, or `05_Agent-Memory/Hermes` unless Yogesh explicitly authorizes work in a client folder. Keep client contexts siloed. Never overwrite, move, or delete user-authored notes without approval.

Agent-created notes require `origin: ai`, `author: default`, and `date`. Add new notes to `MOC.md` and the relevant index, append the operation log when applicable, and commit plus push every write. Never store secrets or client personal PII. Prefer authenticated Obsidian Local REST API with MCP; if unavailable, use filesystem plus Git without guessing credentials.

Related: [[CLAUDE]], [[05_Agent-Memory/Hermes/PROTOCOL]]
