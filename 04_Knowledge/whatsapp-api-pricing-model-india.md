---
title: WhatsApp API Pricing Model (India)
created: 2026-08-05
updated: 2026-08-14
tags: [whatsapp, pricing, meta, knowledge]
source: Claude Desktop conversation - AI Automation project
origin: ai
author: claude.ai
maturity: supported
---

# WhatsApp API Pricing Model (India)

Meta's per-message conversation model — what the **client** pays. Distinct from BSP platform fees (see [[whatsapp-automation-vendors]]).

> ⚠️ **Verify current rates at Meta's official pricing page before quoting a client.**
> Rates last checked 2026-08-05 and change periodically. Meta has restructured WhatsApp
> pricing more than once; treat the figures below as indicative, not contractual.

| Type | Cost (indicative) | Used for |
|---|---|---|
| User-initiated | **FREE** | Customer messages first (24h window) — all bot Q&A here |
| Utility | **₹0.13** | Reminders, confirmations, fee/appointment updates |
| Marketing | **₹0.86** | Offers, broadcasts, re-engagement |
| Authentication | **₹0.15** | OTP / login codes |

## Design rules (cost control)
- Keep conversation inside the free 24h window (customer-initiated).
- Utility is ~6× cheaper than Marketing — prefer reply-driven flows.
- Example: coaching class ~100 enquiries/mo ≈ ₹470 total Meta cost (free bot Q&A + ~300 utility + one 500-contact marketing broadcast).

## Review trigger
Re-check rates before any new client proposal, and whenever Meta announces a pricing change.
How charges are passed through to us is an open item in [[whatsapp-api-onboarding]].

Cost-control mindset aligns with [[spend-guard-paid-api-cost-control]]. Our client pricing sits in [[pricing-ladder]].

## Update — 2026-08-14: a third, conflicting data point

A YouTube tutorial source ("No Third Party Needed: Connect WhatsApp to n8n Using Official Meta API," reviewed this session) cited: Marketing ≈ ₹0.70/msg, Utility ≈ ₹0.10/msg, Authentication ≈ ₹0.11/msg (₹2.30 international). This is a **third** figure, disagreeing with both this note's table above (Utility ₹0.13 / Marketing ₹0.86 / Auth ₹0.15) and [[whatsapp-automation-vendors]]'s figures (Marketing ₹1.09 / Utility ₹0.145). None of the three has been verified directly against Meta's live pricing page. Strengthens the existing "verify before quoting" warning at the top of this note rather than resolving it — do not pick one of the three without checking Meta's official page first.
