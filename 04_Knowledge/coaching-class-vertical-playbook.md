---
title: Coaching Class Vertical — Pitch Playbook
created: 2026-08-02
tags: [knowledge, vertical, coaching, pitch, sales]
source: Claude research + planning conversation
origin: ai
author: claude-code
maturity: emerging
---

# Coaching Class Vertical — Pitch Playbook

**#1 vertical.** One admission = ₹25k–1L (offline NEET/JEE ₹70k–1.5L/yr; 11–12 science ₹20–40k). One extra admission pays your whole year's fee — 50× a salon's per-lead value.

- **Karad cluster:** Ogalewadi Rd, Market Yard Rd, Krishna Naka, Station Rd. Online competitors: Vedam Academy, Sharda Classes, Chate (38 yrs), MPSC tutorials. GCEK + Krishna medical college nearby → real NEET/JEE/CET/MPSC demand.
- **Season:** admissions April–June. **Off-season pitch:** "You can't fix April in April — you fix it in August" (reviews/ranking/content compound over 3–6 months).

## 8 problems → fixes
1. Late enquiry reply → 30-sec auto-reply · 2. Can't answer phone (teaching) → missed-call→WhatsApp · 3. One follow-up then silence (5–10 touchpoints, parent+student) → 7-day drip · 4. Chasing fees → auto reminders · 5. Parents hear nothing → weekly parent updates · 6. 8 reviews vs rival's 60 → review machine + QR · 7. Rank 12 → GMB Boost + grid proof · 8. Toppers' banner wasted → results auto-posted GBP+Insta+FB + parent broadcast. Bonus: absent-student → same-day parent alert.

## Pitch (walk in with the audit ready)
Open: "सर, मी तुमच्या क्लासचं Google वर काय दिसतंय ते तपासलं. दोन मिनिटं आहेत का?" → show score → grid heatmap → competitor review gap → posts gap → money line: "एक extra admission ₹30,000. माझी वर्षभराची फी ₹36,000 = सव्वा एक admission." → close: "ऑडिट फुकट. एक महिना करून बघा."

## Objection handlers
- "enquiries येतातच" → "किती जणांना २ मिनिटांत उत्तर देता?" · "मी स्वतः WhatsApp करतो" → "रात्री ११ वाजताच्या enquiry ला?" · "word-of-mouth" → "पालकाने आधी Google वर बघितलं — ८ reviews vs शेजारी ६०" (wins the room) · "महाग आहे" → re-anchor on admission math.

## Pricing
"Admission Machine" ₹4,999/mo or "Season Sprint" ₹19,999 (Feb–June) + ₹1,999/mo off-season. See [[pricing-ladder]].

## WhatsApp automation module set for coaching
*Added 2026-08-05 from Claude Desktop (AI Automation project).*

Applies [[whatsapp-lead-sop-8-stage]] to coaching. Lead = parent/student; intake via [[coaching-intake-form]]; fields -> [[crm-and-field-model]].

**Admissions funnel:** greeting bot -> qualify (std/subjects/board/medium/area) -> batch card + toppers image + free-demo offer -> book demo (Flow) -> 24h/1h reminders -> post-demo "ready to enroll?" -> fee pay link -> welcome.

**Everyday parent automations (retainer goldmine, mostly Utility):** fee-installment reminders - absent/attendance alerts - test schedule & results cards - new-batch broadcasts (Marketing) - holiday/timing notices - PTM scheduling.

**Module SOPs (numbered):**
- *Qualify + Demo Booking:* msg (free) -> Veblika bot Q&A -> n8n -> Student Master (New Lead) -> batch card + demo offer -> Flow books demo -> n8n Calendar + Stage=Demo Scheduled -> reminders -> *booked & logged*.
- *Fee Reminder:* n8n checks Fee Master daily (due in 3 days) -> Veblika utility + pay link -> status update -> escalate if unpaid -> *faster collections*.
- *Attendance Alert:* faculty marks absent -> n8n evening sweep -> Veblika utility to parent -> *same-day trust*.
- *Result Broadcast:* marks entered -> n8n -> Veblika utility marks-card -> *transparent results*.
- *New-Batch Campaign:* segment past enquiries -> Veblika marketing broadcast -> interest routes into demo booking -> *batches filled cheaply*.

Templates: [[whatsapp-message-templates-mr-hi-en]]. Per-message costs: [[whatsapp-api-pricing-model-india]].
