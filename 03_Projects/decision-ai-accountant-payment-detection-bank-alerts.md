---
title: Decision — detect customer payments from bank credit-alert emails, not Razorpay
created: 2026-10-08
tags: [decision, ai-accountant, payments]
source: Claude Code planning session (Flow 4+ design), 2026-10-05
origin: ai
author: claude-code
maturity: supported
status: active
---

# Decision — payment detection from bank alert emails

## Decision
W4 Payment Detector reads **bank credit-alert emails** (Gmail) to mark sales invoices Paid / Part-paid / Check. The monthly bank statement (W2) is the backup; Razorpay payment links / Smart Collect is a paid upgrade.

## Context
Most Indian B2B money arrives by NEFT / RTGS / IMPS / UPI, not card checkout, so the bank's credit alert is the signal that exists for every client. Stripe has been invite-only for new Indian businesses since May 2024.

## Matching rules
Invoice no + full amount → Paid (stop reminders, thank-you) · known payer, smaller amount → Part-paid (track balance, remind only for the balance) · no reference but amount fits one invoice → ask a person · nothing matches → log for the accountant. **Never mark paid on a guess.** Cash receipts get a payment mode at entry and are never expected in the bank match (open item).

## Alternatives rejected
- **Razorpay-only** — rejected as default: needs every client on Razorpay and misses direct bank transfers.

## Depends on
- [[ai-accountant-system]] · a Gmail OAuth credential in n8n (not yet created)

## Review trigger
A client already collects through Razorpay, or bank alert emails stop carrying enough detail.
