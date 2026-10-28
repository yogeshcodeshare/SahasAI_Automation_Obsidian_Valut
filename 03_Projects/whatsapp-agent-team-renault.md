---
title: WhatsApp Agent Team (Renault service centre) — how the 5 agents work together
created: 2026-10-28
tags: [project, whatsapp, veblika, n8n, supabase, agent-team, renault]
source: Claude Code build sessions 2026-10-18 → 2026-10-28; local "What's App Automation/WhatsApp Team/README.md" and agent folders
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Agent Team — Renault service centre

Five WhatsApp agents + three support workflows on n8n, all sharing one **Customer Hub** (Supabase = master, Google Sheet "AI Agent" = view).
All built and logic-tested by 2026-10-28; **all unpublished** (publish at go-live). The AI voice team ([[ai-voice-calling-agents-sarvam]]) plugs into the same Hub.

## The agents (n8n folder "WhatsApp Agents Team")
| Agent | Job | Note |
|---|---|---|
| 1 WhatsApp AI Agent (Akshay) | answers every message: text, voice, photo, video, PDF, Word; STOP; after-hours aware; complaint path | [[renault-whatsapp-agent-veblika]] |
| 2 Lead Qualification | scores hot/warm/cold with fixed rules (AI only extracts facts), saves the lead, sets the follow-up timer, flags call-backs | — |
| 3 Follow-up | 4 reminders (AI text inside 24 h, then templates +1 d / +3 d / +7 d), stops on reply / "not now" / STOP / stage 4+ | — |
| 4 Bulk Broadcast | approved campaigns from the Sheet, 150 cap, safety gate | [[whatsapp-bulk-broadcast-agent]] |
| 5 Review & Feedback | Google review request after service + complaint path | [[whatsapp-review-feedback-agent]] |
| Support | Supabase → Sheet Sync (10 min, upsert by phone/id), Knowledge Base Loader (form, replace by title), Morning Call List (10:00 → `call_queue`) | — |

## The hand-off field: `leads.next_action`
`none` → `call` (booking request or "call me" from Agent 2, silent hot lead after Agent 3's 4th reminder, complaint) →
`queued` (Morning Call List put it in today's `call_queue` sheet tab) · `complaint_pending` (waiting for the complaint text).
The `call_queue` tab is the work list for the advisor today and for the AI voice agent later.

## Shared rules
- Office/advisors 10:00–20:00, cars serviced 08:00–18:00, Sunday closed (dealer-confirmed 2026-10-27).
- Agent 1 replies 24×7 but after hours never promises a call tonight — "advisor will call after 10 AM next working day".
- All sending agents (3, 4b, 5) only 10:00–20:00 Mon–Sat. Marketing max once per 24 h per person (`last_marketing_at`).
- STOP / नको / बंद करा → `opt_out_whatsapp`; nobody messages that number again.

## Problems found during the 2026-10-28 audit (fixed)
- Agent 2 never set `next_action = call`, so call-back requests never reached the call list.
- Morning Call List would re-add the same lead daily → now marks `queued`.
- Agents 2 and 3 were **live in test mode** (minute gaps) — published versions differ from drafts; always check the published version, not just the draft.
- The 4a "draft" filter vanished (likely an editor tab saved over an MCP edit) and the `Campaigns!A1` header was overwritten in the Sheet.

## Open before go-live
Publish in order (Sync → 2 → 1 → 3 → 4a → 4b → 5 → Morning Call List → KB Loader with Basic Auth) · Veblika webhook to Agent 1 production URL ·
Postgres chat memory instead of Simple Memory · dealer facts in the knowledge base · decide who creates `appointments` rows (advisor in Supabase, or a Sheet → Supabase write-back — not built).

Related: [[whatsapp-lead-sop-8-stage]], [[lead-stages-pipeline]], [[n8n-lessons-whatsapp-agent-team]].
