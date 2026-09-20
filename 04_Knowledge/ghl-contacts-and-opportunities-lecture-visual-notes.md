---
title: GHL Contacts and Opportunities — visual lecture notes
created: 2026-09-20
tags: [ghl, crm, contacts, opportunities, pipelines, training, source-video]
source: Local video — GHL Account/Video lecture/1_1 Contacts & Opportunities.mp4
origin: ai
author: codex
maturity: supported
---

# GHL Contacts and Opportunities — visual lecture notes

This note is a source-attributed visual summary of the 17:16 recording `1_1 Contacts & Opportunities.mp4`. The companion Word guide contains the embedded screenshots and timestamp captions:

`C:\Yogesh - personal\Claude\Cluade Projects\Ai Automation\GHL Account\Video lecture\1_1 Contacts & Opportunities - Complete Visual Lecture Guide.docx`

## Evidence boundary

The local watch pass recovered 49 scene-change screenshots from the 1920×1080 video. The Whisper transcript request was refused by the local network path, so this note records only visible UI labels, controls, state changes, and the sequence inferred from the screenshots. It does not claim to reproduce unavailable spoken commentary. Current platform behaviour, permissions, and labels still need live verification before this becomes a production SOP.

## What the recording visibly covers

- **Opportunities board:** pipeline selector, Kanban stage columns, Advanced Filters, Sort, search, Import, Add opportunity, and Manage Fields.
- **Pipeline setup:** Create Pipeline dialog, pipeline name, stage names, stage colours, Add stage, and saved-pipeline list.
- **Opportunity creation:** primary contact name/email/phone, opportunity name, pipeline, stage, status, value, Add/Manage Fields, and Create.
- **Contacts:** Contacts table, Smart Lists, Bulk Actions, Tasks, Companies, Add Contact drawer, contact type, time zone, DND, and communication-channel controls.
- **Imports:** a Start → Upload → Map → Verify flow and object choices for Contacts, Opportunities, and Companies.
- **Opportunity custom fields:** fields versus folders, field types, internal keys, and row actions.
- **Cleanup workflow:** deletion confirmations for fields and folders; the UI warns that deletion cannot be undone.
- **Reporting/table view:** Manage Fields side panel and selectable columns including opportunity name, smart tags, contact, stage, value, status, owner, tags, created time, and updated time.
- **Smart List state:** a view can show Unsaved Changes; leaving it prompts the user to discard or save as a new smart list.

## Operational interpretation

The visible workflow separates three layers:

1. **Contact** — the person record.
2. **Opportunity** — the deal/lead record linked to a contact.
3. **Pipeline and fields** — the stage model and extra structured data used to manage and report on the opportunity.

That separation is compatible with the existing Sahas AI CRM model in [[crm-and-field-model]] and the stage/pipeline thinking in [[lead-stages-pipeline]], but the recording is a platform walkthrough, not proof that every visible feature is required in the Sahas AI first build.

## Safety and data-handling notes

- The recording includes test/demo contact-looking records and a visible person name. Their personal details were not copied into this note.
- Custom-field and folder deletion is irreversible according to the on-screen warnings. Require owner approval, dependency checks, and a backup/export before deleting production fields or folders.
- A table-view change and a saved Smart List are different states. Confirm whether a view should be temporary or saved before leaving.

## Related decisions and notes

- [[decision-ghl-deferral]] — GHL adoption is scheduled for Phase 2; this note supplies visual product evidence without changing that decision.
- [[whatsapp-automation-vendors]] — existing vendor comparison and GHL capability summary; re-verify current claims before quoting.
- [[crm-and-field-model]] — Sahas AI's proposed CRM masters and field groups.
- [[lead-stages-pipeline]] — existing stage model; do not silently replace it with the demo pipeline labels in this recording.
