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
maturity: established | supported | emerging | theoretical
---

# Human readable title

Content...
```

**`origin:` is required on every note an agent creates.** It keeps AI-written notes
distinguishable from the user's own writing at a glance and in search — so a later agent
never mistakes a machine-generated draft for a human-confirmed fact. Human-authored notes
may omit it; agents must not.

**`maturity:` says how much weight a claim carries.** `origin:` answers *who said it*;
`maturity:` answers *how solid it is*. Without it, a verified GSTIN and a speculative market
hypothesis look identical to the next agent that reads them.

| Value | Means | Example |
|---|---|---|
| `established` | Verified fact — documented, signed, shipped, or confirmed by Yogesh | GSTIN, signed reseller terms, code that runs |
| `supported` | Good evidence, not formally verified | vendor pricing from their site, UAT findings |
| `emerging` | Early signal, could change | competitor intel, a vertical that looks promising |
| `theoretical` | Hypothesis or untested plan | a pitch angle nobody has tried yet |

Default to `supported` when unsure. **Only Yogesh's confirmation makes something
`established`** — an agent must never promote its own inference to `established`. When you
cite a fact in an answer, carry its maturity across: *"per `grexa-competitor-intel.md`
(emerging)…"*.

### Decision records
A decision is a first-class note, not a line buried in a project file — otherwise settled
questions get re-litigated and the rejected options are lost. Use
`_templates/decision-record.md`, tag it `#decision`, and file it where it belongs
(`01_Agency/` for business decisions, `03_Projects/` for build decisions). Record what was
decided, **what was rejected and why**, and what it depends on. That dependency list is what
makes the reweave check below possible.

- Link related notes with `[[wikilinks]]`. A link to a not-yet-existing note is fine — it marks a gap.
- Use `#tags` for cross-cutting themes that don't fit the folder tree.
- Filenames: `kebab-case-title.md`. No dates in filenames unless the note is time-specific.

## How to FIND things (retrieval order)
Do this instead of grepping the whole vault blindly:
1. Read `MOC.md` (Map of Content) — the home index, organized by category with a one-line
   summary per note. **This is the entry point for every tool**, and the only one available
   to cloud chats (Claude.ai / ChatGPT) that cannot search the filesystem.
2. Read the relevant `_index.md` to confirm the folder.
3. Then read the specific notes; follow `[[wikilinks]]` outward.
4. Only fall back to a full-vault text search if the above misses.

An index file plus link-following works well up to roughly a few hundred notes and avoids
needing embedding/vector search. If the vault outgrows it, evaluate `qmd` (local Markdown
search with hybrid BM25+vector and an MCP server) rather than adding a database.

**Keeping `MOC.md` useful is mandatory.** Any agent that adds a note must add it to `MOC.md`
under the right category with a one-line summary. An unlisted note is invisible to cloud tools.

## The three operations
- **Ingest** — new material in → normalized, classified, deduped, linked, `MOC.md` updated,
  entry appended to `log.md`. One source may legitimately touch several existing notes.
- **Query** — answer from the vault, citing note filenames. **A good answer is worth filing
  back as a new note** so the exploration compounds instead of dying in chat history.
- **Lint** — periodic health check. **Structure is mechanical; meaning needs a human.**
  - *Fix directly:* notes missing from `MOC.md` (they're invisible to cloud tools), orphan
    notes with no inbound links, broken `[[wikilinks]]`, missing front-matter fields, agent
    notes lacking `origin: ai` or `maturity:`.
  - *Report only, never resolve:* contradictions between notes, duplicates, stale claims. If
    one side is `origin: ai` and the other human-authored, say so — the human's likely wins,
    but it stays their call.
  - *Also report gaps:* a concept referenced across several notes with no note of its own is
    usually the next thing worth writing.
- **Reweave** — run after any significant ingest. For each `#decision` note, check its
  **Depends on** list: has any of those notes changed, or any stated assumption stopped
  holding, since the decision was made? If so, flag the decision for review — do not
  silently revise it. This is what stops the vault from confidently repeating a choice whose
  reasons expired. Also flag `maturity: emerging|theoretical` notes that newer material has
  since confirmed or contradicted.

Every ingest, lint, and reweave appends an entry to `log.md` (append-only, greppable).

## Multi-agent writes (transaction discipline)
When several agents work on one task, **workers return drafts; one orchestrator applies
them.** A sub-agent must not commit to the vault directly — it hands back proposed note
content, and the orchestrator reads the current files, merges, writes once, and commits once.
Parallel writers racing the same `MOC.md` or `log.md` is how lines get silently dropped. One
logical operation should be one reviewable commit.

## How to WRITE (write-back protocol)
1. `git pull` (or run `pull.ps1`).
2. Check for an existing note on the topic — **update it rather than creating a near-duplicate**.
3. Create/update the note with correct front-matter in the correct folder.
4. Add a link to it from `MOC.md` or the parent `_index.md` so it is reachable.
5. Commit with a clear message and push (or let the Obsidian Git plugin's 10-minute auto-sync handle it).

## If you have MCP vault tools available
Some hosts (Claude Desktop with an Obsidian MCP plugin) expose native vault tools —
search, read, create. Use them like this:

- **Read and search via MCP.** Semantic search finds notes by meaning, including ones missing
  from `MOC.md`. Prefer it over blind file reads.
- **Write via git.** A `git commit -m "ingest: …"` is a far better audit record than a file
  that silently appears and gets swept into a generic auto-sync commit ten minutes later.
- **If you must write via MCP**, you still owe the full protocol in the same pass: correct
  front-matter, the `MOC.md` line, the `_index.md` entry, and the `log.md` append. The
  transport changed; the rules did not.

MCP is local-only (`127.0.0.1`). It is unavailable to Claude.ai, ChatGPT, and any agent
running on a VPS — those reach the vault through GitHub. Never assume the other agents can
see something just because you can.

## Sync
- Remote: `origin/main` on GitHub (private).
- Obsidian Git plugin auto commit-and-syncs every 10 minutes and pulls on startup.
- Manual: `pull.ps1` before editing, `sync.ps1` after.
- If you hit a merge conflict, STOP and report it. Do not force-push.
