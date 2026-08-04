---
title: AI Tools Stack — 3-Layer Model
created: 2026-08-02
tags: [knowledge, ai-tools, n8n, hermes, strategy]
source: Claude planning conversation
origin: ai
author: claude-code
---

# AI Tools Stack — 3-Layer Model

Do NOT collapse these into one tool:

| Job | Tool | Why |
|---|---|---|
| **SELL to clients** (client-critical automations) | **n8n** (self-hosted, free) | Proven, reliable. Never run client work on experimental agents. See [[n8n-self-hosting-agency]]. |
| **BUILD software** (GMB Sarathi, custom tools) | **Claude / opencode** | Model quality matters for code. |
| **YOUR OWN back-office** (research, drafts, reminders) | **Hermes Agent** (optional) | Personal agent on your VPS, persistent memory. |

## Model / brain (underneath everything)
- Automations: **Groq (free)** or **DeepSeek V4 Flash via OpenRouter** ($0.09/M in, $0.18/M out). At this scale ≈ ₹0–300/mo. Token cost is a rounding error — an entire multi-day heavy chat ≈ $0.30.
- Coding: opencode + OpenRouter (~₹500 loaded, DeepSeek Flash) is cheapest; Claude Pro $20/mo for top quality.

## Hermes / Paperclip
- **Hermes** — use for Yogesh's own tasks; NEVER put a client's live automation in it (5 months old, keep client work in n8n; watch VPS resources).
- **Paperclip** — SKIP for now (orchestrates many agents; premature for a solo founder).

## Video / UGC / voiceover — buy NOTHING until a client funds it
When needed: HeyGen Creator $24/mo (avatars), ElevenLabs free 10k chars (best Marathi voice), CapCut free (editing — no separate video-AI needed). UGC actor tools (Creatify $39 / oakgen $9) only when a client pays.

## Canva
GHL has a Canva *integration* (connect your own account), NOT free Canva Pro. Free tier is fine.

## Discipline
Yogesh evaluates many tools. Tool-collecting kills bootstrappers. Stack is decided; everything else waits for a paying client. Ship first. See [[sahas-ai-overview]].
