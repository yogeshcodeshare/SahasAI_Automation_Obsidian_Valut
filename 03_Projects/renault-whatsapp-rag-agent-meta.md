---
title: Renault Service WhatsApp AI Agent + RAG (Meta Cloud build)
created: 2026-10-17
tags: [project, whatsapp, meta, n8n, rag, supabase, renault, ai-agent]
source: Claude Code sessions 2026-10-13 → 2026-10-17 with Yogesh; n8n workflow "WhatsApp AI Agent + RAG - Meta Cloud"
origin: ai
author: claude-code
maturity: supported
---

# Renault Service WhatsApp AI Agent + RAG (Meta Cloud build)

Demo WhatsApp customer-support agent ("Akshay") for a Renault dealership / service centre, built in n8n on the **Meta WhatsApp Cloud API** with a **Supabase RAG knowledge base**. Follows the same pattern as [[renault-telegram-assistant]]. Next step is the same agent on Veblika — see [[veblika-webhook-message-received-payload]].

## Status (2026-10-17)
- **Tested end-to-end on the real number:** text, image (Claude describe), voice note (Whisper) → agent reply on WhatsApp. RAG ingestion tested (20 chunks in Supabase).
- **Built, not yet tested end-to-end:** PDF lane, Word lane, unsupported-file reply.
- **Open fixes before publishing:** (1) the Word-text Set node still had a placeholder for the OpenAI output field; (2) Meta status receipts (sent/delivered/read) have no `messages[0]` and now fall into the Switch fallback → add a Filter "messages[0].id exists" right after the trigger.

## Architecture
WhatsApp Trigger → Switch on `messages[0].type`:
- **Audio** → WhatsApp "Download media" → HTTP (File) → OpenAI Whisper → text
- **Text** → straight to agent
- **Image** → Download → Claude Haiku image analysis (+ caption) → text
- **Document** → Download → Switch on `mime_type`: **PDF** = Extract from File; **Word** (`contains "word"`) = OpenAI "Message a Model" with a File (File Data) input — n8n's Extract from File cannot read .docx; **else** → unsupported reply
- **Fallback** (stickers, location, contacts) → formatted "I can read text, photos, voice notes, PDF and Word" reply
→ AI Agent (Claude Haiku 4.5, Simple Memory keyed by sender, window 10) with a **Supabase Vector Store tool (retrieve-as-tool)** → WhatsApp Send.

## Knowledge base (RAG)
- Supabase project with pgvector: table `documents` (content, metadata, `embedding vector(1536)`) + `match_documents` function; RLS enabled (n8n uses the service_role key, which bypasses RLS).
- Ingestion (manual trigger, same canvas, disabled by default): KB text → Default Data Loader → Recursive Character Text Splitter (1000 / 150, markdown) → OpenAI `text-embedding-3-small` @ 1536 → Supabase insert. Re-running inserts duplicates — `truncate table documents;` first.
- Embedding model and dimension must match on ingestion and on the agent's retrieval tool.
- Content: Renault India service facts (3-yr/1,00,000 km warranty from Jan 2025, Renault Secure extended plans, Renault Assist RSA + anti-fraud note, Easy Care, service intervals) plus **[DEALER — CONFIRM]** placeholders. Local file: `Renault Service WhatsApp AI Agent - Meta\Renault-Service-KB.md`.
- The "Vector Store Question Answer" tool was considered and rejected: double LLM call and bypasses the agent's prompt rules.

## Decisions & lessons
- Prompt: single-language reply matching the customer's latest message; never mix Hindi and Marathi (Haiku drifted when the rule was loose); answer service facts only from the KB; say "request submitted", never "appointment confirmed".
- Meta setup lessons → [[meta-whatsapp-cloud-app-live-and-waba-subscription]].
- Video lane not built: WhatsApp video needs audio extraction; plan is Gemini video analyse later.

Related: [[car-dealership-whatsapp-n8n-automation]], [[whatsapp-sahas-ai-current-build-brief]], [[n8n-lessons-resume-screener]].
