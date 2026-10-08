---
title: AI Accountant Automation System
created: 2026-10-08
tags: [project, ai-accountant, n8n, gst, ca-firms]
source: Claude Code build sessions 2026-10-05 to 2026-10-08; local RESUME-AI-ACCOUNTANT.md
origin: ai
author: claude-code
maturity: supported
---

# AI Accountant Automation System

One n8n system for **CA firms (pitched first), manufacturers and service businesses**: bills/receipts are read, GST-checked and filed into one Google Sheet per client; bank entries tagged; GSTR-2B matched; customer payments detected and followed up. A person checks anything doubtful.

**Status (2026-10-08): ON HOLD.** Stage 1 — [[ai-accountant-w1-inbox-processor]] — is built by Yogesh, tested on 38 demo documents and reported working. Resume at Stage 2.

## Rules
- **Golden rule:** the system prepares data and reports; it never files GST and never moves money. A CA/accountant approves.
- **Data rule:** if in doubt, review — never save doubtful data.
- Every record carries a Client ID; one business = the CA edition with one client. A Control sheet lists clients (active Yes/No dropdown).

## Workflows (W0–W8)
| # | Workflow | Status |
|---|---|---|
| W0 | Document Reader | merged into W1 for now |
| W1 | Inbox Processor (purchase bills) | done + tested |
| W2 | Bank Categoriser | Stage 3 |
| W3 | GSTR-2B Checker | Stage 4 |
| W4 | Payment Detector (Gmail bank alerts) | Stage 2 — see [[decision-ai-accountant-payment-detection-bank-alerts]] |
| W5 | Payment Follow-up (owner approves every message) | Stage 2 |
| W6 | Dues & Deadlines | Stage 4 |
| W7 | Error Alert (WhatsApp) | Stage 2 |
| W8 | Weekly Report | Stage 3 |

## Where the work lives (local, Yogesh's laptop)
`Ai Automation/Automations/n8n Automation/AI Accountant Automation/`
- **`RESUME-AI-ACCOUNTANT.md` — read this first to resume** (status, IDs, design, remaining work, PDF process).
- Living build guide `ai-accountant-system-guide.pdf` (44 pages, screenshots per step) and a 14-page prospect overview `ai-accountant-system-overview-v2.pdf` — made with [[notebook-notes-pdf-skill]] using [[living-build-guide-pdf-process]].
- Final prompt + code in `n8n-snippets/`; test kits in `Documents/` — see [[gst-purchase-bill-test-scenarios]].
- Google credentials standard guide — [[google-credentials-for-n8n-standard-guide]].

## Open items
- Close Stage 1: Test results + two-reader lesson pages in the guide; schedule trigger; optional Gemini as second image reader; TIFF conversion.
- Feedback from a peer review of the overview (2026-10-08): rename "Bills" → "Bills & Receipts"; add **payment mode** (Cash/Bank/UPI) so cash entries are marked paid and excluded from bank matching; part payments already designed (Part-paid + balance); scope = every Inbox document checked once, dates used for monthly 2B/reports, flag bills beyond the ITC time limit.
- Delivery model answer given: default managed on Sahas AI's n8n, turnkey handover possible — pricing/support terms not set (see [[pricing-ladder]], emerging).
- Stage 2: Gmail credential, sales invoices in W1, W4, W5, W7, Loom demo.

Related: [[n8n-sahas-ai-production-deployment]] · [[ai-document-reader-lessons-n8n]] · [[decision-ai-accountant-two-ai-readers-for-images]] · [[decision-ai-accountant-word-files-via-openai]]
