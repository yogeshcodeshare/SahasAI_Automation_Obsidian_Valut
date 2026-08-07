---
title: WhatsApp Template Categories, Carousel & Approval
created: 2026-08-07
tags: [whatsapp, templates, meta, compliance, knowledge]
source: Class 5 recording — WhatsApp Templates Mastery
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Template Categories, Carousel & Approval

Two independent axes: **what the template is for** (category) and **what shape it takes** (structure). Anatomy and limits are in [[whatsapp-template-anatomy]].

## The matrix

| | Marketing | Utility | Authentication |
|---|---|---|---|
| **General** structure | Yes | Yes | Yes |
| **Carousel** structure | **Yes** | No | No |
| Frequency capped | Yes | No | No |
| Relative cost | Higher | ~6× cheaper | Cheapest |
| Special feature | — | — | OTP copy-code button |

**Carousel is marketing-only.** Build one and it is submitted as marketing, which means it is subject to the per-user daily cap in [[whatsapp-marketing-capping-and-deliverability]] and priced accordingly. Some platforms used to allow carousel in utility; not here.

## Meta categorises on content, not on your selection

The trap that catches people: attach pricing or an offer to a message and it becomes marketing however you would prefer to label it. A "reminder" mentioning a discount is a marketing message.

## What authentication actually buys

Send an OTP as **utility** and the customer sees the number, then has to remember and retype it. Send the identical content as **authentication** and a copy-code button appears — one tap copies, they paste.

The instructor's verdict: there is a charge difference and utility is generally the better choice, unless your users are visibly struggling to copy codes by hand.

## Carousel

Like an Instagram carousel, inside a WhatsApp message. Several cards scrolled sideways, each with its own media header, ~160 characters of text, and its own buttons.

**Why it matters commercially:** a three-card carousel is three offers with three destinations in one expensive marketing send. For a business with several products, projects or services, it is a materially better use of one send than a generic message.

Design pattern: one card per product · media that shows it · 160 characters that describe it · a quick reply that records interest plus a URL that delivers detail.

## Approval

Nothing sends until Meta approves it.

1. Build and **Submit Template**.
2. Status sits at **Pending**. Nothing can be sent with it.
3. Use **Sync Status** to pull the current state from Meta — the platform shows a cached copy and the two can be minutes apart.
4. Status becomes **Approved** (or Rejected).

Approval took a few minutes in the demonstration but is not instantaneous. **A template built the morning of a send is a campaign that may not go out** — build the library ahead of the campaign calendar.

## Account health lives on the same screen

The Templates screen shows the connected number's **Quality** (GREEN in the demo) and **Throughput** (STANDARD). Quality is the rating driven by blocks and reports in [[whatsapp-number-safety-warm-up]]. If it moves off green, stop broadcasting and find out why.

Related: [[training-lesson-5-templates-mastery]], [[whatsapp-api-pricing-model-india]]
