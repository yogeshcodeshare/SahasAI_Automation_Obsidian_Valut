---
title: Sahas AI WhatsApp Current Build Brief
created: 2026-09-15
tags: [project, whatsapp, veblika, chatbot, workflow, ai-agent, forms, sahas-ai]
source: Sahas AI/Codex conversation history and local WhatsApp Automation planning folder through 2026-09-15
origin: ai
author: codex
maturity: supported
---

# Sahas AI WhatsApp Current Build Brief

This is the compact current-state brief for the Sahas AI WhatsApp build. It points to the detailed vault notes and local working folder so another agent can resume without relying on chat-history recall.

## Current agency direction

- Sahas AI is building and demonstrating its own WhatsApp automation before selling the same pattern to clients.
- Veblika/BizAutomation is the chosen WhatsApp platform route. n8n and Google Sheets/Calendar appear in the historical internal architecture, but the current public offer and introduction material must not add Google-related services unless Yogesh explicitly reopens that decision.
- Public plan direction: Starter, Pro and Elite with monthly and yearly options, no lifetime offer. A WhatsApp-only add-on was discussed as ₹2,000/month with ₹1,000 registration/setup and ₹15,000/year; treat this as emerging pricing that needs owner verification before publishing or quoting.
- Target business groups added to the introduction material: Med Spa, Insurance Agencies, Home Services, Real Estate Teams, Recruiter Agencies, CA Law Firms, GST Filing Firms, Marketing Agencies and Car Dealerships. “Startups” was removed.
- The approved working sequence is WhatsApp-native first, then n8n where native tools are insufficient, then later GHL/website/social phases. Do not treat the planning folder as live production configuration.

## Three Veblika capabilities and their jobs

1. **Chatbot-V2**: deterministic trigger/action flows for known questions and paths. It has an On Message trigger and actions such as text, buttons, list, media, questions, templates, conditions, delays, tags, column updates and handoff/AI actions.
2. **WhatsApp Forms/Flows**: structured data capture inside WhatsApp. Use a form for business details, checklists, dates and fixed time slots; use the separate Flow Builder/webhook path to filter submissions and update contacts. The form itself is not an AI assistant.
3. **AI Assistant/AI Agent**: open-ended questions that cannot be enumerated in a workflow. Configure role/system prompt, user message, memory keyed to the contact/phone, knowledge base and tools. Follow the hard sequence SOP → deterministic automation → AI; do not use AI where a defined workflow is sufficient.

## Agency Qualify + Book build

The lead journey is: inbound/entry → requirement capture → relevant deliverable → Growth Check booking → confirmation/reminders → proposal/payment → onboarding → review/referral. The five planned modules are M1 Qualify + Book, M2 Follow-up Sequencer, M3 Proposal + Payment, M4 Review + Referral and M5 Marketing Broadcast + Win-back. M5 is last and must target only existing/enquired/opted-in contacts, never purchased or cold data.

### Business Growth Checker form

- English form only, as decided by Yogesh.
- Flow/form working name: `sahas_ai_business_growth_checker`.
- First page captures business name, business type, optional business subtype, city/state, main business problems (multiple choice, maximum eight options and 30 characters per option), free-text problem description, and desired results.
- Later page captures start timeline, current WhatsApp setup (Personal WhatsApp, WhatsApp Business, WhatsApp API, Not sure), and current business tools (CRM software, Excel, Tally, Zoho, Other, None).
- The form uses a multiple-choice desired-results question to understand several needs and support later package matching; this is a lead-qualification purpose, not evidence of Utility eligibility.
- Submission must be isolated using the `nfm_reply` interactive type and the exact form `flowId` before updating a contact. Decide deliberately whether the contact is updated or created to avoid duplicates.

### Date/time booking form

- Form name: `growth_check_date_time_booking`.
- Date uses a Date Picker; time uses fixed Single Choice two-hour slots: 9:00 AM–11:00 AM, 11:00 AM–1:00 PM, 2:00 PM–4:00 PM, 4:00 PM–6:00 PM, 6:00 PM–8:00 PM.
- The selected slot is only a requested/preference value until the booking system actually reserves it. Confirmation copy must not claim a confirmed appointment before the reservation succeeds.

## Template and message history

The first planned lead library had ten names: `lead_welcome`, `qualification_incomplete_followup`, `requested_demo_delivery`, `growth_check_followup_day_2`, `growth_check_followup_day_4`, `call_booking_confirmation`, `call_reminder_24h`, `call_reminder_1h`, `call_reschedule`, and `no_show_rebook`.

The later Veblika work also used/considered these account names: `welcome_message_utility`, `lead_welcome_utility`, `lead_welcome_utility_pdf`, `lead_welcome_marketing_pdf`, `business_growth_checker_form_en`, `business_growth_checker_form_hi`, `business_growth_checker_form_mr`, `call_booking_form_en`, and the booking form above. Screenshots show some templates as Approved, some Pending, and some associated with Marketing even when Utility was selected. Those screenshots are historical evidence only; always inspect the current Meta/Veblika record.

