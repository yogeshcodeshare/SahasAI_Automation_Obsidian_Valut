---
title: Meta's Utility Template Library — 164-Entry Snapshot
created: 2026-09-16
tags: [whatsapp, meta, templates, utility, reference, knowledge]
source: "Local capture Meta_Utility_Template_Library_164_en_US.md, taken 2026-09-09 from the signed-in WhatsApp Manager Template Library; Meta Template Library documentation read the same day"
origin: ai
author: claude-code
maturity: supported
---

# Meta's Utility Template Library — 164-Entry Snapshot

Meta publishes a library of **pre-categorised** template entries. A local snapshot of the Utility, English (US) subset — 164 of 164 results, Authentication excluded — was captured on **2026-09-09** and is the reference to check before drafting any Utility template from scratch.

## Where the local copies live

Two identical copies exist on Yogesh's machine, both outside the vault:

- `Ai Automation/output/whatsapp/Meta_Utility_Template_Library_164_en_US.md`
- `C:\Users\user\.codex\skills\whatsapp-utility-templates\references\Meta_Utility_Template_Library_164_en_US.md`

The second sits inside the `whatsapp-utility-templates` drafting skill, whose `SKILL.md` carries the eligibility gate and drafting conventions that govern how the library is used.

## Why the library route matters

Library entries are **already categorised by Meta**. A custom draft is not — it is a request that goes through review and can be re-categorised. So for a genuinely operational message, checking the library first is cheaper and safer than writing copy and hoping.

**The line that decides which route you are on:**

- **Library route** — pick the exact library template name and locale, keep the fixed content, and inspect the real parameters in WhatsApp Manager. Categorisation is inherited.
- **Custom route** — rewriting the fixed wording, choosing *Customize template*, translating it yourself, or pasting a preview into a blank template. **None of that inherits library status.** It is a custom candidate subject to review, and the eligibility gate applies in full.

## What the snapshot is, and is not

- Each entry is the **rendered card preview** — heading, body, footer and button labels in display order. It is not a body-only field and not a creation payload.
- `{{text}}`, `{{date}}`, `{{amount}}` are Meta's displayed **type hints**, not configured mappings. Repeated `{{text}}` occurrences can carry different values; map each one separately.
- Button destinations, internal IDs, parameter limits and exact component types are **not** in the previews.
- Flow, calling, group, document and restricted-payment entries need their own account/provider capability. A library Flow entry does **not** establish approval for an unrelated qualification form.
- It is a snapshot. Availability, locale and feature restrictions change — verify in the live account before recommending an entry.

## Entries worth knowing for Sahas AI's own funnel

Editorial starting points, not Meta classifications, and each still needs a real operational trigger:

| Situation | Candidate entries |
|---|---|
| An appointment that actually exists | `appointment_confirmation_1`, `appointment_reminder_2`, `appointment_reschedule_1`, `missed_appointment` |
| A real missed inbound call or registered request | `followup_missed_calls`, `support_ticket_acknowledgement` |
| Billing for an existing client | `payment_confirmation_1`, `payment_reminder_1`, `payment_failed_2`, `purchase_receipt_3` |
| Feedback after a completed interaction | `feedback_collection`, `feedback_survey_1` |
| Existing-service notifications | `service_disruption`, `renewal_successful` |

## The guardrail that applies to the current build

Copying library phrasing does **not** convert a qualification or nurture journey into an operational one. The Business Growth Checker invitation, a booking invitation to a prospect, a proposal, a nurture nudge and a win-back are Marketing or need-context regardless of which library sentence they borrow → [[whatsapp-meta-current-pricing-and-service-rules-2026-09]] and [[whatsapp-template-categories-and-approval]].

Note the shape of the library itself: almost every one of the 164 entries presupposes an **existing order, account, appointment, payment, ticket or service**. That is the clearest available evidence of where Meta draws the Utility line.

Related: [[whatsapp-template-anatomy]], [[whatsapp-template-categories-and-approval]], [[whatsapp-message-templates-mr-hi-en]], [[whatsapp-meta-current-pricing-and-service-rules-2026-09]]
