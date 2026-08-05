---
title: Feature kill-switch (fail-safe OFF)
created: 2026-08-02
tags: [pattern, feature-flag, safety, supabase, gmb-sarathi]
source: GMB Sarathi CR-1 (Claude Code build)
origin: ai
author: claude-code
maturity: supported
---

# Feature kill-switch (fail-safe OFF)

Pattern for gating a risky/expensive capability behind a switch that **defaults to OFF and fails
OFF** — so a missing column, a read error, or a half-applied migration can never accidentally
enable it. Used in GMB Sarathi as **CR-1** to keep the paid DataForSEO integration dormant.

## Shape
- **DB flag:** a single settings row column, e.g. `settings.dataforseo_live_enabled boolean not null default false`.
- **Narrow reader that fail-safes:** a dedicated `readLiveDataFlag()` that returns `false` on ANY
  error (missing column, no row, parse failure) — it must NOT depend on parsing the whole settings object.
- **Server gate:** `assertLiveDataEnabled()` throws a typed `LIVE_DATA_DISABLED` (503) before any
  paid work or row creation, so the client gets a clean error and nothing is spent/created.
- **Client registry mirror:** a `LIVE_ENDPOINTS` map (`{path: boolean}`) flips a screen from mock
  to live one endpoint at a time; on any failure the UI falls back to its typed mock (never fatal).

## Why it works
Two independent layers (DB reader + server gate) both default OFF, and the client can't reach the
paid path while the registry key is `false`. Verified: with the flag OFF, anon/live reads return the
fail-safe, `spend_ledger` stays untouched, and a poisoned `fetch` proves zero vendor calls.

## Reuse
Good for any paid API, publish action, or destructive feature you want built but dormant until a
deposit/keys/approval lands. Pair with a [[demo-mode-synthetic-audit-generator]] so the product
still demos while the real thing is OFF. See project [[gmb-sarathi]].
