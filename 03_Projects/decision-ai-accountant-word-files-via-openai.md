---
title: Decision — read Word bills with OpenAI, Drive-to-PDF as fallback
created: 2026-10-08
tags: [decision, ai-accountant, document-ai]
source: Claude Code session 2026-10-07 (provider docs checked + live test on P05.docx)
origin: ai
author: claude-code
maturity: supported
status: active
---

# Decision — read Word bills with OpenAI

## Decision
.docx bills go to the **OpenAI Responses API** (n8n "Message a model", File + prompt, gpt-4.1). If OpenAI rejects a file or tables come out jumbled, the fallback is **Google Drive convert → PDF → Claude**.

## Context
Claude's API and n8n's Extract from File cannot read .docx. A live test on P05 read every value correctly (Indore Paints, IGST ₹576, total ₹3,776); gpt-4o-mini mislabelled it "sales_invoice", so a stronger model is used and purchase/sales is decided by GSTIN in code.

## Alternatives rejected
- **Claude API** — accepts PDFs and images only (the claude.ai chat app converts files; the API does not).
- **Gemini API** — PDF and text formats only.
- **Mistral OCR** — reads .docx but needs a new account and adds another company handling client bills.
- **Online converters (CloudConvert etc.)** — rejected: client bills would go to a third party.

## Depends on
- OpenAI file-input support for .docx (text-only extraction); a forum thread reported intermittent .docx rejections — re-test if errors appear.
- [[ai-accountant-w1-inbox-processor]]

## Review trigger
OpenAI drops .docx support, errors become frequent, or Word bills with complex tables misread.
