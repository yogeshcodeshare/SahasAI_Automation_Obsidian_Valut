---
title: "Decision: accident/breakdown calls are never told 'the advisor calls tomorrow at 10 AM'"
created: 2026-11-05
tags: [decision, voice-agent, sarvam, renault, safety]
source: Claude Code session 2026-11-05 — Yogesh's second test call (accident near Karad at 8:30 PM) and his objection
origin: ai
author: claude-code
maturity: supported
status: active
---

# Decision: emergencies are never pushed to the next morning

#decision — for [[ai-voice-calling-agents-sarvam]] (V1 now, V2 inbound when built).

## Decision
For an accident, breakdown or stuck car, the voice agent treats the call as urgent at any hour and any day: it never says the advisor will call "tomorrow at 10 AM".

## Context
The first version of the after-hours rule (written for normal service requests) made Anjali tell an accident customer at 8:30 PM that the advisor would call next morning at 10. Yogesh pointed out that "what do we do here all night?" is the real problem. The same call also showed the agent promising things no system does (sending the location to Renault Assist; sending Renault Assist information on WhatsApp).

## Rule now in the prompt
1. Ask if everyone is safe. 2. Ask the exact location (place, road, landmark) and repeat it back once. 3. Search the knowledge base for the Renault Assist roadside number and read it slowly if found. 4. Say the service advisor has been **alerted right now on WhatsApp** (true: n8n V-2 sends the alert at call end). 5. Never claim to send anything to Renault Assist herself. 6. If no number is found, say so honestly and point to the Renault Assist option in the MyRenault app or the owner manual. 7. WhatsApp to the customer carries only a short call summary.

## Alternatives rejected
- **Keep "advisor calls next day 10 AM" for after-hours** — rejected: wrong for emergencies.
- **Promise "Renault Assist is informed"** — rejected: no tool does it; the only real action is the advisor alert.

## Depends on
- [[ai-voice-calling-agents-sarvam]] — V-2 sends `voice_call_alert` (title "Breakdown - urgent") and sets `next_action = call` for `breakdown_help`.
- Assumption: the dealer's real Renault Assist roadside number is loaded in the knowledge base (still the placeholder on 2026-11-05).
- Assumption: someone watches the advisor WhatsApp at night — a night contact / duty manager is still undecided.

## Consequences
The agent can only give a safe, honest next step; a real 24×7 escalation needs the roadside number in the knowledge base and a night contact.

## Review trigger
Dealer provides the roadside number or a night duty contact; or a real emergency call shows a gap.
