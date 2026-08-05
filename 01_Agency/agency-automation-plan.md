---
title: Agency Automation Plan (Sahas AI's own funnel)
created: 2026-08-05
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

Related: [[sahas-ai-overview]] · [[service-offerings]] · [[pricing-ladder]] · [[whatsapp-api-onboarding]]
