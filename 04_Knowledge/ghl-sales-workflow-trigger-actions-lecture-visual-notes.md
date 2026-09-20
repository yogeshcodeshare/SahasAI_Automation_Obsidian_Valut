---
title: GHL Sales Workflow — trigger and actions visual lecture notes
created: 2026-09-20
tags: [ghl, crm, workflow, automation, trigger, actions, training, source-video]
source: Local video — GHL Account/Video lecture/1_2 Sales Workflow (Trigger & Actions).mp4
origin: ai
author: codex
maturity: supported
---

# GHL Sales Workflow — trigger and actions visual lecture notes

This note is a source-attributed visual summary of the 13:59 recording `1_2 Sales Workflow (Trigger & Actions).mp4`. The companion Word guide contains the embedded screenshots and timestamp captions:

`C:\Yogesh - personal\Claude\Cluade Projects\Ai Automation\GHL Account\Video lecture\1_2 Sales Workflow (Trigger & Actions) - Complete Visual Lecture Guide.docx`

## Evidence boundary

The local watch pass recovered 32 scene-change screenshots from the 1920×1080 video. The Whisper transcript request was refused by the local network path, so this note records only visible UI labels, workflow nodes, controls, state changes, and the sequence inferred from the screenshots. It does not claim to reproduce unavailable spoken commentary. Current platform behaviour, permissions, enrollment rules, and action availability still need live verification before this becomes a production SOP.

## What the recording visibly covers

- **Workflow workspace:** Automation → Workflows, All Workflows, Needs Review, Deleted, New Smart List, Advanced Filters, Search, Create Folder, Build using AI, and Create Workflow.
- **AI Builder notice:** the account displays a notice that AI Builder is enabled and can generate workflows automatically.
- **Workflow organization:** folders can group related automations, including a nested `AI SAAS AUTOMATIONS` view visible in the capture.
- **Builder lifecycle:** Builder, Settings, Enrollment History, Execution Logs, Test Workflow, Draft/Publish, and Saved controls are visible.
- **Example chain:** `Pipeline Stage Changed` → `Add Tag` → `Assign to user` → `Add Task` → `Update opportunity`.
- **Assignment timing:** Assign to user shows an assignee selector, due-date value, unit, time, Skip weekends, Cancel, and Save action controls.
- **Action search:** searching `UPDATE` reveals Update Contact Field, Update Associated Record for Contact, Update Conversation AI Bot and Status, and Update Custom Value.
- **Opportunity relation:** the opportunity edit modal exposes pipeline, stage, status, value, owner, followers, business name, source, tags, tasks, notes, payments, and associated objects.

## Trigger and action model

The visible workflow supports a three-part mental model:

1. **Trigger** — an event such as a pipeline stage changing.
2. **Ordered actions** — tag, assign, create a task, or update an opportunity.
3. **Lifecycle evidence** — save, test, inspect enrollment/execution history, then publish only after review.

The canvas shown in the lecture is:

`Pipeline Stage Changed → Add Tag → Assign to user → Add Task → Update opportunity`

The recording confirms the node labels and their order visually. It does not confirm every hidden field mapping, condition, re-enrollment rule, or error path behind those nodes.

## Operational interpretation

- A pipeline-stage event is the business trigger; the stage change itself is not the same thing as a completed task or a sent message.
- Add Tag and Assign to user can make ownership and segmentation visible in the CRM.
- Add Task creates a follow-up obligation; its due date and weekend behaviour must be reviewed before publishing.
- Update opportunity can modify CRM data, but the exact fields and values must be opened and recorded action-by-action.
- The action search results show that “update” can target different objects or systems. Similar names are not interchangeable.
- A saved workflow is not automatically equivalent to a published workflow. Use Test Workflow, Enrollment History, and Execution Logs as separate verification surfaces.

## Production-safety notes

- Treat `Build using AI` as a drafting aid, not approval to activate generated automation.
- Confirm trigger scope, pipeline/stage, enrollment and re-enrollment behaviour, conditions, and loop prevention.
- Review every side effect: tags, assignee, task timing, opportunity fields, communication status, and custom values.
- Test with a synthetic or approved test record; inspect logs before publishing.
- Keep the workflow in Draft until the owner approves the exact sequence and rollback/disable procedure.
- The recording includes a low-battery Windows notification and several desktop/loading transitions. These are interruptions, not workflow logic.

## Data-handling note

The frames include demo/test CRM records and visible personal-looking fields. Their personal values were not copied into this note or the vault. The note preserves field names and workflow mechanics only.

## Related notes

- [[ghl-contacts-and-opportunities-lecture-visual-notes]] — preceding visual lecture on Contacts, Opportunities, pipelines, custom fields, table views, and Smart Lists.
- [[decision-ghl-deferral]] — GHL adoption is scheduled for Phase 2; this note supplies visual capability evidence without changing that decision.
- [[whatsapp-automation-vendors]] — existing vendor comparison and GHL capability summary; re-verify current claims before quoting.
- [[crm-and-field-model]] — Sahas AI's proposed CRM masters and field groups.
- [[lead-stages-pipeline]] — existing stage model; do not silently replace it with the demo pipeline labels in this recording.
