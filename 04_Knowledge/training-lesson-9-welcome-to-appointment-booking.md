---
title: Training — Lesson 9 (Welcome Message to Appointment Booking)
created: 2026-08-12
tags: [training, whatsapp, chatbot, knowledge]
source: Class 9 recording — "From Welcome Message to Appointment Booking WhatsApp Chatbot Design" (1:07:10)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 9 (Welcome Message to Appointment Booking)

Where Class 8's trigger/action theory becomes a real, working chatbot. Follows [[training-lesson-8-workflow-vs-ai-automation]]; position in the course at [[whatsapp-course-curriculum-map]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported`.

## What this lesson actually is

A single continuous build, live in BizAutomation's Chatbot-V2 builder, for a real estate business: welcome message → five-option menu → project browsing → appointment booking → testimonials → a cloned project-specific flow. Tested twice on a real phone, including one genuine live debugging moment (a keyword mismatch between a parent and child flow) that the trainer works through on screen rather than editing out.

## The one idea worth taking first

Before any of the build, the lesson names two structural approaches every WhatsApp flow uses — full treatment at [[lead-capture-option1-vs-option2]]. Everything built in this class is one worked example of Option 1 (showcase first, capture second).

## What else the lesson covers

- **Free vs paid messaging**, restated precisely: list/button/media/plain-text messages are always free; Utility templates are free even after approval; only Marketing templates cost per send.
- **Node naming and flow numbering as compounding discipline** — the trainer's own stated threshold: doesn't matter with 3-4 flows, matters enormously past 50 templates / 70-80 workflows.
- **Independent, reusable sub-flows** — build a project-specific flow once, call it from the parent flow AND trigger it independently by its own keyword, so an ad or social post can skip straight to it.
- **List vs button message behaviour** — a list allows re-selecting a different option later; a button group, once one option fires, does not re-trigger on a different button from the same set.
- **Real appointment booking**, via a third-party scheduling tool → [[appointment-booking-via-ghl]].
- **A testimonial carousel template**, with the trainer's position that only video testimonials carry real weight today → appended to [[whatsapp-template-anatomy]].

## The live debugging moment, worth keeping deliberately

Near the end, testing the parent and child flows together, the trainer notices their content is cross-linking incorrectly. Rather than cutting it, he diagnoses it on screen: the parent flow's keyword reference to the child flow didn't match the child's trigger keyword character-for-character. Once matched, it resolves immediately.

**Why this is worth citing in client work:** a keyword mismatch between a parent and child flow is the first thing to check whenever two flows' content appears to cross unexpectedly. It is also a legitimate thing to show a client mid-build — automation is built, tested and debugged, not deployed once and trusted blind.

## Capture note

This lesson's audio required a chunked transcription pass — one chunk repeatedly failed against the transcription service and was recovered by re-splitting it into smaller pieces. The transcript used for this document is complete: 677 segments across the full 1:07:10 recording, verified with no gaps at the point of the earlier failure.

## Note on sources

As with prior lessons, neither the Veblika knowledge-base document nor veblika.com/products/whatsapp-automation covers this material. The video is the sole source.

Related: [[lead-capture-option1-vs-option2]], [[appointment-booking-via-ghl]], [[whatsapp-template-anatomy]], [[whatsapp-chatbot-builder-reference]]
