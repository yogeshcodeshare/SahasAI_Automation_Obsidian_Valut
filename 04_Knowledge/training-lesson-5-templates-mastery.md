---
title: Training — Lesson 5 (WhatsApp Templates Mastery)
created: 2026-08-07
tags: [training, whatsapp, templates, knowledge]
source: Class 5 recording — "WhatsApp Templates Mastery: Text, Media, CTA & Quick Replies" (55:40)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 5 (WhatsApp Templates Mastery)

Where the API stops being a contact database and becomes a channel you can send on. Follows [[training-lesson-4-tagging-contacts-compliance]]; position in the course at [[whatsapp-course-curriculum-map]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported`.

Demonstrated on **BizAutomation** (`app.bizautomation.io`), with DoubleTick shown briefly for a live carousel example.

## The hard constraint everything follows from

**For broadcasting, a template is the only option.** You cannot bulk-send free-form text on the WhatsApp Business API. Every campaign, every proactive notification, every bulk message your business ever sends passes through a template Meta approved in advance.

Two directions: a customer messages you first and you have many options inside the 24-hour window; you message them first and you have exactly one — a template.

## What the lesson covers

- **Anatomy** — header, body, footer, and the four footer actions → [[whatsapp-template-anatomy]]
- **Categories and structures** — marketing/utility/authentication × general/carousel, and the approval loop → [[whatsapp-template-categories-and-approval]]
- **Variables** — fixed text plus `{{1}}` mapped to the custom fields in [[crm-and-field-model]]
- **Media compression** — 1.79 MB → 358 KB, live → [[compress-media-before-upload]]
- **A full live build** — copy drafted in ChatGPT, poster generated in Gemini, buttons configured, submitted, approved, then sent from the Inbox

## The one best practice to carry into client work

**Put a STOP or Unsubscribe among your three quick reply buttons on every marketing template.**

Meta does not require it — the instructor is explicit about that. But a customer who taps your own STOP button costs you one contact, while a customer who blocks or reports you damages the number's quality rating for everybody. It is the same protection as the opt-out keywords in [[whatsapp-marketing-capping-and-deliverability]], reached by a button instead of a typed word, and it belongs in the Sahas AI template standard.

## Tooling observed

ChatGPT for copy · Google Gemini ("Nano Banana") for poster images, recommended specifically because it renders text without errors · iloveimg.com and iLovePDF for compression · Canva for editing. A Jio offer giving 18 months of Gemini Pro free was mentioned.

## What it sets up

Quick replies record a choice today; **next lesson's workflow automation is what makes them act** — tag the contact, move the stage, notify a salesperson. The chain from Class 4's tags through Class 5's buttons to Class 6's workflows is now complete except the workflow itself.

## Course context

Lesson 5 of 12. Note that **lesson 4 depended on this one** — every broadcast demonstrated there sends a template, but templates were not taught until now.
