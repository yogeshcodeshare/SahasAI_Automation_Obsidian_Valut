---
title: WhatsApp Automation — Agency Phased Plan
created: 2026-08-14
tags: [project, whatsapp, n8n, ghl, hermes, sahas-ai, roadmap]
source: Claude Code planning session (WhatsApp Automation template & workflow folder)
origin: ai
author: claude-code
maturity: established
---

# WhatsApp Automation — Agency Phased Plan

Yogesh reviewed and explicitly approved this phased sequence across two planning passes (2026-08-14). It supersedes the timing assumptions in [[decision-ghl-deferral]] and the Hermes-gate line in [[sahas-ai-overview]] — both now point here.

**Full build-ready detail lives outside the vault**, in the working folder `What's App Automation/WhatsApp Automation template & workflow/` (17 files: roadmap, Phase-0 open items, CRM schema, template library, source index, confirmation log, growth strategy, external research findings, BizAutomation partnership reference, Hermes agent reference, and five module specs `M1`–`M5`). This note is the vault-side summary and pointer — read it there for the working level of detail.

## The eight-step sequence

1. **Phase 1a — WhatsApp-native only.** Veblika's own Chatbot Builder, WhatsApp Flows/Forms and Templates — no n8n. Covers most of Module 1 (Qualify+Book) and Module 4 (Review+Referral). See [[agency-automation-plan]]'s update for Module 1's new entry points.
2. **Phase 1b — n8n added** where WhatsApp-native logic genuinely isn't enough: Module 2 (Follow-up Sequencer), Module 3 (Proposal & Payment), Module 5 (Marketing Broadcast & Win-back, new this session — see [[agency-automation-plan]]).
3. **Phase 1c — n8n + other integrations**: Gmail, Calendar, error alerting (Telegram/Slack).
4. **Phase 1d — Test everything** end-to-end before touching GHL.
5. **Phase 2 — GoHighLevel joins the stack.** Firm, scheduled — see [[decision-ghl-deferral]]'s update.
6. **Phase 3 — Website + social media.** Website built inside the BizAutomation/GHL platform's included builder (not a custom VPS site — see [[decision-hostinger-kvm2-dokploy-website-n8n]]'s update); social accounts registered from scratch (currently only email + mobile number exist as business identity).
7. **Phase 4 — Hermes agent.** Sahas AI's own back-office agent (research, drafts, reminders — never client automation). Governance already specified in `05_Agent-Memory/Hermes/`; zero build progress otherwise. See [[hermes-desktop-and-samin12-research]] for this session's open question (is Samin12's `hermes-desktop` repo the same Hermes ecosystem?) and candidate building blocks.
8. **Phase 5 — Coaching-class vertical.** Still deferred, unchanged from the original plan — see [[coaching-class-vertical-playbook]].

## What's genuinely new this session (not just re-sequenced)

- **BANT fields + free-text problem capture** in the Contact Master, and a new Campaign Log master for Module 5 — see [[crm-and-field-model]]'s update.
- **Module 1 gained two new entry points**: a "Business Growth Checker" WhatsApp Form (Entry B) and a candidate missed-call trigger (Entry C, not committed) — see [[agency-automation-plan]]'s update.
- **A RAG-based conversational qualifier** flagged as a possible Entry B upgrade, deliberately deferred until Phase 1 is confirmed live.
- **Formal BizAutomation associate partnership** — pricing, legal-entity, and partnership-terms findings, several still needing Yogesh's verification — see [[bizautomation-reseller-deal]]'s update.
- **A third conflicting Meta pricing data point** — see [[whatsapp-api-pricing-model-india]]'s update.
- **`scrapling-official` Claude Code skill installed** from the verified upstream Scrapling repo (not the unaudited third-party package) — see [[on-demand-skill-installation-policy]].

## Open items still needing Yogesh

The full list (13+ items) lives in the working folder's `02_Phase0_Open_Items_and_Risks.md`. The ones that also touch vault content: the BizAutomation legal-entity name and pricing conflict ([[bizautomation-reseller-deal]]), the three-way Meta pricing conflict ([[whatsapp-api-pricing-model-india]]), and whether Samin12's `hermes-desktop` is the same Hermes ecosystem ([[hermes-desktop-and-samin12-research]]).
