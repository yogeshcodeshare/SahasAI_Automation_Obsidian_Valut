---
title: Spend guard (paid-API cost control)
created: 2026-08-02
tags: [pattern, cost-control, paid-api, safety, gmb-sarathi]
source: GMB Sarathi SpendGuard (Claude Code build)
origin: ai
author: claude-code
---

# Spend guard (paid-API cost control)

First-class budget control so a paid external API can never blow past a daily cap. Built in GMB
Sarathi around DataForSEO (the only paid vendor) and enforced before any feature used it.

## Shape
- **Ledger table** (`spend_ledger`): every paid call writes a row (reserve → settle).
- **Atomic reserve/settle:** `SpendGuard.guarded(estimate, fn)` reserves the estimated cost
  atomically, runs the call, then settles to the actual cost — so concurrent calls can't race past the cap.
- **Required dependency:** the paid client CANNOT be constructed without the guard (compiler-enforced),
  so there is no code path that calls the vendor un-guarded.
- **Pre-check for a clean error:** routes call `assertCanSpend(estimate)` before creating rows, to
  return a clean `SPEND_CAP_REACHED` (402) instead of a partial failure.
- **Cost preview:** every paid endpoint supports `{ preview: true }` → returns a `CostPreview`
  (USD + INR) so the UI shows "this costs ~₹2" before the founder taps.

## Reuse
Any product that calls a metered/paid API (search, enrichment, LLM, SMS). The "guard is a required
constructor dep" trick is the key — it makes an un-guarded call a compile error, not a code-review
hope. Combine with [[feature-kill-switch-fail-safe-off]] to keep the whole thing OFF until funded.
See project [[gmb-sarathi]].
