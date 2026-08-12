---
title: Training — Lesson 11 (WhatsApp Flow Mastery)
created: 2026-08-12
tags: [training, whatsapp, flow-builder, webhook, knowledge]
source: Class 11 recording — "WhatsApp Flow Mastery: From Form Submission to Auto-Assignment" (23:14)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 11 (WhatsApp Flow Mastery)

Where the WhatsApp Form built in [[training-lesson-7-whatsapp-forms]] and sent in [[training-lesson-9-welcome-to-appointment-booking]] finally writes itself into the CRM. Follows [[training-lesson-10-lead-capturing-management]]; position in the course at [[whatsapp-course-curriculum-map]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported`.

## Why this lesson is a platform shift, not just a new topic

Every prior chatbot lesson (8, 9, 10) used BizAutomation's **Chatbot-V2 builder** — guided nodes, a visual trigger/action canvas. This lesson moves into a **separate Flow Builder**, driven by a raw webhook rather than a chatbot trigger. Full mechanics → [[whatsapp-flow-builder-webhook-reference]].

## What gets built, in one line each

1. A webhook trigger connected to the WhatsApp number, tested live to see the raw JSON event shape.
2. A Condition node filtering for form submissions specifically — `content.interactiveType` equal to the literal string `nfm_reply`.
3. An Update Contact node writing the form's captured fields into the CRM, matched by phone number.
4. A Router node splitting into Gurgaon / Delhi / Noida branches, each ending in a different named employee via Auto Assign Contact.

This closes a gap left open at the end of Class 10: Class 10 assigned employees by manually writing to an Employee **column**; this lesson does it through a dedicated **Auto Assign Contact** action, one per branch.

## The live error, kept in deliberately

Testing the Delhi branch surfaced a real **"Execution step not found"** error. The trainer diagnosed it on screen — a later branch had been left with a mapping the earlier branch didn't need — and fixed it live rather than editing the moment out.

**Why this belongs in the note, not just the document:** it's the second live debugging moment across this series (the first was Class 9's keyword mismatch). Both are worth citing to clients directly — automation is built, tested and debugged, not deployed once and trusted blind.

## The decision worth flagging in every future flow build

Before Update Contact runs, the trainer raises a question that's easy to skip past: **does this update an existing contact, or silently create a duplicate?** The platform makes this configurable. Getting it wrong either loses a returning lead's history or clutters the contact list with duplicates. Worth a standing checklist item whenever building a new capture flow → see [[crm-and-field-model]].

## Note on sources

As with prior lessons, neither the Veblika knowledge-base document nor veblika.com/products/whatsapp-automation covers this material. The video is the sole source.

## Capture note

The user supplied a tentative outline with its own timestamps for this lesson. Per instruction, only the outline's **content and sequence** were used as guidance — every timestamp in the delivered document was taken from the actual transcript.

Related: [[whatsapp-flow-builder-webhook-reference]], [[training-lesson-10-lead-capturing-management]], [[automation-trigger-and-action]]
