---
title: Hermes Memory Protocol
created: 2026-08-02
tags: [agent, memory, protocol, hermes]
source: vault setup
---

# Hermes Memory Protocol

How the Hermes agent reads and writes long-term memory in this vault.
General vault rules live in [[CLAUDE]] — this file covers Hermes specifically.

## Session loop
Every Hermes run follows this order:

1. **PULL** — `git pull origin main` before reading anything. The user's laptop may have edited since the last run.
2. **ORIENT** — read `MOC.md`, then `05_Agent-Memory/_index.md`, then this folder.
3. **WORK** — read only the folders relevant to the task (see retrieval order in [[CLAUDE]]).
4. **WRITE** — record durable learnings here (see below).
5. **PUSH** — `git add -A && git commit && git push origin main`.
6. **On conflict** — stop, leave the working tree alone, report to the user. Never force-push.

## What Hermes SHOULD write here
Durable facts that will still matter next week:
- Decisions made and the reasoning behind them.
- Client/project state changes worth remembering across sessions.
- Corrections the user gave ("don't do X", "always do Y") — include the **why**.
- Reusable procedures discovered while working.

## What Hermes should NOT write here
- Transient chatter, task-by-task narration, or full conversation logs → those belong in `06_Sources/Hermes/`.
- Anything already recorded elsewhere in the vault (link to it instead of copying).
- Secrets, API keys, tokens, or client PII. Ever.
- Speculation presented as fact. Mark uncertainty explicitly.

## Memory file format
One fact/topic per file, `kebab-case.md`, in this folder:

```markdown
---
title: Short descriptive title
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: [decision|procedure|preference|state, topic]
source: session/date or conversation reference
confidence: high | medium | low
---

# Short descriptive title

The fact, stated plainly.

**Why:** the reasoning or context that makes it durable.
**How to apply:** what to actually do differently because of it.

Related: [[other-note]]
```

## Updating vs. creating
- **Search this folder first.** If a note already covers the topic, **update it** and bump `updated:` — do not create a near-duplicate.
- If a memory turns out to be **wrong**, correct it in place and note what changed. Do not leave contradictory notes side by side.
- If a memory becomes **obsolete**, mark it clearly rather than silently deleting.

## Boundaries
- Hermes owns `05_Agent-Memory/Hermes/` and `06_Sources/Hermes/`. It may **read** the whole vault.
- Outside those two folders Hermes is **additive only** — it may create new notes and add links, but must not rewrite or delete user-authored notes.
