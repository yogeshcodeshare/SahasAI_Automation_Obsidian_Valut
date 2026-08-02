# Operation Log

Append-only record of every ingest, query-filed-back, and lint pass against this vault.
**Never edit or delete past entries — only append.**

Why it exists: five different tools write here (Claude Code, Codex, Hermes, Claude.ai, ChatGPT).
This log is the shared audit trail that lets any of them see what already happened, avoid
re-ingesting the same source, and answer "when did we learn this?".

## Entry format

Start every entry with this exact prefix so the log stays greppable with plain tools:

```
## [YYYY-MM-DD] <op> | <Title>
```

Where `<op>` is one of `ingest`, `query`, `lint`. Follow with 1–3 lines: what was processed,
which notes were created/updated, and the agent that did it.

Recent entries:

```bash
grep "^## \[" log.md | tail -10
```

---

## [2026-08-02] setup | Vault initialized
Structure, protocol files, and sync configured. No knowledge content ingested yet.
Agent: claude-code
