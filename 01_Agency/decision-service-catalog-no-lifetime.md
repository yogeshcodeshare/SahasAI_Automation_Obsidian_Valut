---
title: Decision — Service Catalogue Without Lifetime Offers
created: 2026-08-15
tags: [decision, agency, pricing, ghl, veblika, whatsapp]
source: Yogesh package decision in Codex conversation; supplied BizAutomation plan PDF summary
origin: ai
author: codex
maturity: emerging
status: active
---

# Decision — Service Catalogue Without Lifetime Offers

## Decision

Sahas AI will not sell a lifetime offer. It will use recurring monthly or prepaid-annual plans plus a transparent **one-time ₹1,000 onboarding / account-registration fee** at signup. The fee is not described as a "first-month" charge, because that wording makes the invoice and renewal logic unclear.

### GHL plans

| Plan | Client-facing name | Included fixed scope | Monthly | Prepaid annual |
|---|---|---|---:|---:|
| Starter | **GHL Workspace** | GHL workspace/sub-account access and basic onboarding; no custom flows, integrations, or AI agent | ₹999 | ₹12,000 |
| Pro | **GHL Guided Workspace** | GHL workspace/sub-account plus the defined guided-learning/onboarding deliverable; no custom automation build | ₹1,499 | ₹12,000 |
| Elite | **Business Automation Suite** | GHL + WhatsApp/Veblika setup, 3–4 named fixed end-to-end flows, one named fixed-scope AI agent, and handover | ₹2,499 | ₹25,000 |
| Supercharge | **Supercharge Custom Build** | Custom workflows, integrations, extra agents, or requirements outside fixed scope | quoted separately | quoted separately |

### WhatsApp-only plans

| Plan | Client-facing name | Included fixed scope | Monthly | Prepaid annual |
|---|---|---|---:|---:|
| WA 1 | **WhatsApp Lead Engine** | WhatsApp/Veblika setup, up to 4 named fixed end-to-end flows, UAT and handover | ₹1,999 | ₹15,000 |
| WA 2 | **WhatsApp Lead Engine AI** | WhatsApp/Veblika setup, up to 4 named fixed end-to-end flows, **one** named fixed-scope AI agent, UAT and handover | ₹2,499 | ₹20,000 |

The second WhatsApp plan was raised from ₹1,999/month to ₹2,499/month. Two plans with identical monthly pricing but different AI scope are not a credible choice architecture. A second AI agent, a fifth independent flow, integrations, bespoke knowledge-base work, or non-standard logic is Supercharge scope.

## Fixed Scope Definitions

An end-to-end flow must have one written trigger, a defined data capture/update, a customer or staff action, an owner/handoff rule, and a UAT test. Standard examples are:

1. Lead capture + qualification
2. Booking + confirmation + reminders
3. Follow-up / nurture + human handoff
4. Review/referral **or** payment reminder

The one included AI agent is limited to a named purpose such as FAQ + lead-intent triage. It must hand off unusual questions, complaints, pricing/discount requests, legal matters, or unknown answers to a human. It cannot independently send proposals, commitments, or discounts.

## Important Commercial Boundaries

- `GHL account` must be described as **GHL workspace/sub-account access** until BizAutomation confirms the provision, ownership, export, cancellation, and price-change terms in writing. Do not imply a client-owned standalone GHL licence without that confirmation.
- `WhatsApp/Veblika setup` is subject to client-owned WABA/number, Meta verification, approved templates where required, and provider capability. Meta conversation charges, ad spend, and any external paid tool are separate unless explicitly included in a signed scope.
- The annual amount is a **prepaid annual plan price**, not necessarily twelve times the monthly price. Show the effective monthly amount and clearly state whether GST is included or extra before publishing the catalogue.
- `Learning` in Pro is too vague to sell alone. Before publishing, define the exact deliverable: for example, onboarding checklist, number of guided sessions, recording/resource pack, and support boundary.
- Starter and Pro are access/guidance plans. They do not include the fixed automations, integrations, or agent promised in Elite.

## Alternatives Rejected

- **Lifetime offer** — removed: recurring provider costs, support duties, Meta policy changes, and future work make it commercially unsafe.
- **Same ₹1,999 monthly price for both WhatsApp plans** — rejected: it makes the AI plan dominate the non-AI plan and invites scope disputes.
- **"One or two AI agents" in a base package** — rejected: exact agent count and role must be fixed. Extra agent work is Supercharge.
- **"4–5 flows" without an acceptance definition** — rejected: the plan promises up to four independent flows; any fifth is an explicitly scoped small linked action or Supercharge.
- **Selling GHL/Veblika account ownership as confirmed** — rejected until written partner terms verify it.

## Depends On

- [[bizautomation-reseller-deal]] — public-plan / partner-price conflict and sub-account ownership questions.
- [[whatsapp-api-onboarding]] — WABA ownership and setup prerequisites.
- [[pricing-ladder]] — this customer-facing plan decision conflicts with earlier generic custom-automation pricing; do not silently delete the earlier record.
- [[decision-existing-system-rescue-sprint]] — separately scoped ₹5,000 rescue pilot, not a substitute for recurring plans.
- [[agency-automation-plan]] — fixed flow patterns and safety boundaries.

## Review Trigger

Review after three paid sales conversations or the first paid implementation. Reopen immediately if vendor terms show that account ownership, capacity, WhatsApp entitlement, or costs differ from this catalogue; if GST display changes; or if the actual time to build an included flow/agent makes the price unprofitable.

