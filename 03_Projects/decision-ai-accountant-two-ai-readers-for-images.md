---
title: Decision — two AI readers for bill images, settle disagreements by verifiable checks
created: 2026-10-08
tags: [decision, ai-accountant, document-ai]
source: Claude Code session 2026-10-07 (P15 misread finding, run #151 analysis)
origin: ai
author: claude-code
maturity: supported
status: active
---

# Decision — two AI readers for bill images

## Decision
Every image bill is read by **Claude and OpenAI in parallel**; any disagreement goes to review unless code can prove which reading is right (GSTIN that passes the check digit; total whose own taxable + tax adds up, only when both show a total). Invoice number / date disagreements always go to review.

## Context
A compressed WhatsApp image (P15) was saved with invoice no. WST/4510 — the bill says WST/4519. The AI was confident and consistent, so "use null if unclear" never fired, and invoice numbers have no checksum. A wrong invoice number breaks GSTR-2B matching and duplicate detection. In the first two-reader run, OpenAI caught P15 but also garbled GSTINs on clean images (5 false reviews) and once calculated a total that was not visible — hence the tie-breaks.

## Alternatives rejected
- **Ask the AI for a confidence flag only** — rejected: the AI was sure about the wrong digit.
- **Send all small images to review** — rejected: file size is a poor signal (good WhatsApp bills are small too).
- **Rely only on the GSTR-2B Checker (W3)** — kept as the final safety net, rejected as the only guard: it finds the error weeks later.

## Depends on
- [[ai-accountant-w1-inbox-processor]]
- Assumption: two different AI vendors rarely make the same misread. Cost ~₹1–2 extra per image.

## Consequences
Images cost about twice as much to read; some genuine bills (e.g. P04, invoice-number disagreement) go to a person. No doubtful data is saved.

## Review trigger
If false reviews stay high, try Gemini as the second reader; if scanned PDFs show misreads, extend the second reader to scans.
