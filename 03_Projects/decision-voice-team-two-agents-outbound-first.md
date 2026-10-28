---
title: "Decision: voice team = two agents (outbound call-back first, inbound receptionist second)"
created: 2026-10-28
tags: [decision, voice-agent, sarvam, renault]
source: Claude Code session 2026-10-27/28 (Yogesh asked "1 or 2 voice agents?"; recommendation accepted when folders were created)
origin: ai
author: claude-code
maturity: emerging
---

# Decision: two voice agents, outbound first

#decision — for [[ai-voice-calling-agents-sarvam]].

- **Two agents, one shared instruction core and knowledge base.** Outbound starts with context and one goal (book or confirm);
  inbound starts cold and must first find out what the caller wants. Two simple single-goal agents test and improve more easily than one branching agent
  (Sarvam's own prompt guidance: one goal per agent, start single-state).
- **Outbound (V1) first:** consent-based (only people who asked, or have an appointment), easiest to demo, lowest legal risk.
  Its work list already exists — the Morning Call List writes `call_queue`.
- **Inbound (V2) second:** needs the dealer's number forwarded / a new number.
- **No cold or promotional calling** (TRAI number-series and consent rules; Sarvam says compliance is the customer's responsibility).
- Voice is a **second channel**, not a 6th agent in the WhatsApp chain: it reads/writes the same Hub fields (`next_action`, `appointments`, `activity`).
