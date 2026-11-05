---
title: AI Voice Calling Agents on Sarvam (Renault) — V1 outbound + V2 inbound, wired to the WhatsApp team
created: 2026-10-28
tags: [project, voice-agent, sarvam, n8n, supabase, renault]
source: Claude Code session 2026-10-27/28; local "What's App Automation/AI Voice Calling Agents/" (setup guide, prompts, agent specs, n8n doc)
origin: ai
author: claude-code
maturity: emerging
updated: 2026-11-05
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

## Update 2026-11-05 — V1 built in Sarvam and tested; persona split decided
- **Persona split (Yogesh decided):** WhatsApp agent stays **Akshay**; the voice agent is **Anjali** (female, feminine verb forms in Marathi/Hindi; never claims to be human, answers truthfully if sincerely asked). Each prompt tells the agent the other exists, so "Akshay told me your details" works.
- **V1 outbound built** (committed version 1, then edited further as draft): Marathi first, **Marathi+English / Hindi+English code-mixed** (nobody speaks pure Marathi on the phone; everyday English words stay English), Bulbul V4 female voice, speed 1.05, temperature 0.4, silence nudges 6 s / 10 s then hang up, voicemail message, max call 5 min, pronunciation dictionary (Renault is said "Reno"), languages limited to the 9 Bulbul V4 supports.
- **Knowledge search tool** `search_knowledge` = Sarvam API tool to n8n V-4 (same Supabase knowledge base as WhatsApp), bearer secret kept in Sarvam secrets, 15 s timeout, English fallback line (a fixed fallback cannot follow the caller's language).
- **Call goal workaround:** Sarvam's call goal checks one variable against **one** value, so a boolean output `goal_achieved` is true when a booking / confirmation / reschedule is agreed; `call_outcome` (12 values incl. `breakdown_help`) still carries the detail for n8n V-2.
- **Test calls:** a booking call passed the goal with all fields captured (car, service, date/time, registration, pickup, language). Two accident calls exposed the emergency-call problem, see [[decision-voice-emergency-calls-never-wait-until-morning]].
- **V-2 verified by replaying a real call payload** into the production webhook (no phone number needed): call logged, lead updated, appointment `requested`, advisor alert and customer summary WhatsApp both accepted. Details and traps: [[n8n-lessons-whatsapp-agent-team]], [[sarvam-mcp-and-agent-build-lessons]].
- **WhatsApp templates:** English only for now (`voice_call_alert`, `voice_call_summary_en`, `voice_missed_call_en`, all Utility, Approved); V-2 sends English to every customer; mr/hi versions later.
- **Still open:** Vobiz number (KYC) for V-1 dialing and inbound; dealer facts (Renault Assist roadside number, hours, address, prices) in the knowledge base; recommit V1 after prompt fixes and set `app_version` in V-1; build V2 inbound; rotate the webhook key before go-live; delete test appointments before publishing V-1.
