---
title: WhatsApp Forms Are Portable JSON
created: 2026-08-07
tags: [whatsapp, forms, agency, reuse, knowledge]
source: Class 7 recording — demonstrated live
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Forms Are Portable JSON

Every published WhatsApp form can be exported as JSON and pasted into any other account, where an identical form appears. Demonstrated live in Class 7 — export from Meta, import into the platform, preview, and it copied exactly.

## The mechanism

- Download or copy the JSON from WhatsApp Manager (or the Playground).
- In the platform: **Import JSON** → "Create Form from JSON" → paste → the dialog validates it (**"Valid JSON format ✓"**) → Create Form.
- Malformed JSON fails at the validator rather than creating a broken form.
- It works in both directions: pasting JSON back into the Playground reconstructs the form visually.

The JSON carries everything — screens, field types, dropdown option lists, the footer button label, the navigate action, and the payload bindings like `${form.your_name_01}`.

## Why this matters for Sahas AI

The trainer's stated use case is copy-pasting forms across **duplicate accounts and client sub-accounts**. For an agency that is the difference between building a lead-capture form once and rebuilding it for every client.

**The practice worth adopting:** build a standard form library once, keep the JSON, deploy per client in seconds.

Candidate forms, all of which already have their field sets defined:

| Form | Field set already defined in |
|---|---|
| Agency lead capture | [[agency-intake-form]] |
| Coaching lead capture | [[coaching-intake-form]] |
| Client onboarding | [[client-onboarding-brief]] |
| Appointment booking | Date Picker + fixed-slot Dropdown → [[whatsapp-forms-builder-reference]] |

This closes a loop: those notes specify *what to ask*; the form builder is *how to ask it inside WhatsApp*; and the JSON is what makes it reusable across every client.

## It is also a backup

A form saved as JSON survives an account being rebuilt, a platform migration, or a vendor change. Given the trainer tried several BSPs before settling on one → [[whatsapp-automation-vendors]], keeping the JSON means the forms are not locked to a provider.

## Where to store them

The JSON is configuration, not a secret — no keys, no PII. It can live in the project repo alongside the rest of the WhatsApp offer assets. Worth adding to the deliverables in [[whatsapp-automation-deliverables]].

Related: [[training-lesson-7-whatsapp-forms]]
