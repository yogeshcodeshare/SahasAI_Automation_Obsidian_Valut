---
title: WhatsApp Agent Team — Agent 5 Review & Feedback (Veblika + n8n)
created: 2026-10-28
tags: [project, whatsapp, reviews, google-business-profile, n8n, renault]
source: Claude Code build session 2026-10-27/28; local "WhatsApp Team/05 Review Agent" (plan, BUILD-STEPS, README)
origin: ai
author: claude-code
maturity: supported
---

# Agent 5 — Review & Feedback

Part of [[whatsapp-agent-team-renault]]. Built 2026-10-28, logic-tested with pinned data; not published.

## Flow
- Advisor sets `appointments.status = done` → **3 h after it was marked done** (10:00–20:00 Mon–Sat) the customer gets
  `service_feedback_mr/hi/en`: a **⭐ Google Review** URL button + a **"काही problem होता"** quick-reply button.
- One reminder after 2 days, never to someone who complained. Lead stage → `6 Review`; `last_marketing_at` set (Meta classed the template Marketing).
- Problem button → complaint path inside Agent 1: asks for one line → saves it (`activity`, `appointments.complaint`, rating 1) →
  `complaint_alert` template to the service advisor → thank-you reply → `next_action = call` (lands in the next call list / voice agent).

## Design decision: no review gating
Every customer sees the same Google button; unhappy ones additionally get a private problem path. Sending the Google link only to
happy customers is "review gating", which Google's policy forbids — see [[google-review-gating-not-allowed]].

## Lessons
- The quick-reply text must match Agent 1's regex exactly, per language.
- Templates approved 2026-10-27; the Google button currently points to the **Sahas AI** profile (test) — swap for the dealer's review link before go-live.
- Nothing creates `appointments` rows automatically yet (Akshay never confirms bookings), so Agent 5 needs the advisor (or the voice agent) to create/mark them.
