---
title: Instant call-back — WhatsApp "call me" makes the voice agent ring within minutes
created: 2026-11-07
tags: [project, voice-agent, whatsapp, n8n, renault]
source: Claude Code session 2026-11-05/07 (Yogesh asked for a call within 5–15 minutes of a WhatsApp request)
origin: ai
author: claude-code
maturity: emerging
---

# Instant call-back from WhatsApp (V-0)

Part of [[ai-voice-calling-agents-sarvam]] and [[whatsapp-agent-team-renault]]. Built 2026-11-07, logic-tested with pinned data; not live until the Sarvam number exists.

## What it does
1. Customer on WhatsApp says "talk to a person" / "call me" (even urgently).
2. Akshay (Agent 1) asks once: "Shall our team call you on this number in a few minutes?" — only a clear **yes** continues.
3. Akshay calls a new tool (`request_call_back`) that runs n8n workflow **V-0 Instant Call-back**.
4. V-0 checks: not opted out of calls · no instant call in the last **2 hours** · time **8 AM–10 PM IST** · config filled.
5. OK → starts the Sarvam call with V1 Anjali straight away (phone rings in ~1–2 min). Not OK → tells Akshay what to say, and after hours puts the lead on the morning call list.
6. After the call, the normal result flow (V-2) saves it and sends the advisor alert + customer summary.

## Context handed to Anjali
The lead summary + the **last 12 WhatsApp messages** (customer and Akshay, oldest first, ~1,400 characters) + Akshay's one-line note of what the customer wants now. The call reason tells her to continue from the chat and not make the customer repeat.

## Design choices
- Separate from the morning call list: the list is for next-day calls; this is for "now".
- Calls at night only because the customer explicitly asked at that moment; never automatic.
- After 8 PM nobody can be transferred to a person — Anjali takes details and the advisor follows up.

## Depends on
Sarvam number onboarded on the Vobiz connection, V-0 + Agent 1 published, the shared webhook key filled in V-0, V-1 and V-2.
