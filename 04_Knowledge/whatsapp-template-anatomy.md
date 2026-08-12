---
title: WhatsApp Template Anatomy & Limits
created: 2026-08-07
updated: 2026-08-12
tags: [whatsapp, templates, reference, knowledge]
source: Class 5 recording — WhatsApp Templates Mastery; limits read from the BizAutomation interface
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Template Anatomy & Limits

Every WhatsApp template is three parts. Learn them and every option in any vendor's interface has an obvious home.

```
┌──────────────────┐
│     HEADER       │  none · text · image · video · audio · document · location
├──────────────────┤
│      BODY        │  the message — required
├──────────────────┤
│     FOOTER       │  small text line
│  [ buttons ]     │  CTA · quick reply · options menu · form
└──────────────────┘
```

## The four footer actions

| Action | Limit | What it does |
|---|---|---|
| Call-to-action button | — | Leaves the chat: opens a **URL**, or the **dialpad** for a phone number |
| Quick reply button | **3** | Stays in the chat; the choice comes back as a message on your number |
| Options menu | **10** | For when 3 buttons is not enough |
| Form | — | Opens a WhatsApp form in-app → lesson 7 |

## Every limit

| Item | Limit |
|---|---|
| Body | **1024 characters** |
| Header text | 60 characters |
| Footer text | 60 characters (counter displays /64) |
| CTA button title / quick reply text | **25 characters** |
| Quick reply buttons | 3 |
| Options menu | 10 |
| Carousel cards | min 2, **max 10** |
| Carousel card body text | **160 characters** |
| Carousel card image | **5 MB** — jpeg/jpg/png |
| General header image | ~14 MB (stated verbally; the carousel control shows 5 MB) |
| Template name | lowercase, digits and underscores only |

## Formatting markers

Standard WhatsApp syntax — identical in every client and every vendor's editor.

| Format | Syntax |
|---|---|
| Bold | `*text*` |
| Italic | `_text_` |
| Strikethrough | `~text~` |
| Variable | `{{1}}`, `{{2}}` … |

Body also accepts emojis and **any language** — Hindi, Marathi, Gujarati all work, which matters for an Indian customer base.

## Fixed text + variables

The mechanism that makes a bulk send read as personal. `Hello {{1}}` resolves per recipient from the contact record, so one template produces "You have shown interest for Delhi project" and "…for Noida project" from the same body.

Variables map onto the custom fields in [[crm-and-field-model]] — which is why the field model has to exist before templates are useful.

**Sample values are mandatory** before submission. Meta's reviewer uses them to see the finished message; they are replaced at send time and no customer ever sees them.

## The location header is underused

Set a location on a template and the customer receives it exactly like a shared WhatsApp pin. One template per project, each with that project's location — a Gurgaon lead taps and gets Gurgaon. Works equally for "where is your office?".

## Carousel card buttons, and why video testimonials specifically (added from Lesson 9)

Each carousel card carries its own button requirement, separate from the card-count limit above:

| Item | Limit |
|---|---|
| Buttons per carousel card | **min 1, max 2** — a card cannot be saved with zero |
| Button types on a card | Can be mixed — Quick Reply, Phone and URL all available on the same card |

The interface enforces the minimum live: attempting to save a card with no button surfaces a "component of type button is missing expected field" validation error.

**The trainer's stated position on testimonial format**, worth carrying into any client-facing testimonial build: image testimonials carry little to no benefit; text testimonials carry essentially none; **only video testimonials build real value and trust today**. A full testimonial carousel, built and sent live in Class 9, uses exactly this card/button structure — one video per card, a "Check All Testimonials" button on the first card linking out to the full YouTube playlist for anyone who wants more than the two or three previewed → [[training-lesson-9-welcome-to-appointment-booking]].

Related: [[whatsapp-template-categories-and-approval]], [[whatsapp-message-templates-mr-hi-en]], [[training-lesson-5-templates-mastery]], [[training-lesson-9-welcome-to-appointment-booking]]
