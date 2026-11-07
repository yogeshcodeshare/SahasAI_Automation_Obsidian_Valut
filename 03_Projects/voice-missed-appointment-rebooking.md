---
title: Missed appointment → advisor alert + voice call to rebook (V-5)
created: 2026-11-07
tags: [project, voice-agent, n8n, appointments, renault]
source: Claude Code session 2026-11-07 (Yogesh chose option (a): the advisor marks jobs done)
origin: ai
author: claude-code
maturity: emerging
---

# Missed appointment rebooking (V-5)

Part of [[ai-voice-calling-agents-sarvam]]. Built 2026-11-07, unpublished.

## Flow
- Runs **Mon–Sat at 1 PM and 7 PM**.
- Finds appointments whose slot passed **more than 2 hours ago** (last 3 days) and are still `requested`, `confirmed` or `rescheduled`.
- Marks them `no_show`, sends the advisor a WhatsApp ("Missed appointment"), logs `appointment_no_show`, and adds **one** `call_queue` row per customer with reason `missed_appointment`.
- V-1 then calls (10:00–19:30): Anjali checks all is well, never blames, and takes a new day and time.
- V-2: a new day/time from that call creates a **new appointment** (reschedule without an appointment id → create).

## Decision (Yogesh, 2026-11-07): option (a)
The advisor **marks the car "done"** (Sheet or database) when the job is finished. Without that, a customer who came would wrongly get a "missed visit" call. Rejected for now: (b) wait for the advisor to answer the alert before calling — safer but more complex.

## Open
If cars stay in the workshop past the 2-hour grace, add an "in service" status (needs a one-line database constraint change) or raise the grace period.
