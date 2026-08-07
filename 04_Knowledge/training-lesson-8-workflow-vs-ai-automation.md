---
title: Training — Lesson 8 (Workflow Automation vs AI Automation)
created: 2026-08-07
tags: [training, whatsapp, automation, ai, knowledge]
source: Class 8 recording — "Workflow Automation vs AI Automation in WhatsApp" (50:59 as captured)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 8 (Workflow Automation vs AI Automation)

The conceptual spine of the WhatsApp module. Follows [[training-lesson-7-whatsapp-forms]]; position in the course at [[whatsapp-course-curriculum-map]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported`.

## Why this lesson matters more than the others

Every earlier lesson taught a component — templates, contacts, tags, teams, forms, catalogs. **This one explains the machinery that makes those components fire on their own**, and draws the distinction the whole course rests on.

It splits cleanly in two:
- **First half, whiteboard only** — the mental model, no software at all.
- **Second half, live builder** — every trigger and all sixteen actions in BizAutomation's Chatbot-V2.

## The distinction, in his own words

```
WF  ->  Set / Defined Queries
AI  ->  Dynamic Queries
```

- **Workflow automation** — things are *defined*. You configured every path in advance. It does exactly that, every time, and will not improvise.
- **AI automation** — *dynamic*. It handles what you could not enumerate in advance.

**The deciding rule he states twice:** where workflow automation can be set up, AI is not needed. AI belongs where workflow automation cannot reach. This sharpens the whiteboard model in [[sop-automation-ai-progression]] — that note gives the *order*, this gives the *boundary*.

## Where the defined workflow runs out

He is honest about the limit rather than selling past it. You can put four, five, maybe ten options on a menu. You cannot put fifty. But a customer can ask anything — his examples: *"we are three people"*, *"will two children need a second room"*. That gap is the entire commercial case for AI.

## The commercial argument worth reusing

- Answer roughly **90% of a customer's questions immediately** and there is a far greater chance the booking is yours.
- They arrive having already inquired in three or four places and got no answer.
- They are interested **now** — elsewhere someone might call back in two days.
- His phrase: *that person is hooked to your company because of your prompt response*.

## Sequencing — the sales argument

He recommends explicitly: complete WhatsApp automation first, get real expertise, implement it in your own business, *then* sell it to clients. His framing — **WhatsApp automation is the single best entry point to get into AI automation**.

This is the same sequencing argument as [[sop-automation-ai-progression]], arriving from the other direction, and it is directly usable on a sales call → [[whatsapp-automation-deliverables]].

## What the lesson covers

- **Trigger and action** — universal across every builder → [[automation-trigger-and-action]]
- **The five AI-bot components** → [[ai-agent-five-components]]
- **All 16 builder nodes, with limits** → [[whatsapp-chatbot-builder-reference]]

## Free data on first contact

Whenever anyone messages a WhatsApp API number, WhatsApp supplies **their name and mobile number automatically** — no form, no question. Usable in the very first automated reply. The mobile number is also the memory key (see [[ai-agent-five-components]]), which makes it the primary key of the whole conversation model.

## A graceful failure is a designed response

Even when the AI cannot answer, it should answer well — *"I am not the right person for this, I will transfer your query to our expert"*. A handoff is a designed outcome, not a failure. The bot's job includes knowing its own limits.

## Capture note

The recording as supplied runs **50:59**; the original session was approximately **1:03:41**, so the capture is encoded at roughly **1.25×**. Divide original timestamps by ~1.25 to locate them here. Verified against the on-screen clock at three points. **No content is missing** — the recording runs from opening recap to closing sign-off.

## Note on sources

As with Classes 6 and 7, neither the Veblika knowledge-base document nor veblika.com/products/whatsapp-automation covers this material. The video is the sole source.

## What is deferred to later classes

- Building a complete flow end to end — next class.
- Webhooks and APIs — promised a dedicated class.
- Detailed AI agent training and prompt engineering — a separate programme.
- The flow builder's **router**, which handles multi-way branching better than chained true/false conditions.
