---
title: Lessons — reading bills with AI in n8n
created: 2026-10-08
tags: [n8n, document-ai, lessons, ai-accountant]
source: bugs and test findings while building AI Accountant W1, 2026-10-06 to 2026-10-08
origin: ai
author: claude-code
maturity: supported
---

# Lessons — reading bills with AI in n8n

Each line was a real bug or test finding in [[ai-accountant-w1-inbox-processor]]. Reusable for any document-reading workflow.

## n8n mechanics
- Name every node by what it does — later nodes reference earlier ones as `$('Node name').item.json…`.
- **Read the item count on every arrow.** An empty help row in the client sheet became a second "client"; a Drive search with no folder then listed the whole Drive (1,846 files).
- Sheets filters are an **exact match** (`Yes` ≠ `yes`) — enforce values with a dropdown in the sheet.
- Turn on **Always Output Data** for lookups where "no rows" is normal, or the run stops silently.
- AI node **Input Type must be Binary** (field `data`), or the model gets no file and replies "I don't see any image".
- Prompts with `{{ }}` must be in **Expression** mode, or the braces are sent literally. If a node's preview shows `[undefined]` for an upstream reference, use `$json.field` when the value is already in its input.
- After a Sheets/Drive node, `$json` is that node's own output — fetch file IDs from the code node that built them (`$('Run GST Checks').item.json.file_id`).
- A line back into a Loop must start from the **last** node of each round; every branch must reach it, or the loop stops after the first file that takes the unconnected branch.
- Write to Sheets with **Let n8n format (RAW)** — "Let Google Sheets format" turns "0047" into 47.
- Map sheet columns from **cleaned** fields, not the AI's raw `doc.*` values.
- A green tick only means "no error" — read outputs column by column (bill_date was once mapped to invoice_no).
- Google Drive setting "Convert uploads to Google Docs editor format" must be **off**, or .docx/.xlsx become Google files.

## AI reading
- Tell the AI **whose books** these are (client GSTIN), or it labels purchase bills "sales_invoice"; then decide purchase vs sales **in code by GSTIN** anyway.
- Make the AI a **faithful reader, not a corrector**: copy totals, GSTINs and tax types exactly as printed — otherwise the checks can never catch a wrong bill.
- "Never calculate a missing value; null if not visible" — one model still calculated a cut-off total; a second reader caught it.
- Confident misreads happen on compressed images (4519 read as 4510): use **two different AI vendors** and settle disagreements only with verifiable checks — [[decision-ai-accountant-two-ai-readers-for-images]].
- Structured prompt that worked: **Role / Task / Context / Instructions / Rules & constraints / Output format / Example** (example marked "format only"). Include `clarity`, `bill_count`, `reverse_charge`, explicit doc types (bill of supply, credit/debit note), "IRN / Ack no / e-way bill no are not the invoice number", lakh-format and text-date rules.
- Word files: see [[decision-ai-accountant-word-files-via-openai]].
