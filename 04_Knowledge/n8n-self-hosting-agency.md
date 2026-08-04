---
title: n8n Self-Hosting for the Agency
created: 2026-08-02
tags: [knowledge, n8n, automation, infra]
source: Claude research (n8n docs + web)
origin: ai
author: claude-code
---

# n8n Self-Hosting for the Agency

**Genuinely free:** Community Edition is MIT-licensed, self-hosted, unlimited workflows/executions/users, no expiry. Only cost = the VPS (already paying).

## The "projects" caveat
RBAC **Projects** are NOT in Community Edition (paid feature). Community also has no credential *sharing* — only owner + creator see a credential. **But Yogesh is solo, so he IS the owner** → practical setup: one folder/tag per client, one credential per client, all encrypted at rest via `N8N_ENCRYPTION_KEY`. Storing client credentials separately per client is fully feasible today, free. What you don't get is role isolation (only bites when you hire). If ever needed: run a separate n8n container per client on the same VPS.

## Clients per VPS
Limit is executions, not clients. On a KVM2 (2 vCPU/8GB, also running GMB Sarathi + nginx): **20–40 tier-3 clients** on light scheduled/webhook automations. Past that → queue mode + Redis + workers, or a bigger VPS.

## Pricing n8n work
Never sell "n8n" — sell the outcome. Bundle into WhatsApp Automation (₹2,999/mo) or price bespoke workflows ₹8,000–15,000 one-time / ₹1,500/mo. See [[pricing-ladder]].

## Automations worth selling (idea bank)
Missed-call → WhatsApp; lead → AI-qualify → owner ping; abandoned-enquiry drip; fee/invoice reminders; appointment reminders (confirm/reschedule); post-visit review request; daily Marathi owner digest; photo-collection → feed GMB Sarathi; AI FAQ responder (Groq) with human handoff. Client-critical automations run in n8n, NOT Hermes ([[ai-tools-stack-3-layer]]).
