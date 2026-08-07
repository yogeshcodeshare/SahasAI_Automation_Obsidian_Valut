---
title: Training — Lesson 4 (Compliance, Tagging & Contact Management)
created: 2026-08-06
updated: 2026-08-06
tags: [training, whatsapp, tagging, crm, compliance, knowledge]
source: Class 4 recording — "WhatsApp Marketing Compliance, Tagging & Contact Management" (39:03)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 4 (Compliance, Tagging & Contact Management)

The session where theory becomes software. First half covers Meta's rules on business messaging; second half builds tagging, opt-in/opt-out, contact management and filtering. Follows [[training-lesson-3-sop-crm-logic]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported` — promote individual claims only once they have worked on a real client.

Demonstrated on **BizAutomation** (`app.bizautomation.io`), the platform white-labelled and resold as Veblika — see [[bizautomation-reseller-deal]] and [[whatsapp-automation-vendors]]. The trainer is explicit that any WhatsApp Business API provider works; the concepts are platform-independent, only the button positions differ.

## The core distinction of the class

A **custom field** tells you *what data you hold* about a lead. A **tag** lets you open the Inbox and read the *live conversations* with every lead at a given stage. The Inbox filters by tag, not by custom field — so you need both, and they are not interchangeable.

If you only want a count of how many leads sit at a stage, the field is enough. If you want to see what your team is saying to those leads right now, only the tag delivers it. → [[whatsapp-tag-numbering-convention]]

## What was covered

- **Business App vs Business API** — the free app only delivers a broadcast if the recipient has already saved your number, with no error when they have not. The API removes that condition entirely. This is the most common reason people conclude WhatsApp broadcasting "does not work".
- **Marketing frequency capping**, marketing vs utility messages, expected failure rates → [[whatsapp-marketing-capping-and-deliverability]]
- **Tagging every pipeline stage**, numbered so it sorts in pipeline order → [[whatsapp-tag-numbering-convention]]; the stages themselves are in [[lead-stages-pipeline]]
- **Opt-in / opt-out keywords** and automatic exclusion from broadcasts
- **Contact creation** against the custom fields defined in [[crm-and-field-model]]
- **AND/OR segmentation**, bulk actions and CSV import → [[bizautomation-contact-filtering-and-import]]
- **Notes and reminders**, and the claim that a small team may not need a separate CRM at all
- **Never cold-broadcast** → [[whatsapp-number-safety-warm-up]]

## Automation vs AI

Rule-based automation is predictable by design — it does exactly what you configured, every time. AI carries roughly 2–10% variability in exchange for handling what you cannot enumerate in advance. The trainer draws this as a whiteboard progression — **SOP → Automation → AI** → [[sop-automation-ai-progression]]. The deciding question: if you know every possible input, automate; if you do not (an open-ended chatbot), use AI. Understand the process manually first — you cannot automate what you do not yet understand.

## Rule the trainer repeated three times

Every stage in your pipeline **must exist as a tag**. Keeping stages as a custom field as well is optional on this platform. On a platform without tagging, stages must go into custom attributes instead, or leads cannot be filtered by stage at all.

## Homework set

Create dummy contacts and work them in the Inbox · update custom fields from both sides and confirm they stay in sync · create notes · add the team under Settings → Team, including both front-end and back-end staff because task-management automation depends on it · create the numbered stage tags.

Next lesson: WhatsApp Templates and WhatsApp Forms.

## Course context

Lesson 4 of a 12-lesson module. Assumes lesson 3; depends on lesson 5 for the templates every broadcast here sends. Full arc, platform and the 39:03-vs-50:38 recording caveat in [[whatsapp-course-curriculum-map]].
