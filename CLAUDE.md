# Vault Operating Manual (Sahas AI Centralized Memory)

This repo IS the memory. It is a plain-Markdown Obsidian vault synced via Git.
Any agent working here — Claude Code, Codex, Hermes — follows the rules below.

## Golden rules
1. **Pull before you read. Push after you write.** Another device or the Hermes agent may have written since your last look.
2. **Never delete or rewrite a user-authored note.** Add, append, or create a new note. If something looks wrong, surface it — do not silently "fix" it.
3. **Plain Markdown only.** No databases, no proprietary formats. Every note must stay human-readable in Obsidian.
4. **One idea per note.** Small, linkable notes beat long documents.
5. **Never commit secrets.** API keys, tokens, passwords and client PII stay out. `.env`, `*.key`, `*.pem`, and `.obsidian/plugins/*/data.json` are gitignored — keep it that way.

## Where things go
| Folder | Put this here |
|---|---|
| `00_Inbox` | Raw, unsorted captures. Ingestion drops here FIRST, then sorts. |
| `01_Agency` | Sahas AI itself: offerings, SOPs, pricing, positioning. |
| `02_Clients` | One subfolder per client. |
| `03_Projects` | Active builds (e.g. GMB Sarathi, WhatsApp automation). |
| `04_Knowledge` | Reference, how-tos, research, saved learnings. |
| `05_Agent-Memory` | Long-term memory agents read AND write. `Hermes/` is Hermes's own store. |
| `06_Sources` | Per-tool conversation logs / exports (`Claude/`, `ChatGPT/`, `Codex/`, `Hermes/`). |
| `_templates` | Note templates. Do not put knowledge here. |

Every folder has an `_index.md` describing what belongs in it. Read it before filing.

## Note format (required)
Every note starts with front-matter:

```markdown
---
title: Human readable title
created: YYYY-MM-DD
tags: [topic, client-name]
source: where this came from (URL, chat export, conversation, person)
origin: ai | human          # who authored this note
author: claude-code | codex | hermes | claude.ai | chatgpt | yogesh
---

# Human readable title

Content...
```

**`origin:` is required on every note an agent creates.** It keeps AI-written notes
distinguishable from the user's own writing at a glance and in search — so a later agent
never mistakes a machine-generated draft for a human-confirmed fact. Human-authored notes
may omit it; agents must not.

- Link related notes with `[[wikilinks]]`. A link to a not-yet-existing note is fine — it marks a gap.
- Use `#tags` for cross-cutting themes that don't fit the folder tree.
- Filenames: `kebab-case-title.md`. No dates in filenames unless the note is time-specific.

## How to FIND things (retrieval order)
Do this instead of grepping the whole vault blindly:
1. Read `MOC.md` (Map of Content) — the home index.
2. Read the relevant `_index.md` to confirm the folder.
3. Then search within that folder; follow `[[wikilinks]]` outward.
4. Only fall back to a full-vault text search if the above misses.

## How to WRITE (write-back protocol)
1. `git pull` (or run `pull.ps1`).
2. Check for an existing note on the topic — **update it rather than creating a near-duplicate**.
3. Create/update the note with correct front-matter in the correct folder.
4. Add a link to it from `MOC.md` or the parent `_index.md` so it is reachable.
5. Commit with a clear message and push (or let the Obsidian Git plugin's 10-minute auto-sync handle it).

## Sync
- Remote: `origin/main` on GitHub (private).
- Obsidian Git plugin auto commit-and-syncs every 10 minutes and pulls on startup.
- Manual: `pull.ps1` before editing, `sync.ps1` after.
- If you hit a merge conflict, STOP and report it. Do not force-push.
