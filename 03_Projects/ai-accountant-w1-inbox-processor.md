---
title: AI Accountant — W1 Inbox Processor (purchase bills)
created: 2026-10-08
tags: [project, ai-accountant, n8n, document-ai, gst]
source: Claude Code build sessions 2026-10-06 to 2026-10-08; n8n executions #150, #151
origin: ai
author: claude-code
maturity: supported
---

# AI Accountant — W1 Inbox Processor (purchase bills)

Part of [[ai-accountant-system]]. Built by Yogesh in the n8n editor (Test folder) with step-by-step guidance; 22 nodes.

## Flow
Manual / 15-min trigger → read active clients (Control sheet) → list each client's Drive Inbox → attach client fields → loop one file at a time → download → **route by file type**:
- PDF → Claude (claude-sonnet-4-6, document)
- Image → **Claude + OpenAI gpt-4.1 in parallel** → Merge ([[decision-ai-accountant-two-ai-readers-for-images]])
- Word → OpenAI Responses API with the file ([[decision-ai-accountant-word-files-via-openai]])
- Other (Excel, HTML, ZIP, TXT…) → marked "file type not supported"

→ Parse AI Result → look up same invoice no. in Purchase register → Run GST Checks → **ok** → Purchase register + move to Processed / **review** → Review queue + move to Needs Review → write Control Log → next file.

## Checks (Run GST Checks v3)
Unreadable / unclear key value · credit or debit note · quotation / challan / other · addressed to another GSTIN · more than one bill in a file · sales invoice (Stage 2) · key fields present · GSTIN check digit · buyer = client · same state CGST+SGST vs other state IGST · totals within ₹1 · duplicate (invoice no + supplier GSTIN) · bill of supply must charge no tax (ITC "No (bill of supply)") · reverse charge → review. Cash memo without GSTIN → saved, ITC "No (no GSTIN)". Purchase vs sales decided **by GSTIN in code**, not by the AI's label.

## Test results
- 38 fictional demo files (batch 1: 15, batch 2: 23 positive/negative/edge/other-file) — [[gst-purchase-bill-test-scenarios]].
- Run #151 (9.5 min, AI cost roughly ₹100–150): **no wrong value saved**; 12 saved rows matched the source bills; 26 reviews all for valid reasons; 5 false reviews traced to OpenAI image misreads → fixed with v3 tie-breaks.
- 2026-10-08: Yogesh re-ran all 38 with v3 and reported it working correctly.

Lessons from the build: [[ai-document-reader-lessons-n8n]].
