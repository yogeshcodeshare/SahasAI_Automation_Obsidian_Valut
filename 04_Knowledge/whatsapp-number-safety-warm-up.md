---
title: WhatsApp Number Safety & Warm-Up
created: 2026-08-06
tags: [whatsapp, meta, compliance, operations, knowledge]
origin: ai
source: Class 4 recording — WhatsApp Business API Automation course
author: claude-code
maturity: supported
---

# WhatsApp Number Safety & Warm-Up

How to avoid losing a WhatsApp Business API number. The most commercially important rule in [[training-lesson-4-tagging-contacts-compliance]] — a blocked number costs the account, its message history, and the whole onboarding effort in [[whatsapp-api-onboarding]].

## The rule

**Never bulk-broadcast to cold data.** Sending to thousands of strangers on day one is the fastest way to lose the number you have just invested in. If enough recipients block or report you, Meta will warn you, restrict the number, or block it outright.

**Start at 100–200 messages.** Increase gradually while the quality rating holds.

Veblika's own documentation adds a hard ceiling regardless of how warm the list is: **never attempt more than 5,000 messages in a single session.**

## Why the trainer's clients don't get blocked

He states that no client of theirs has ever had a number blocked, and attributes it to one practice rather than luck: they do not cold-broadcast. A new number is warmed gradually, the audience is nurtured into replying first, and only then is the data targeted with campaigns.

## Quality rating

Meta continuously scores the number on how many people you message, how many block you, and how many report you. That rating determines your messaging limits and ultimately whether the number survives at all.

## Which data is safe to broadcast

| Data | Safe? | Why |
|---|---|---|
| Existing clients | Yes | Established relationship, very low block risk |
| Leads who enquired (lead forms, website) | Yes | They showed intent — message promptly while it is fresh |
| Form / website sign-ups | Yes | Opted in by their own action |
| Purchased or scraped lists | **No** | High block and report risk — this is what gets numbers banned |
| Old data never contacted | Caution | Warm up slowly in small batches and watch the rating |

## Implication for Sahas AI

Any proposal promising a large day-one broadcast is promising something that endangers the client's number. Sequence it instead: warm the list, capture replies, then broadcast to the engaged segment.

This is also a differentiator worth stating out loud in a pitch — most competitors will happily blast a purchased list and lose the client's number in month one.

Relevant to [[pricing-ladder]] and [[whatsapp-lead-sop-8-stage]].

Related: [[whatsapp-marketing-capping-and-deliverability]]
