---
title: Approve-before-publish + immutable baseline (manual-mode sprint)
created: 2026-08-02
tags: [pattern, safety, db-trigger, workflow, gmb-sarathi]
source: GMB Sarathi P12 Optimization Sprint (Claude Code build)
origin: ai
author: claude-code
---

# Approve-before-publish + immutable baseline (manual-mode sprint)

Safety patterns from GMB Sarathi's P12 Optimization Sprint (EP-021/022), where a founder works a
grouped fix-list against a client's profile in **manual mode** — no automated writes to the live
system, nothing acted on without a human tap, and a locked "before" snapshot for the after-report.

## Manual mode = zero external writes
"Apply a fix" performs **no GBP API write**. Each task carries a copy-value + an allowlisted
"open Google editor" deep-link (opened in the founder's own browser, never fetched server-side,
never carries a token). Enforce by keeping the vendor/publish client un-importable from the sprint
module (grep the diff on merge).

## Approve-before-publish
AI-prefilled suggestions persist `approved=false`. For an AI-sourced task, the server rejects
`status='done'` unless `approved=true` AND the founder logged the value they actually applied
(`change_after`). The approval tap — not the mere presence of a suggestion — is the gate that
unlocks copy/apply/done. (Same class of bug caught elsewhere in UAT: a save that toasted "success"
on a failed write; and a PDF button that toasted "ready" on failure — never show success without a
verified success response.)

## Immutable baseline with DB teeth
The "before" snapshot (baseline audit + grid) is captured once at sprint start and must never
change. Route-level omission of the field is not enough — add a **Postgres BEFORE UPDATE trigger**
that raises if `baseline_*` changes once set, and freezes the row once `status='complete'`. Also
enforce a **partial unique index** for the one-active-per-entity invariant. Route code validates a
strict request shape (unknown keys → 400); the DB is the real guarantee.

See project [[gmb-sarathi]].
