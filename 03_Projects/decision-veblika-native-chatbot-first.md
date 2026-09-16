---
title: Decision Veblika Native Chatbot First
created: 2026-09-16
tags: [decision, project, whatsapp, veblika, chatbot, flow]
source: Yogesh and Codex planning conversation through 2026-09-16
origin: ai
author: codex
maturity: supported
status: active
---

# Decision Veblika Native Chatbot First

## Decision

Build Sahas AI's first WhatsApp automation release as four deterministic Veblika chatbots (C1–C4) with two guarded form-processing Flows (F1–F2), before building AI Agents, n8n automations, or GHL automation.

## Context

Sahas AI needs a reliable, demo-ready system for its own enquiry management while Yogesh is learning alongside a job. Veblika already has Chatbot-V2, WhatsApp Forms, Contacts, Tags, Columns, and Flow Builder capabilities sufficient for the core lead journey. The existing Growth Checker and date/time-preference forms provide the two structured capture points.

## Alternatives rejected

- **Build all eleven automation ideas in one Veblika chatbot now** — rejected because it would be hard to test and would mix deterministic, AI, calendar, payment, and CRM work before the basic lead path is proven.
- **Use a native Calendly Flow for booking now** — rejected because the current form captures only requested date/time and native Veblika has no demonstrated live availability/pipeline reservation in this plan. Live booking is reserved for WhatsApp + n8n + GHL.
- **Use AI for the first enquiry path** — rejected because language routing, forms, tags, and human handoff are known deterministic steps. AI comes later for open-ended FAQ and content-briefing work.
- **Use a secret text keyword to start client onboarding** — rejected because a manually sent approved onboarding template with a Start Onboarding button is clearer and safer for a confirmed client.

## Depends on

- [[whatsapp-sahas-ai-current-build-brief]] — existing forms, account history, and category caveat.
- [[whatsapp-chatbot-builder-reference]] — native chatbot action model.
- [[whatsapp-flow-builder-webhook-reference]] — event filtering and Flow mechanics.
- [[veblika-native-ai-assistant-capabilities]] — native assistant capabilities and limits.
- Assumption: live Veblika account access retains the Forms, Chatbot, and Flow Builder features shown in the supplied screenshots.

## Consequences

- Build C1–C4 and F1–F2 one at a time, test each end-to-end, then publish.
- Treat F1/F2 exact `flowId` checks as mandatory before mapping any contact data.
- Keep C5/C6, two native AI Assistants, n8n, and GHL as later milestones rather than scope creep in the first release.
- Do not describe a preferred callback slot as a confirmed appointment.

## Review trigger

Revisit if Veblika changes its Flow or form payload capabilities, if the native release fails real testing, or when Sahas AI needs verified calendar availability and pipeline automation.

Related: [[veblika-native-chatbot-and-flow-roadmap]].
