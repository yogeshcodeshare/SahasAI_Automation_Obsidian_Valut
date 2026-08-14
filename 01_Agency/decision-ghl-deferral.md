---
title: Decision — Defer GoHighLevel; run on Veblika + n8n + Sheets
created: 2026-08-06
updated: 2026-08-14
tags: [decision, ghl, whatsapp, vendors, automation]
source: Claude planning conversation (Sahas AI stack decisions)
origin: ai
author: claude.ai
maturity: supported
status: superseded — see Update below
---

# Decision — Defer GoHighLevel; run on Veblika + n8n + Sheets

> AI-drafted decision record for Yogesh to confirm. On confirmation, promote to `origin: human`, `author: yogesh`, `maturity: established`.

## Decision
Do not adopt GoHighLevel at launch. Run the WhatsApp + lead-pipeline stack on **Veblika (WhatsApp API) + self-hosted n8n + Google Sheets**; add GHL later only if a specific client requires it.

## Context
Bootstrapped, pre-revenue, tools budget ~₹3–6k/month. GHL's own agency plans are costly at launch (vendor pricing ~$297–497/mo), and even the cheaper Bizautomation reseller sub-account (~₹1k/mo, see [[bizautomation-reseller-deal]]) adds a "rented rails" dependency before there is revenue to justify it. Google Sheets + n8n cover the early lead pipeline (capture → CRM rows → scheduled reminders) at near-₹0. The training this stack is modelled on (Automation Saathi) teaches DoubleTick + GHL + n8n + Sheets; our mapping substitutes Veblika for DoubleTick and defers GHL — see [[ai-tools-stack-3-layer]].

## Alternatives rejected
- **Adopt GoHighLevel now** — rejected: too costly at launch for a pre-revenue solo agency, and it front-loads a vendor dependency (client assets living in a rented GHL sub-account) before there are clients to warrant it. Sheets + n8n deliver the same pipeline outcome for early clients at near-zero cost.
- **DoubleTick as the WhatsApp layer** — rejected in favour of Veblika (annual-only billing risk; see [[whatsapp-automation-vendors]]).

## Depends on
- [[ai-tools-stack-3-layer]] — the Veblika + n8n + Sheets mapping and the "deferred GHL" row.
- [[n8n-self-hosting-agency]] — n8n Community Edition covers scheduling/glue free.
- [[whatsapp-automation-vendors]] — Veblika as the WhatsApp API layer; churn-safe ownership model.
- [[bizautomation-reseller-deal]] — the ~₹1k/mo GHL reseller route available if/when needed.
- Assumption: Sheets + n8n adequately cover the pipeline for the first clients, and no early client hard-requires GHL-specific features (built-in funnels/calendars/pipelines in one CRM).

## Consequences
- No GHL monthly cost now; pipeline state lives in Google Sheets masters + n8n workflows.
- If a client later needs GHL, it can be added via the Bizautomation reseller sub-account (~₹1k/mo) without re-architecting — the WhatsApp layer (Veblika) stays.
- Slightly more manual glue (Sheets + n8n) versus an all-in-one CRM.

## Review trigger
Reopen this decision if any of: (a) a client specifically requires GoHighLevel features; (b) GHL or the Bizautomation reseller pricing changes materially; (c) the agency scales past what Sheets + n8n comfortably handle (many clients / high pipeline volume).

---

## Update — 2026-08-14: superseded, GHL adoption now firm

**Yogesh confirmed** (WhatsApp Automation Plan revision session, 2026-08-14, via explicit plan approval) that the indefinite deferral above no longer holds. New sequencing: Veblika + n8n still runs Phase 1 exactly as this decision originally intended (WhatsApp-native automation → n8n added where needed → other integrations → full testing) — but **GHL now has a firm, scheduled adoption point: Phase 2, immediately after Phase 1 is confirmed and live.** This is no longer conditional on a specific client requiring GHL features; it's a planned next step for the agency's own stack regardless.

This changes review-trigger (a) below — GHL adoption is now scheduled on its own, not gated behind client demand. Triggers (b) and (c) (pricing changes, scale past Sheets+n8n) still apply as-written to the *original* deferral reasoning, but are largely moot now that adoption is scheduled anyway.

Full phased plan (Phase 1a–1d WhatsApp+n8n → Phase 2 GHL → Phase 3 website/social → Phase 4 Hermes → Phase 5 coaching vertical) is summarized in [[whatsapp-automation-agency-phased-plan]], with the detailed build-ready version in the working folder `What's App Automation/WhatsApp Automation template & workflow/` (outside the vault — planning workspace, not yet mirrored here in full).

*Status note: if later reversed or superseded, do not delete — set `status:` accordingly and link the replacing note.*
