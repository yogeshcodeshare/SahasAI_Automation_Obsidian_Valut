---
title: AI Voice Calling Agents on Sarvam (Renault) — V1 outbound + V2 inbound, wired to the WhatsApp team
created: 2026-10-28
tags: [project, voice-agent, sarvam, n8n, supabase, renault]
source: Claude Code session 2026-10-27/28; local "What's App Automation/AI Voice Calling Agents/" (setup guide, prompts, agent specs, n8n doc)
origin: ai
author: claude-code
maturity: emerging
---

# AI Voice Calling Agents (Sarvam) — designed + n8n built, not live

Second channel next to [[whatsapp-agent-team-renault]], same Customer Hub. Platform facts: [[sarvam-voice-agents-platform-facts]].
Why two agents: [[decision-voice-team-two-agents-outbound-first]].

## Agents (built in the Sarvam dashboard by Yogesh, from the local specs)
- **V1 Outbound Call-back & Confirm** — calls only people who asked (booking / "call me"), silent hot leads, complainers, and tomorrow's appointments.
- **V2 Inbound Receptionist** — answers the dealer's number 24×7 (after-hours wording), books, answers from the knowledge base, breakdown safety first, transfers to the advisor in office hours.
- Both: Marathi first, Hindi/English switch, never confirm a slot as final, never quote prices not in the knowledge base, never ask OTP/PAN/Aadhaar.
- Output variables (same names in both) carry the call data: `call_outcome` (enum), `preferred_date`, `preferred_time`, `car_model`, `service_type`, `registration_number`, `pickup_needed`, `callback_time`, `complaint_text`, `customer_language`, `call_summary` (+ `whatsapp_ok` on inbound for consent).

## n8n (folder "WhatsApp Agents Team", built + logic-tested 2026-10-28, unpublished)
- **V-1 Call Dispatcher** — every 10 min, 10:00–19:30 Mon–Sat: `call_queue` pending rows (+ retry after 2 h) and tomorrow's appointments → Sarvam Instant Outbound API, max 3 per run.
- **V-2 Call Result** — Sarvam webhook after every call → `activity` (+ English transcript), lead (stage 4 on booking, next_action, opt_out_voice), `call_queue` status, `appointments` (requested / confirmed / rescheduled / cancelled), advisor alert, customer WhatsApp summary or "we tried to call" after 2 no-answers.
- **V-3 Caller Lookup** — Sarvam on-start hook for V2: caller number → name, car, last summary, open appointment.

## Open before live
Sarvam account + number (Vobiz/rented if call transfer is needed) · build both agents from the specs · n8n credentials (Sarvam API Key, Voice Tools token) and config IDs · 7 new WhatsApp templates (`voice_call_alert`, `voice_call_summary_*`, `voice_missed_call_*`) · publish V-3 → V-2 → V-1.
