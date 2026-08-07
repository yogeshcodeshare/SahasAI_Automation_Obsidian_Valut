---
title: Trigger and Action (the universal automation grammar)
created: 2026-08-07
tags: [automation, concepts, workflow, knowledge]
source: Class 8 recording — whiteboard, 21:35–25:45
origin: ai
author: claude-code
maturity: supported
---

# Trigger and Action (the universal automation grammar)

The two words you will meet in **every** automation builder — n8n, Make, Zapier, any WhatsApp platform, any CRM. The trainer frames this deliberately as universal knowledge rather than platform knowledge: learn it once and every builder becomes readable.

## The definitions

```
A  ->  B, C, D
```

- **Trigger** — the thing whose happening causes other things to happen. *A*.
- **Actions** — everything that follows as a consequence. *B, C, D*.

The same event can be a trigger in one flow and an action in another (`A, B, C -> D`). It is a role, not a property.

## The structural rule

> **One trigger per flow. Actions can be many.**

The trainer's figure: roughly **90% of systems** allow one trigger per flow. Some allow multiple in one window. Treat one as the safe default assumption rather than a specification — this is his experience, not a documented rule.

## Worked example

**Trigger:** a customer's first message — named `on message` / `on customer message`.

It fires regardless of what they typed: *hi*, *namaste*, *hello*, *howdy*, a four-word sentence, or a question in Hindi. The trigger is the **arrival** of a message, not its content — unless you attach keywords.

**Actions**, all from that single trigger:
- Send the welcome message.
- Send an email.
- Assign the lead to the team member who handles that domain.
- Add the lead to the CRM or a Google Sheet.

## A trigger need not be a customer message

Team assignment can itself be a trigger:

- **Trigger:** a lead is assigned to a team member.
- **Action:** notify that team member, with the lead's details.
- **Action:** notify the customer that an agent has been assigned.

This is the idea that makes internal automation possible, not just customer-facing automation — relevant to the SOP work in [[sop-agent-7-step-method]] and [[whatsapp-lead-sop-8-stage]].

## Why it matters for Sahas AI

Every tool in the stack ([[ai-tools-stack-3-layer]], [[n8n-self-hosting-agency]]) uses this same grammar. A client conversation about "what should happen automatically" is really a conversation about triggers and actions — asking *what starts it* and *what should follow* is usually enough to draft a flow on the spot.

Related: [[training-lesson-8-workflow-vs-ai-automation]], [[whatsapp-chatbot-builder-reference]]
