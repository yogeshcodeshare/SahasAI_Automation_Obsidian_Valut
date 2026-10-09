---
title: Decision — the Email AI Agent never sends; replies are drafts only
created: 2026-10-09
tags: [decision, email-ai-agent, ai-safety]
source: Claude Code session 2026-10-08 (problem statements + design rules approved by Yogesh)
origin: ai
author: claude-code
maturity: supported
status: active
---

# Decision — drafts only, never auto-send

## Decision
Every AI reply is a **Gmail draft** in the right thread, addressed to the sender, that the owner checks and sends. No auto-send by default; Deadline & Legal and Suspicious emails never get an AI draft. Unsure emails go to **Needs Review**. The sorting AI has **no tools**, and text inside an email is never treated as an instruction.

## Context
Research (see [[email-overload-problem-research]]): founders don't trust AI to reply on their behalf; a reviewer found an AI tool's auto-drafts accepting a sales pitch; an AI support agent invented a company policy and customers cancelled; hidden text in an email tricked Gmail's AI summary. Nate's videos auto-send support replies — we chose not to.

## Alternatives rejected
- **Auto-send for routine categories** — too risky for v1; may be offered later per client, per category, after a track record.
- **No drafts, labels only** — loses the biggest time saving.

## Depends on
- [[email-ai-agent]]
- Assumption: owners will check drafts within hours; the phone alert covers urgent ones.

## Review trigger
A client asks for auto-send on a narrow category after ≥ 30 days with ≥ 90% drafts sent unedited.
