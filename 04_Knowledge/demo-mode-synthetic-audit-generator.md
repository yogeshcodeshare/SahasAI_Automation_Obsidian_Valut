---
title: Demo mode (deterministic synthetic generator)
created: 2026-08-02
tags: [pattern, demo-data, testing, safety, gmb-sarathi]
source: GMB Sarathi UAT-2 (Claude Code build)
origin: ai
author: claude-code
---

# Demo mode (deterministic synthetic generator)

Let a data product **run its full pipeline on realistic synthetic data** when the paid live source
is off — so every screen works, demos well, and is clearly badged, at ₹0 and zero risk. Built in
GMB Sarathi as EP-001 `mode: "live" | "demo"`.

## Shape
- **Request flag:** `mode` (default `"live"`). `"demo"` runs the SAME scoring/persistence pipeline
  against a **deterministic** generator (seeded by business name+city → reproducible), never the vendor client.
- **Provenance surfaced:** persist `is_demo=true` on the row + `source:"demo"` in the snapshot; the
  read endpoint returns them so **every screen badges "DEMO"** (a per-row chip + a report banner).
- **Cleanup hook:** `is_demo=true` lets a `flush:demo` script reap all demo rows before go-live
  (audits cascade-delete from the business row).

## The three SEC guarantees (gate these on merge)
1. **Zero vendor calls** — the demo branch must not construct/call the paid client. Prove with a
   poisoned-`fetch` test (fail the test if any network call fires).
2. **`is_demo=true`** everywhere the demo writes.
3. **Zero spend** — skip the spend guard; assert the spend ledger is unchanged after a demo run.

## Notes
- The demo generator is the same code path as a **fixture-snapshot backfill** — one deterministic
  input → `buildSnapshot()` → persist. That means "seed every demo business with a full report" and
  "run a demo audit" are the same mechanism.
- Pairs with [[feature-kill-switch-fail-safe-off]] (demo is the fallback while the live flag is OFF).
  See project [[gmb-sarathi]].
