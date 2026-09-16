---
title: BizAutomation — Contact Filtering, Bulk Actions & CSV Import
created: 2026-08-06
updated: 2026-09-16
tags: [whatsapp, bizautomation, veblika, crm, how-to, knowledge]
source: Class 4 recording — WhatsApp Business API Automation course; AND/OR logic and Broadcast confirmed live in Class 10
origin: ai
author: claude-code
maturity: supported
---

# BizAutomation — Contact Filtering, Bulk Actions & CSV Import

Operational how-to for the platform Veblika resells → [[bizautomation-reseller-deal]]. Reached at `app.bizautomation.io`.

## Filtering: OR inside a group, AND between groups

The single rule that makes segmentation work, quoted from the platform's own Filters dialog:

> "OR Group — Any condition within the group needs to match for the contact to be included. Different OR groups are combined with AND logic (all groups must have at least one matching condition)."

- **Within one group:** conditions are OR. Any one match includes the contact. Adding a condition here **widens** the result.
- **Between groups:** logic is AND. Every group must have at least one match. Adding a group **narrows** the result.

So to find buyers wanting *3 BHK or Penthouse* who are also interested in *Delhi Vatika or Gurgaon Nirvana*, build two groups: configuration options in one, projects in the other. Getting this backwards is the usual reason a segment returns nothing or returns everyone.

Each condition is a **Column / Operator / Value** triple, built from the custom fields in [[crm-and-field-model]].

## Filters available

Date range · Source · Assigned To · Tags · Opt-In Status · Duplicate · "Show unassigned only", plus any custom field as a condition. They combine — "which of one agent's Gurgaon leads opted out this month" is three filters at once.

Useful standing queries: who opted out this month (a health metric for your messaging), which contacts are duplicated across channels, and which leads nobody owns yet.

## Bulk actions

Select rows and three operations appear:

| Action | Use |
|---|---|
| Broadcast | Campaign to one pipeline stage or one project |
| Assign | Route every lead for a product to the person who owns it |
| Assign Tag | Move a batch of leads to the next stage at once |

The pattern: filter to the segment, select all, act once. Filtering the leads interested in one project and assigning the whole set to that project's salesperson turns a mapping problem into a single action.

## CSV import — the rules that cause failures

- **Phone Number (required)** — must include the country code. Correct: `917599808080`. Incorrect: `7599808080`.
- **Contact Name (required)** — if the CSV has no names, map the phone number column to the name field.
- File must be **CSV**, first row must be **column headers**, maximum **10 MB**.
- Any custom field can be mapped during import, so stage, project and budget load in one pass.

Only those two columns are mandatory; everything else is optional and merged.

**Export** downloads the *current filtered view* — so filter first, then export, and the file contains exactly the segment you wanted.

## One database, two doors

Edits made in the Inbox chat panel and edits made in Contacts write to the same record. There is no sync step and no possibility of the two views disagreeing. Work wherever is convenient — Inbox during a live conversation, Contacts for bulk work.

## Column data types available

Text · Email · Number (whole numbers) · Text Area (longer free text) · Phone (strictly a phone number) · Select (option list) · Date

Prefer plain text in Select option values — the trainer hit a display problem caused by a special character in a budget-range option and had to rewrite it.

## Segmentation as named, reusable filter groups (added from Class 10)

The AND/OR logic above is the mechanism. Class 10 adds the strategy: rather than re-applying the same filter combination every time a relevant offer appears, build it once as a named segment and reuse it.

Worked example: a **"Family HNI"** segment combining location (Delhi) AND family status (married with family) AND income (roughly 50 lakh–1 crore annually) — three conditions that, applied together, define one durable audience. When a matching offer arrives (a premium family-oriented residential project, in the example), the whole segment is broadcastable in one action rather than three filters rebuilt from scratch.

Other segment examples from the class: leads interested in a specific configuration (2BHK), leads in a specific budget band, NRI customers, rental customers. The pattern generalises to any business — the segments are just named combinations of whatever custom fields that business tracks.

**Also confirmed live in Class 10:** the Broadcast action's full results loop — Sent / Delivered / Failed tracking, and one-click rebroadcast scoped to failures → [[whatsapp-bulk-broadcast-and-block-ratio]].

## Update — 2026-09-16: Notes, Reminders, and broadcasting without an import

Three mechanics from the Lesson 4 long-form notes that this note referenced only in passing.

### Notes, Activity and Reminders live on the contact

Inbox → open a chat → Contact Details → three tabs beneath the custom fields: **Notes**, **Activity**, **Reminders**.

- **Notes** hold what a dropdown cannot — "client is out of station, will visit on the 14th". Attached to the contact and visible to whoever picks the conversation up next, which is the whole argument for a shared inbox over individual phones.
- **Reminders** take a *Reminder To* (a named team member — not necessarily whoever created it), a free-text message, and a date/time. The worked pattern for a scheduled visit is **two** reminders: one the day before to confirm, one on the day itself, because a confirmation the day before does not guarantee attendance.

The trainer's claim, worth recording as his and not ours: for a small team, **notes + reminders + custom fields already cover appointment tracking, follow-ups and handover context**, removing the need for a separate CRM subscription. Unvalidated in Sahas AI delivery — it does not cover proposals, payments or reporting, so treat it as a starting position rather than an architecture.

### Campaign → Manual fill — broadcast without importing anything

Campaigns → **Manual fill** → select the number and template → paste phone numbers, **one per line, each with the country code** → Validate → Broadcast. Useful for a short list that does not deserve a CSV import. The same 5,000-per-session ceiling applies → [[whatsapp-number-safety-warm-up]].

### Rebroadcast is scoped by status, and one option is a trap

A campaign's report allows rebroadcasting to a chosen status: **sent, delivered, read, or failed**. Rebroadcast-to-**failed** is the recovery path already recorded in [[whatsapp-bulk-broadcast-and-block-ratio]]. Rebroadcast-to-**read** is documented by the vendor as a remarketing option — re-messaging people who already opened the last one is exactly the behaviour that drives blocks, so it should be a deliberate decision, not a convenience click.

Full platform navigation map and the vendor KB's own metric definitions → [[veblika-platform-admin-reference]].

Related: [[whatsapp-tag-numbering-convention]], [[training-lesson-4-tagging-contacts-compliance]], [[training-lesson-10-lead-capturing-management]], [[whatsapp-bulk-broadcast-and-block-ratio]], [[veblika-platform-admin-reference]]
