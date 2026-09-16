---
title: Sahas AI Veblika Native Chatbot and Flow Roadmap
created: 2026-09-16
tags: [project, whatsapp, veblika, chatbot, flow, sahas-ai]
source: Yogesh and Codex planning conversation through 2026-09-16; detailed local plan in the WhatsApp Automation working folder
origin: ai
author: codex
maturity: supported
---

# Sahas AI Veblika Native Chatbot and Flow Roadmap

This is the execution map for Sahas AI's own WhatsApp operations. It deliberately separates what will be built natively in Veblika now from AI Agent, n8n, and GHL work that comes later. The detailed build instructions, flowcharts, test cases, and time plan live locally at:

`C:\Yogesh - personal\Claude\Cluade Projects\Ai Automation\What's App Automation\WhatsApp Automation template & workflow\06_Veblika_Chatbot_Build_Plan.md`

## Confirmed first scope

Build these four deterministic native chatbots first:

1. **C1 — New Enquiry, Language and Menu:** capture preferred language, apply the New Enquiry tag, and route the person to Growth Check, callback request, human handoff, or later FAQ help.
2. **C2 — Business Growth Checker:** send the existing English form `sahas_ai_business_growth_checker`, map submitted answers to the existing Contact Columns, and mark the lead as submitted.
3. **C3 — Callback Request and Human Handoff:** send `growth_check_date_time_booking`, save requested date/time, flag Yogesh for follow-up, and stop the bot. A requested slot is not a confirmed appointment.
4. **C4 — Incomplete Lead Follow-up:** after a conservative delay, send one compliant reminder only if the lead did not complete the relevant form; then stop rather than chase repeatedly.

Existing-client support intake is deliberately excluded from this portfolio.

## Live Tags and Columns verified from Veblika screenshots

The current account already has the fields needed for C1–C4: Preferred Language, Business Name / Brand name, Business Type, Main Business Problems, Desired Outcome, Timeline, Current WhatsApp Setup, Current Tools, Appointment Date/Time (DATE), Appointment Time (SELECT), Appointment Status, and Assigned To. Do not create duplicate callback-date or callback-time fields. `Preferred Call Time` stores broad periods and should not replace the exact `Appointment Time` value from the booking form.

Reuse the existing numbered tags: `1.1 NEW LEAD`, `1.2 QUALIFICATION IN PROGRESS`, `1.3 QUALIFIED`, `4.2 FOLLOW-UP DUE` or `4.4 WAITING FOR CLIENT`, and `4.3 HUMAN REVIEW NEEDED`. Apply `1.5 CALL BOOKED` only after Yogesh confirms the requested slot; a form submission alone is not a booking. Later journeys use `1.10 ONBOARDING` and `1.12 REVIEW & REFERRAL`. No new tag or Column is required for C1–C4 based on the supplied screenshots. The exact stored format of the date field must be verified in the F2 test.

## Native supporting Flows

Build these behind-the-scenes Flows alongside C2 and C3. They do not replace customer-facing chatbots.

| Flow | Trigger and guardrails | Result |
|---|---|---|
| **F1 — Growth Checker Form Processor** | WhatsApp BizAutomation trigger → filter `content.interactiveType = nfm_reply` → filter exact Growth Checker `flowId` from a real test payload | Update the existing contact by phone, map form answers to Columns, apply the Growth Check Submitted tag. |
| **F2 — Callback Preference Processor** | Same trigger → `nfm_reply` filter → exact booking-form `flowId` | Save preferred date/time, apply Callback Requested and Human Follow-up Required tags. |
| **F3 — Client Onboarding Form Processor** | Same guarded pattern, to be built only with C5 | Map safe onboarding form answers and apply onboarding status/tag. |

Run a real test submission before configuring each Flow. Form replies must be filtered by both interactive type and exact form ID so one form cannot update the wrong contact fields.

## Later native Veblika work

- **C5 — Client Onboarding Kickoff:** only after Yogesh confirms a client and sends an approved onboarding template. The template button starts the chatbot; do not rely on a hidden internal keyword. Capture business context and approved assets only — never passwords, API keys, or personal contact data.
- **C6 — Review and Referral Capture:** only after Yogesh confirms delivery and satisfaction. Ask for feedback first; route unhappy clients to human follow-up. Use only an approved review destination when it is ready.
- **A1 — Enquiry/FAQ AI Assistant:** a custom-prompt, knowledge-base-backed assistant for open-ended service questions.
- **A2 — Content Briefing AI Assistant:** helps gather ideas and briefs; it must not publish social content or make commitments without Yogesh's approval.

The observed native AI Assistant capabilities are recorded in [[veblika-native-ai-assistant-capabilities]] (supported).

## Work explicitly deferred to later stages

| Later stage | Work kept out of the current native chatbot scope |
|---|---|
| WhatsApp + n8n | Proposal drafting and payment-status coordination; content preparation followed by WhatsApp approval. |
| WhatsApp + n8n + GHL | Real booking availability, CRM pipeline automation, appointment confirmations, reminders, rescheduling, and no-show management. |

**Calendly decision:** do not use Calendly inside native Veblika Flows. Live booking belongs to the later WhatsApp + n8n + GHL stage because the first native form only captures a preference and cannot reserve availability.

Also defer Google Sheets/Contacts, Datastore, HTTP/Webhook, Telegram, OpenAI/Gemini Flow apps, Shopify, and SMTP until the native Contact/Columns/Tags model is proven. This avoids creating multiple systems of record prematurely.

## Practical build pace

- Core C1–C4 plus F1–F2: **14–18 active hours**.
- C5–C6 expansion: **6–8 active hours**.
- Full native portfolio: **20–26 active hours**, excluding Meta template-review waiting time.

At 6 hours per week, the core should take about 3 weeks. At 9–10 hours per week, about 2 weeks. Work in 60–90 minute weekday blocks and 3–4 hour weekend blocks; finish testing before publishing each chatbot.

## Non-negotiable checks before release

- Reuse existing Tags and Columns; do not create near-duplicates.
- Keep forms English-only while branching chatbot copy by the stored preferred language.
- Verify every template's *live* approval and category in Meta/Veblika before an out-of-window send. Lead qualification and lead follow-up are likely Marketing, not Utility.
- Test new number and existing contact, every button/list branch, abandoned and completed forms, tag/Column mapping, human handoff, and delayed reminders.
- Publish one chatbot at a time. Keep the next chatbot as Draft until the earlier one passes end-to-end testing.

Related: [[whatsapp-sahas-ai-current-build-brief]], [[whatsapp-chatbot-builder-reference]], [[whatsapp-forms-builder-reference]], [[whatsapp-flow-builder-webhook-reference]], [[veblika-native-ai-assistant-capabilities]], [[decision-veblika-native-chatbot-first]], [[crm-and-field-model]].
