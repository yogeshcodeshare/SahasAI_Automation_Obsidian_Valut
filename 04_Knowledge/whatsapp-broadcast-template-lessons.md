---
title: WhatsApp broadcast template lessons (festive campaign)
created: 2026-10-27
tags: [whatsapp, templates, broadcast, veblika]
source: Claude Code session 2026-10-26/27 creating festive_checkup_mr/hi/en and broadcast_alert
origin: ai
author: claude-code
maturity: emerging
---

# WhatsApp broadcast template lessons

Learned while creating the Agent 4 festive templates ([[whatsapp-bulk-broadcast-agent]]).

- **Keep personal parts as variables.** Body says `{{1}}` (first name) and `{{2}}` (car); real values go only in Meta's sample boxes. Pasting a real name into the body sends it to everyone.
- **Never submit placeholder offer text** like `[DEALER — CONFIRM]` — Meta can approve it and every customer sees it. Write only offers the client has confirmed; otherwise use a neutral line ("get the car checked before the festive rush").
- **Stop button text must be exactly `Stop`** — that is what the reply agent's opt-out rule matches.
- One template name per language (`_mr`, `_hi`, `_en`) so n8n can pick by lead language.
- Staff alert templates (e.g. `broadcast_alert`) are Utility, English, no buttons; if one is rejected for starting with a variable, prefix a word.
- Marathi/Hindi bodies: Devanagari with everyday English words (service, slot, book, check-up) in English letters.

Related: [[whatsapp-template-anatomy]], [[whatsapp-template-categories-and-approval]].
