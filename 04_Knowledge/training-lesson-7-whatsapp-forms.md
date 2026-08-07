---
title: Training — Lesson 7 (Building WhatsApp Forms)
created: 2026-08-07
tags: [training, whatsapp, forms, knowledge]
source: Class 7 recording — "Building WhatsApp Forms with Templates and JSON code" (28:24)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 7 (Building WhatsApp Forms)

The lesson that supplies the missing mechanism. Follows [[training-lesson-6-catalog-payments]]; position in the course at [[whatsapp-course-curriculum-map]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported`.

## Why this closes the loop

Class 3 defined the custom fields. Class 4 built the tags and filters that operate on them. Class 5 taught the templates that carry messages. Class 6 attached a shopfront. **This lesson supplies the thing that actually fills the fields with data** — a form that opens inside WhatsApp, is completed without leaving the chat, and returns structured data into the contact record.

The whole arc is demonstrated end to end in under half an hour: build → publish → attach to a template → send → fill on a phone → read the response.

## What the lesson covers

- **Three build methods** and when to use each → [[whatsapp-forms-builder-reference]]
- **Field types, limits and design rules** — including the appointment-capture pattern
- **JSON export/import**, and why it matters for an agency → [[whatsapp-forms-json-portability]]
- **Attaching a form to a template** — Interactive Action set to Form
- **Reading responses** — Formatted View and Raw JSON

## The three methods

| Method | Image support |
|---|---|
| In-platform builder (BizAutomation) | **No** |
| Meta Flow Playground | Yes |
| WhatsApp Manager | Yes |

The missing image field in the in-platform builder is the only real difference, and it is the reason the Playground exists as a separate recommendation. The trainer discovers it live: *"inside this, image is not there."*

## Two rules that cause rejection

1. Form button text **≤ 20 characters**.
2. A variable can **never** be at the very start or very end of a template body.

Both are stated twice in the class, which is a signal of how often they bite.

## Worth stealing: the bilingual body

The trainer writes the template body in **English and Marathi in the same message**. One approved template serves both audiences — half the approval work, half the maintenance, and it costs body characters rather than money. For an Indian customer base this is a real conversion advantage with no extra configuration.

## Where the data goes

A submission arrives in the chat as a **Form Response** card. Two views:
- **Formatted View** — labelled pairs, for a salesperson reading what the lead said.
- **Raw JSON** with a Copy JSON button — for a system.

The opt-in checkbox stores as a literal `true`, which makes it usable as consent evidence — relevant to the opt-out discipline in [[whatsapp-marketing-capping-and-deliverability]].

The trainer states the purpose plainly: capture leads, and assign them to your team based on what they submitted. Pushing responses into chatbot flows is the next lessons' subject.

## Recap detail worth keeping

Billing thresholds ($10/$15/$20) are set by **how old the number is, how much it has been used, and its rating** → [[whatsapp-api-billing-credit-line]]. A client seeing more frequent card charges usually has a newer number with a lower threshold, not an overcharge.

## Note on sources

As with Class 6, neither the Veblika knowledge-base document nor veblika.com/products/whatsapp-automation covers WhatsApp Forms. The video is the sole source.

## Capture note

Unlike lessons 4–6, this recording runs to the actual sign-off. Every point in the supplied outline is present.
