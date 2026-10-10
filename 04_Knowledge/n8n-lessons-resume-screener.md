---
title: n8n lessons from the Resume Screener build
created: 2026-10-10
updated: 2026-10-10
tags: [n8n, lessons, resume-screener]
source: Claude Code build session 2026-10-09/10 (Resume Screener n8n workflow, live MCP read-back + smoke tests)
origin: ai
author: claude-code
maturity: supported
---

# n8n lessons from the Resume Screener build

Reusable mechanics learned while building [[resume-screener-ai]] on n8n 2.39 (self-hosted). Each was hit in practice and fixed.

- **Code node blocks Node modules** — `require('zlib')` → "Module 'zlib' is disallowed". Use native nodes instead. See [[n8n-read-docx-without-zlib]].
- **Binary helper takes an index** — `this.helpers.getBinaryDataBuffer(itemIndex, fieldName)`, not the item object.
- **Code nodes that build new items lose pairing** — add `pairedItem: { item: i }` so later `$('Node').item` lookups work.
- **Old .doc ≠ .docx** — `application/msword` is not a ZIP. Route by exact .docx mimeType ("is equal to"), send .doc to unsupported.
- **`$json` changes when you insert a node** — after an Airtable search, `$json` is the search result; read earlier data with `$('Merge Candidate Data').item.json…`.
- **Search that may find nothing** — set Always Output Data so the next If still runs; guard against empty fields matching each other (`{Email} != ''`).
- **Airtable 422 INVALID_MULTIPLE_CHOICE_OPTIONS** — a token without schema rights cannot create a new single-select option (Typecast does not help). Add the option in Airtable first.
- **Renamed node breaks later-pasted expressions** — n8n renames references only in fields that existed at rename time.
- **Gmail Email Type HTML ignores line breaks** — use Text, or add `<br>`. Turn off "Append n8n Attribution" for client-facing mail.
- **Switch Fallback Output is a dropdown** — choose Extra Output, then rename it via the option.
- **Structured Output Parser example** — use `["none"]`, not `[]`, so n8n knows the list type.
- **Gemini 503 "high demand"** — temporary; set Retry On Fail (3 tries, 5000 ms) on AI nodes.
- **Google Drive Trigger** — only files *created* after publishing fire it; moving a file in does not count. A manual "Execute workflow" fetches only the newest file.
- **Sub-workflow calls run the published version** — save and publish after every change.
- **MCP edits are blocked while the workflow is open in the editor**; saving an old open tab can overwrite remote changes — reload first.
- **"Tidy up" rearranges every node** — no position lock exists; use sticky notes per section and avoid Tidy up.

Related: [[ai-document-reader-lessons-n8n]], [[google-credentials-for-n8n-standard-guide]].

## Added at close-out (2026-10-10)
- **Drive Trigger returns a batch newest-first** — within one poll the order is not upload order; order-sensitive logic (like "first one wins" duplicates) can swap.
- **A Manual Trigger never fires on publish** — for leftovers in a folder use a Manual Trigger → Drive *Search* (folder, return all) for on-demand, or a Schedule Trigger for an automatic sweep (not every minute — it can race the Drive trigger).
- **Execution times in n8n/MCP are UTC** — convert for IST (+5:30) before telling the user.