Important category lesson: `business_growth_checker_form_*` was actually approved/associated as Marketing, despite Utility being selected, because its purpose is lead qualification. A `welcome_message_utility` draft was later rewritten in neutral language, but Meta approval remains a live platform decision. Do not promise Utility approval or disguise a marketing journey as Utility.

The latest welcome draft discussed was:

> Hi *{{1}}* 👋
>
> Welcome to Sahas AI Automation 🚀
>
> Thanks for connecting with us. We’ve received your message, and we will ask a few quick questions to understand your requirements.
>
> Please choose your preferred language to continue 👇

Use a STOP button/opt-out path where the actual message type and flow require it, but do not claim that STOP makes a template Utility. English, Hindi and Marathi variants should preserve the same event and variable meanings; do not mix all three languages into one template unless deliberately designed and reviewed.

## Local source map

All paths below are on Yogesh's Windows laptop, rooted at:
`C:\Yogesh - personal\Claude\Cluade Projects\Ai Automation\What's App Automation\`

- `WhatsApp Automation template & workflow\00_START_HERE.md` — reading order and scope.
- `WhatsApp Automation template & workflow\01_Master_Roadmap_and_Phasing.md` — Phase 1a–1d and later phases.
- `WhatsApp Automation template & workflow\02_Phase0_Open_Items_and_Risks.md` — unresolved ownership, billing, verification, pricing and CTA items.
- `WhatsApp Automation template & workflow\03_Data_Model_and_Sheets_Schema.md` — proposed Contact/Service/Template/Pain→Offer/Team/Campaign masters; not a live workbook.
- `WhatsApp Automation template & workflow\04_Template_Library_Phase1.md` — module template inventory.
- `WhatsApp Automation template & workflow\modules\M1_Qualify_and_Book.md` through `M5_Marketing_Broadcast_and_Winback.md` — module specifications.
- `WhatsApp Automation template & workflow\05_Source_Material_Index.md` — source map and authority caveats.
- `Document\veblika knowledge base.pdf` — vendor capability reference.
- `Document\N8N AI WA VEBLIKA BOT.json` — candidate 8-node n8n pattern: Webhook → AI Agent/OpenRouter + Simple Memory → Switch → Set/Edit fields.
- `Document\WHATSAPP ai_ca_bot_1765427504456.json` — smaller generic trigger/action skeleton; lower reuse value.
- `Document\AI Automation_compressed.pdf` — external Automation Saathi reference; use structure only, not brand, claims or copy.
- `Document\BizAutomation All in One SAAS Plans.pdf` — source for the BizAutomation plan shape; partner terms are not proven by this public PDF.
- `Document\final doc\Sahas-AI_With_Plans_compressed.pdf` and `Sahas_AI_Business_Automation_Agency_Refined_Final.pdf` — Sahas AI introduction/plan PDFs; the With Plans version is the current plan attachment. Do not add Google services to the public offer.
- `chat history\WhatsApp_Automation_Playbook.html` and `SOP_Agent_7Step_Applied.html` — earlier deliverables; useful context, not live configuration.
- `video lecture\04_...Notes.docx` through `12_...Notes.docx` and matching videos — Veblika/BizAutomation course notes and source recordings.

## Vault source map

Start with `MOC.md`, then read the relevant folder index and these notes: [[whatsapp-automation-agency-phased-plan]], [[whatsapp-api-onboarding]], [[whatsapp-lead-sop-8-stage]], [[agency-automation-plan]], [[crm-and-field-model]], [[whatsapp-message-templates-mr-hi-en]], [[whatsapp-chatbot-builder-reference]], [[whatsapp-forms-builder-reference]], [[whatsapp-flow-builder-webhook-reference]], [[ai-agent-five-components]], [[training-lesson-8-workflow-vs-ai-automation]], [[training-lesson-9-welcome-to-appointment-booking]], [[training-lesson-11-whatsapp-flow-mastery]], [[whatsapp-template-anatomy]], [[whatsapp-template-categories-and-approval]], [[whatsapp-forms-json-portability]], [[whatsapp-automation-vendors]], and [[whatsapp-meta-current-pricing-and-service-rules-2026-09]].

The global Utility drafting skill and its 164-entry English library snapshot are outside the vault at:
`C:\Users\user\.codex\skills\whatsapp-utility-templates\SKILL.md`
and
`C:\Users\user\.codex\skills\whatsapp-utility-templates\references\Meta_Utility_Template_Library_164_en_US.md`.

Related: [[whatsapp-automation-agency-phased-plan]], [[whatsapp-api-onboarding]], [[whatsapp-message-templates-mr-hi-en]], [[whatsapp-meta-current-pricing-and-service-rules-2026-09]].
