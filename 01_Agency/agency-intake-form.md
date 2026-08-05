---
title: Agency Intake Form
created: 2026-08-05
tags: [form, intake, agency, sahas-ai]
source: Claude Desktop conversation - AI Automation project
origin: ai
author: claude.ai
maturity: supported
---

# Agency Intake Form

The Stage-2 bot question set = CRM columns = call-capture form for agency leads. Maps to Contact Master in [[crm-and-field-model]].

| Field | Type | Options / note |
|---|---|---|
| Source / Campaign | dropdown | Ad · Google · Website · QR/card · Referral · Walk-in |
| Owner name | text | genericise if storing example |
| Business name | text | |
| Business type | dropdown | Clinic · Coaching · Salon/gym · Hotel/restaurant · Retail · Real estate · Other |
| Main bottleneck | dropdown | Missed enquiries · No-shows · Not found on Google · Repetitive replies · Low reviews · Need leads |
| Enquiries/month | dropdown | <30 · 30–100 · 100–300 · 300+ |
| City / Area | text | |
| Budget comfort/mo | dropdown | Not sure · <₹3k · ₹3–8k · ₹8k+ |
| WhatsApp number | phone | **not stored in vault notes** |
| Preferred call time | dropdown | Morning · Afternoon · Evening |
| Notes | text | |

Stage auto-set to **New Lead** on capture. Related: [[agency-automation-plan]] · [[client-onboarding-brief]]
