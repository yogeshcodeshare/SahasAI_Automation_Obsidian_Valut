---
title: Renault WhatsApp AI agent — Veblika version (all lanes built)
created: 2026-10-18
tags: [project, whatsapp, veblika, n8n, rag, renault]
source: Claude Code build session 2026-10-17/18; local WORKFLOW-README.md and build guide in "What's App Automation/Renault Service WhatsApp AI Agent - Veblika"
origin: ai
author: claude-code
maturity: supported
---

# Renault WhatsApp AI agent — Veblika version

The Renault service agent rebuilt on **Veblika** (WhatsApp partner CRM) instead of a Meta trigger, so chats stay in the Veblika inbox. n8n workflow **Renault WhatsApp Agent (Veblika)** (`v5MgQoTpgXsaYzvR`, Test folder). All lanes built and tested 2026-10-18; **not yet published**. Sister of [[renault-whatsapp-rag-agent-meta]].

## Shape
Webhook → **Message fields** (Set: flattens Veblika `body.data.*` into from / phoneNumberId / messageId / type / text / mediaId / mimeType / filename) → **Only real messages** (Filter: event = message-received + messageId + sender) → **Route by Message Type** → four lanes → one **AI Agent** → Veblika reply.
- **Text** → agent directly.
- **Media** (image OR audio OR video) → WhatsApp node "Download media" (mediaUrlGet, Meta permanent token) → HTTP download as File → Media Type switch → Claude Haiku image description / Whisper voice / Whisper video (sound only, ≤25 MB) → Set … Text.
- **File** → same download → File Type switch on mimeType → PDF: Extract From File · Word: OpenAI gpt-4.1-mini with file input → Set … Text.
- **Unsupported** (both switches' fallbacks) → one Set node writing field `output` → its own Veblika send. No AI cost.
- Agent: Claude Haiku 4.5, Simple Memory keyed on Message fields → from (window 10), Supabase KB tool (`documents` / `match_documents`, text-embedding-3-small 1536).
- Reply: HTTP POST `crm.bizautomation.cloud/api/v2/whatsapp-business/messages`, Bearer credential locked to that domain, body built with `JSON.stringify`.

Field map: [[veblika-webhook-message-received-payload]].

## Decisions
- **One agent + per-lane instructions** in the Set nodes (not one agent per media type) — one prompt, one memory; lanes still tell the agent how far to trust the input (voice: Marathi may be mis-transcribed, confirm key details; video: picture not seen, ask for a photo).
- **Clean fields → filter → switch**, sort files by WhatsApp's `mimeType`, not the file name.
- Media still downloads with the **Meta permanent token** — works for the Veblika-partner number; replace if Veblika ships a get-media API.

## Lessons (reusable)
- Meta media links expire in ~5 min; an expired link returns **401 Authorization failed**, same as a bad token. Test download nodes together with the URL node.
- n8n Anthropic Analyze Image needs **Input Type = Binary**; with "Image URL" and an empty field Claude says it sees no image.
- After a download, `$json` holds only file details — read type / mimeType from `$('Message fields')`.
- Switch "+ Add condition" inside a rule was hidden in this n8n build; workaround: add via MCP or one *matches regex* condition.
- Whisper Marathi accuracy ~60–70 %; option to try: transcription language `mr` (hurts Hindi).
- The reference snapshot `vYYs9aAzO53rc1E3` is mostly empty placeholder nodes — study only.

## Open before go-live
Unpin test data (Read PDF / Set PDF Text) · Veblika: only `message-received` · production webhook URL + publish · Postgres chat memory · error-workflow alert · dealer details into the KB · final test of all types.

## Where the detail lives (local, not in the vault)
WORKFLOW-README.md (full node-by-node reference for any AI), build guide PDF (40 pages), client overview PDF (13 pages), Prompts-and-Code docx P1–P29, AI-Agent-System-Prompt-Akshay.txt.
