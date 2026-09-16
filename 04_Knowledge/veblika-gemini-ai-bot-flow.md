---
title: Veblika's Documented AI Bot Flow (Gemini)
created: 2026-09-16
tags: [whatsapp, veblika, bizautomation, ai, agents, reference, knowledge]
source: "Document/veblika knowledge base.pdf — 'Create AI Bot Using Gemini', page stamped 4 August 2025"
origin: ai
author: claude-code
maturity: supported
---

# Veblika's Documented AI Bot Flow (Gemini)

The vendor's own five-node recipe for an AI bot inside the Flow Builder. Worth recording separately because it is the only *platform-native* AI pattern on file — everything else we hold is either conceptual ([[ai-agent-five-components]]) or an external n8n build.

## The five nodes, in order

| # | Node | Job | Configuration the KB names |
|---|---|---|---|
| 1 | **Text Message Received** (WhatsApp trigger) | Start on an inbound WhatsApp message | Select the WhatsApp account/number |
| 2 | **Get Value** | Fetch what is already stored about this person | Choose the key from the incoming message (user ID / phone number); map it to a data variable or database source |
| 3 | **Generate Content** (AI text generator) | Compose the reply | Input = incoming message text + the fetched value. The KB's own prompt shape: `User said: {{message}}, based on context: {{value}}. Reply accordingly.` |
| 4 | **Send Message** (WhatsApp) | Return the reply | Recipient number set dynamically from the trigger; body = the generated text |
| 5 | **Set Value** | Save the updated context for next time | Key = user ID / phone number, Value = new context or conversation history |

## What this actually is

Get Value → Generate Content → Set Value is **memory implemented by hand**. There is no managed conversation buffer here; the flow reads a stored blob keyed by phone number, hands it to the model as context, and writes the updated blob back. That is the same identity-key mechanism described in [[ai-agent-five-components]] — the mobile number anchors the memory — but built from primitives rather than provided.

Mapped onto the five components:

- **System prompt** — not a node. It lives inside Generate Content's prompt, alongside the user message. The KB's example prompt carries no role, guardrails or escalation rule at all.
- **User message** — the trigger's message text.
- **Memory** — Get Value / Set Value, keyed by phone.
- **Knowledge base** — **absent from this recipe.** Nothing retrieves reference material.
- **Tools** — **absent.** The flow can reply; it cannot act in another system.

## Where it fits for Sahas AI, and where it does not

Useful as the native fallback if an AI reply is ever needed inside Veblika without standing up n8n. But judged against the hard sequence SOP → deterministic automation → AI ([[sop-automation-ai-progression]], [[training-lesson-8-workflow-vs-ai-automation]]), this recipe is the wrong starting point for the current build:

- The Sahas AI qualification journey is enumerable — business type, problem list, timeline, slot. That is Chatbot-V2 and a Form, not a generative reply.
- With no knowledge-base node and no tools, the pattern can only talk. It cannot book, update a contact, or hand off.
- A prompt of the KB's shape has no guardrail against the model inventing pricing, scope or a commitment. Any real use needs the role/goal/guardrail/escalation structure in [[ai-agent-five-components]] and an explicit handoff rule.

**Do not put pricing, plan scope, client data or credentials into the stored context or the prompt.** The stored value is conversation state keyed to a person's phone number.

## Compare: the n8n pattern already on file

`Document/N8N AI WA VEBLIKA BOT.json` does the same job with eight nodes — Webhook → AI Agent (LangChain) + OpenRouter chat model + Simple Memory (buffer window) → Switch → Set/Edit Fields. It gets a managed memory buffer and intent routing that this five-node version does not, at the cost of running n8n. Which route to use is a Phase 1b decision, not settled here.

Related: [[ai-agent-five-components]], [[sop-automation-ai-progression]], [[whatsapp-flow-builder-webhook-reference]], [[veblika-platform-admin-reference]]
