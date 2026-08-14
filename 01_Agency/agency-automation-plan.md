---
title: Agency Automation Plan (Sahas AI's own funnel)
created: 2026-08-05
updated: 2026-08-14
tags: [agency, plan, whatsapp, sahas-ai]
source: Claude Desktop conversation - AI Automation project
origin: ai
author: claude.ai
maturity: emerging
---

# Agency Automation Plan — Sahas AI's own funnel

We run our own agency on the exact system we sell (best proof). Lead = a local business owner. Follows [[whatsapp-lead-sop-8-stage]]. Feeds from the website "Start on WhatsApp" CTA (see [[sahas-ai-website-production]]).

## Step 1 — Understand
Local B2B automation agency; leads via Click-to-WhatsApp ads, Google profile, website, QR, referrals; delivery = setup project + monthly care (approve-before-publish); payment via UPI/pay-link.

## Step 2 — RCM (abridged)
| Process | Risk | Control | Solution |
|---|---|---|---|
| Lead capture | Slow reply → cold | Reply <1 min 24×7 | Veblika greeting bot |
| Qualification | Wrong-fit calls | Qualify before booking | Veblika bot → Sheet |
| Booking | No-show | Confirmed slot + reminders | Veblika Flow → n8n → Calendar |
| Follow-up | Leads forgotten | Auto nudge, stop on reply | Veblika utility + n8n |
| Conversion | Slow quoting | Fast proposal + pay link | Veblika template + Sheet |
| Security | Password leak | No passwords ever | Policy → [[approve-before-publish-immutable-baseline]] |

## Stage-by-stage
Greeting bot → qualify (type/pain/city) via [[agency-intake-form]] → send matching example → book free Growth Check → Day 2/4/7 follow-up → proposal + pay → Closed Won → 7-day review + referral.

## Module SOPs (numbered)
**Qualify + Book:** message (free) → Veblika bot asks type/pain/city → n8n saves to Contact Master (New Lead) → Veblika sends deliverable → Flow books call → n8n Calendar + Stage=Appointment → confirm + 24h reminder → *booked & logged*.

**Follow-up Sequencer:** stage stale >24h → n8n daily check → Veblika Day 2/4/7 nudge → reply stops sequence → *no lead forgotten*.

**Proposal & Payment:** Stage=Interested → Veblika proposal + pay link → pay → Stage=Closed Won → n8n onboarding → *client onboarded*.

**Review & Referral:** 7 days post-live → Veblika utility asks review + referral → referral = new Contact row → *reputation + referral*.

**Marketing Broadcast & Win-back** *(new module, added 2026-08-14 — was not in the original 4-module sketch)*: manual campaign kickoff (launch / festival / re-engagement of stale Interested leads / win-back of Lost leads) → segment Contact Master → Veblika broadcast → n8n logs to the new Campaign Log master (see [[crm-and-field-model]]'s update) → block-ratio check ([[whatsapp-bulk-broadcast-and-block-ratio]]). Never targets cold/purchased data — opted-in contacts only, and only after the number warm-up period ([[whatsapp-number-safety-warm-up]]). Built and turned on last, after the other four modules are live.

## Update — 2026-08-14: Qualify + Book gains two more entry points

The Qualify+Book module SOP above (the "message (free) → Veblika bot asks type/pain/city..." line) is now one of three entry points, all converging on the same call-booking step:

- **Entry A** — the original conversational flow above, unchanged.
- **Entry B (new)** — a **"Business Growth Checker"** CTA (a website button, or a click-to-WhatsApp link/QR before the website exists) that opens a structured **WhatsApp Form** instead of a conversation: business info fields, a predefined problem checklist, and a free-text "describe your specific issue" box (feeds the new `Problem Details` field — see [[crm-and-field-model]]). Submission skips straight to slot booking since the form already captured what the conversational intake would ask.
- **Entry C (candidate only, not committed)** — missed-call-to-WhatsApp: give a missed call, get an automated WhatsApp opener starting Entry A's flow. Common, low-friction pattern for Indian SMBs, but needs a virtual-number service (extra cost, not priced) — a "should we build this" call for Yogesh, not decided here.

Also flagged: a **RAG-based conversational qualifier** (lets the lead describe their problem to an AI agent that suggests possible solutions, instead of the static checklist) is a candidate upgrade to Entry B — deliberately deferred until the full phased plan's Phase 1 is confirmed live, unless scoping shows it's a small lift.

Full detail: `modules/M1_Qualify_and_Book.md` in the working folder (see [[whatsapp-automation-agency-phased-plan]]).

Related: [[sahas-ai-overview]] · [[service-offerings]] · [[pricing-ladder]] · [[whatsapp-api-onboarding]] · [[whatsapp-automation-agency-phased-plan]]
