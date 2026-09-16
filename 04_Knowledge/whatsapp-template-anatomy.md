---
title: WhatsApp Template Anatomy & Limits
created: 2026-08-07
updated: 2026-09-16
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

## Update — 2026-09-16: button, send-time and availability mechanics (from the Lesson 5 long-form notes)

Detail present in the source lesson document that this note had not carried.

### The Interactive Actions selector

The builder exposes exactly seven choices, and they are mutually exclusive except for `All`:

`None` · `Call to Actions` · `Quick Replies` · **`All`** · `Product Card Carousel` · `Media Card Carousel` · `Form`

`All` is what allows CTA buttons **and** quick replies on the same template — the combination used in the worked build (three project quick replies + a URL button + a phone button on one template).

### Static vs dynamic URL buttons

| URL type | Behaviour | Use for |
|---|---|---|
| **Static** | Every recipient gets the same link | Website, signup page, brochure |
| **Dynamic** | The link is completed per recipient at send time | A personal hall ticket, a specific booking, a per-customer document |

Dynamic URLs are the mechanism for anything that is genuinely *that person's* link. Configuration was deferred in the class.

### Action availability is not uniform across categories

The trainer's stated caveat, worth testing rather than assuming: a **general** template exposes all four footer actions (form, CTA, quick reply, options menu); a **marketing** template exposed only two in his experience (CTA and quick reply). He also reported having had **Forms approved under Utility in some cases**, even though they usually land in Marketing. Availability varies by platform and changes over time — verify on the live account before promising a client a specific combination, and never treat "the Form button was allowed" as evidence of category eligibility → [[whatsapp-meta-current-pricing-and-service-rules-2026-09]].

### The STOP button is best practice, not a Meta rule

On marketing sends, make one of the three quick replies a STOP/Unsubscribe. The trainer is explicit that **Meta does not require this** — the argument is arithmetic: a tap on your own STOP button costs one contact, while a block or report is a permanent negative signal against the number's quality rating. It writes the same flag as the opt-out keywords in [[whatsapp-marketing-capping-and-deliverability]]. It does **not** make a template Utility.

### Header document types

PDF is what reliably works. Word and plain-text files may or may not be accepted — check the permitted types on the upload control of the platform you are actually on before designing a client workflow around a `.docx` attachment.

### Send time: mapping, media and the silent failure

- **Body Mapping** at send time offers a dropdown of the contact's own fields — Name, Phone, Email, WABA Phone Number, and every custom column. Each `{{n}}` is either mapped to a field (resolves per recipient) or given a fixed value (same for everyone on this send).
- **Media can be swapped at send time** without re-submitting the template for approval — one approved template can carry different creative on different campaigns. The image is picked from the Gallery (marked *Recommended*) or supplied as a URL.
- **A carousel send asks for a media URL per card**, not an upload — so upload to the Gallery first and copy each URL → [[veblika-platform-admin-reference]].
- **No wallet balance = nothing sends, quietly.** A marketing template with an unfunded wallet simply does not go out, with no obvious error. Check the wallet before debugging templates, variables or approval status → [[whatsapp-api-billing-credit-line]].

### Where account health is visible

The Templates screen lists the connected number with **Quality** (GREEN in the demo) and **Throughput** (STANDARD). Read both before every campaign; if quality moves off green, stop broadcasting → [[whatsapp-number-safety-warm-up]].

Related: [[whatsapp-template-categories-and-approval]], [[whatsapp-message-templates-mr-hi-en]], [[training-lesson-5-templates-mastery]], [[training-lesson-9-welcome-to-appointment-booking]], [[veblika-platform-admin-reference]]
