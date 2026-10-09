---
title: n8n Gmail inbox-agent patterns from five build videos (and their flaws)
created: 2026-10-09
tags: [n8n, gmail, ai-agent, reference, email-ai-agent]
source: five YouTube build videos watched 2026-10-08 (local MP4s + transcripts in the Email AI Agent project folder)
origin: ai
author: claude-code
maturity: supported
---

# n8n Gmail inbox-agent patterns

Reference for [[email-ai-agent]]. Detailed notes and screenshots stay in the project's `research/` folder.

## Base video 1 — "I Built an Inbox AI Agent That Handles Your Emails" (preferred base)
Gmail trigger (Simplify off) → Set (sender_email, sender_name, subject, body, id) → AI Agent classifier with structured output `{label, confidence, reason}` and "uncertain" if confidence < 0.75 → Gmail Get many labels → Aggregate (all items into one list) → Set label ID via `$json.data.find(name == label).id` → Gmail Add label → IF "To respond" → Respond Agent (Claude via OpenRouter) → Gmail Create draft (Subject `RE: …`, option To Email = sender). Retro-run copy: manual trigger → Get many messages (limit 50) → Loop. Cost shown ≈ US$0.003–0.005 to sort, ≈ $0.003 to draft per email.
**Flaws:** prompt says "eight" but lists 9 labels; "uncertain" has no Gmail label → Add label fails; exact-string match; generic reply prompt invites made-up facts; no thread context; no phishing/injection guard.

## Base video 2 — "Clean your Gmail inbox with N8N"
One-time setup: Get many labels → Code "Find missing labels" → Loop → Create label. Live: Gmail trigger → Sheets append `{ID, Status: ready}` (queue); Schedule every 15 s → Sheets get rows Status = ready → Get message → Information Extractor (gpt-4o, temperature 0) scoring 18 influencer sub-categories 0–1 + spamScore, isUrgent, urgencyScore ("beware of scammers convincing you it's urgent") → flatten → If value > 0 → find label ID → Add label → Sheets status done; Switch isUrgent → SMS.
**Flaws:** tags every category above 0 (4–5 labels per email); reads only the snippet; queue rows need a lock; no reply drafts.

## Nate's three videos — extra ideas
Text Classifier node (one branch per category) · different action per category (finance → notify team, high priority → draft + Telegram) · Pinecone knowledge base as an agent tool for factual replies · Gmail Create draft as an agent tool with `$fromAI()` fields and Thread ID · real sender name from the sign-off · log every branch to a sheet · pin data while testing.
**Mistakes to avoid:** "Append n8n attribution" footer; drafts without a recipient (set To Email with Thread ID); "[Your name]" placeholders; markdown in prompts leaking into replies; agents with tools must be **Tools Agent** type; auto-send replies (we keep drafts only — [[decision-email-agent-drafts-only]]).
