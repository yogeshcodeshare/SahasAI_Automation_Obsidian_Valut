---
title: n8n lessons from the WhatsApp Agent Team + voice workflows build
created: 2026-10-28
tags: [n8n, lessons, supabase, google-sheets, mcp]
source: Claude Code build sessions 2026-10-26 → 2026-10-28 (WhatsApp Agents Team folder)
origin: ai
author: claude-code
maturity: supported
updated: 2026-11-05
---

# n8n lessons — WhatsApp Agent Team build

From [[whatsapp-agent-team-renault]] and [[ai-voice-calling-agents-sarvam]]. See also [[n8n-lessons-resume-screener]].

- **Draft ≠ published.** Publishing creates a separate active version; a fixed draft does nothing until re-published. Audit the *published* version (test-mode timings stayed live this way).
- **Close the editor before MCP edits.** An open editor tab saved later silently overwrites MCP changes (a Google Sheets filter disappeared).
- **Google Sheets node by tab name fails if the tab didn't exist at creation** ("Sheet is required") — point it at the tab's gid.
- **Supabase node "Filters (String)"** takes raw PostgREST: `or=(a.is.null,a.lt.X)`, `in.(a,b)`, `metadata->>key=eq.X`, `not.is.null`, `&order=col.desc`. Update/delete support it too.
- A Supabase **update/get that matches nothing outputs 0 items and stops the chain** — set *Always Output Data* where the flow must continue.
- **Sheets mirror pattern:** `appendOrUpdate` + autoMap + matching column (phone / id) + cell format **RAW** (keeps phone numbers as text so matching works) + ignore extra fields → re-running never duplicates.
- **Sheets update by `row_number`** works when rows were read from the sheet first — handy for a work-queue tab.
- **Convert to File drops the item's JSON** — later nodes must read fields from an earlier node (`$('Prepare Input').first().json.title`).
- **Vector store replace-by-title:** add your own metadata key (e.g. `kb_title`) in the Default Data Loader, delete `metadata->>kb_title=eq.<title>` before inserting.
- **Workflow SDK:** no arrow functions or helper functions outside Code strings; `sticky()` notes are not kept unless added — add sticky notes afterwards with `addNode`. `.onError()` requires `onError: 'continueErrorOutput'`.
- **Multi-trigger branching order:** in v1 execution order, sibling branches run top-to-bottom by canvas position — put a "delete old" branch above the "insert" branch.
- Webhooks from services that cannot sign or send headers (Sarvam result webhooks): put a shared key in the echoed metadata and check it in a Code node.

## Added 2026-11-05 — testing the voice result workflow (V-2)
- **"Continue on error" hides failures.** A WhatsApp send that fails still shows the execution as *success*. Read the node data of the execution (`get_workflow_execution` with node names): a real send returns `message_status: accepted` with a message id; a failure returns the API error.
- **A template that does not exist yet fails with an odd Meta error** ("Unexpected key sampleValues on param template"). It meant the template had not been created/approved yet, not a payload problem.
- **Test a webhook workflow without the real caller:** POST a copy of the real payload (same shape as the service sends, including the shared key in metadata) to the **production** webhook, then read the execution and the database. This proves the whole chain except the dial itself.
- **Opt-out blocks the customer message by design:** check `leads.opt_out_whatsapp` on test leads before blaming the workflow.
- **Meta template variables:** strip line breaks and repeated spaces from free text before sending; write a short clean line for the customer instead of internal wording ("The customer wants...").
- **Editing a published workflow creates a new version:** it is not live until published again.
