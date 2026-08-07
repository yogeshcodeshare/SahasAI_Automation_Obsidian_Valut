---
title: WhatsApp Forms — Builder Reference
created: 2026-08-07
tags: [whatsapp, forms, reference, how-to, knowledge]
source: Class 7 recording — Building WhatsApp Forms
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Forms — Builder Reference

A form opens **inside WhatsApp** — the customer never leaves the chat, never sees a browser. That is why it converts better than a link to a landing page.

Structurally it is a **flow**: multiple screens, each holding fields, with a Continue button between them.

## Three places to build one

| Method | Where | Image support | Use when |
|---|---|---|---|
| In-platform builder | BizAutomation → Manage → Whatsapp Forms | **No** | Easiest — and you need no image |
| **Meta Flow Playground** | `developers.facebook.com/docs/whatsapp/flows/playground/` | **Yes** | You need an image, or the fullest editor |
| WhatsApp Manager | business.facebook.com → WhatsApp Manager → Flows | Yes | Your platform has no form builder (e.g. DoubleTick) |

All three produce the same thing. Build → publish → sync → attach to a template.

## Field types

| Group | Fields |
|---|---|
| Text (display only) | Large Heading · Small Heading · Caption Text · Body Text |
| Text Answer | Short Answer · Paragraph · Date Picker |
| Selection | Single Choice · Multiple Choice · Dropdown · Opt-in |
| Media | **Image — Playground / Manager only** |

**Short Answer does real validation.** Setting its Input Type to Email prompts "Enter your email" *and* checks the value is an email. Phone behaves the same. That is validation you would otherwise do by hand on every submission.

## Limits

| Item | Limit |
|---|---|
| Form button text (on the template) | **20 characters** |
| Text Input label | 20 |
| Single Choice label / option text | 30 |
| Opt-in label | 300 |
| Field instructions | 80 |
| Screen title | 60 |
| Screens per flow | 8 |
| Dropdown options | 30 |
| Form image | **300 KB**, JPEG/PNG only |

> The 300 KB image limit is far tighter than anywhere else (carousel cards 5 MB, headers ~14 MB). Compress first → [[compress-media-before-upload]].

## Design rules from the class

- **Single Choice vs Dropdown:** up to ~8 options use Single Choice so everything is visible; beyond that use a Dropdown. 27 Indian states → dropdown.
- **Capturing an appointment:** Date Picker for the date, Dropdown for the time. Time cannot be free-form — you offer fixed slots (10:00, 10:30, 11:00…), which means **your form encodes your actual availability**.
- **Split across screens.** Basic details on one, business details on the next. Avoids an intimidating single page.
- The flow **name** is internal; the **Screen Title** is what the customer sees.

## Two rules that cause rejection

1. **Form button text must be ≤ 20 characters.** "Signup for WhatsApp API" fails; "Sign up for API" passes. (Note: Class 5 recorded 25 for CTA buttons — treat 20 as the safe limit for form buttons → [[whatsapp-template-anatomy]].)
2. **A variable can never sit at the very start or very end of a template body.** It needs text on both sides. Fix by adding a sign-off line after it.

Also: **only PUBLISHED flows can be attached to a template.** A DRAFT will not appear in the picker — the usual reason a form seems missing.

## Reading flow analytics

- Insights come from **Android and iOS only** — WhatsApp Web completions are not counted.
- **No data at all until 100+ views** in the period. Empty analytics on a new form is expected, not a fault.
- **Flow completion rate** is the metric that tells you the form is too long.

Related: [[training-lesson-7-whatsapp-forms]], [[whatsapp-forms-json-portability]]
