---
title: WhatsApp Bulk Broadcast — Results, Rebroadcast & the Block Ratio
created: 2026-08-11
tags: [whatsapp, broadcast, deliverability, crm, knowledge]
source: Class 10 recording — "Lead Capturing, Management, Segmentation & Bulk Broadcasting" (51:40–56:45)
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Bulk Broadcast — Results, Rebroadcast & the Block Ratio

How to run and read a segment-targeted broadcast, and the one health metric the trainer says to actively watch. Builds on the filtering already documented in [[bizautomation-contact-filtering-and-import]].

## The mechanism: filter, then broadcast

1. Filter Contacts to the target segment (e.g. Lead Stage ≠ Lead Requirement — leads who showed interest but never submitted the requirement form).
2. Select the filtered rows → **Broadcast**.
3. Name the campaign, pick the phone number and template, choose immediate or scheduled send.

A worked example from the class: a segment of leads stuck before the requirement stage, re-sent the same `lead_requirement` template used in the live flow, named campaign `Lead Requirement Pending`.

## Every broadcast is tracked as a Campaign

The Campaigns list carries one row per broadcast, with status (`Completed` / `Partially_completed`), total contacts, scheduled time and creation time. Opening a campaign's **Messages** tab shows a per-recipient status list: phone, status (Sent / Delivered / Failed), timestamp.

## Why a message fails

Two causes demonstrated live:
- The number does not exist (the trainer deliberately used an invalid test number to show this).
- The WhatsApp number is blocked, or rate-limited by Meta.

## Rebroadcast — scoped automatically to failures

The platform does not require manually identifying which recipients failed. A **Rebroadcast** action on a campaign pre-scopes itself: *"You're about to rebroadcast to N recipients whose messages are currently in 'failed' status"* — campaign name, phone number and template re-selected, one click to resend to exactly that failed subset.

## The block-to-engagement ratio — the metric to actually watch

> Engagement should run at least **3x** the block count.

Worked example: broadcast to 1,000 people, roughly 10 blocks observed → engagement (replies, clicks, any interaction) should be at least 30 for the send to be considered healthy. A ratio worse than that is the trainer's stated signal to change the message, the targeting, or the frequency — **before** it affects the WhatsApp number's own reputation and deliverability with Meta.

This connects directly to the billing/rating material in [[whatsapp-api-billing-credit-line]] — a number's rating is exactly what a bad block ratio degrades, and a degraded rating is what raises billing thresholds and throttles reach.

## Why video outperforms text in a follow-up broadcast

Stated with numbers in the same class, applied specifically to re-engagement messaging:

| Format | Trainer's estimated chance of being seen |
|---|---|
| Text only | ~50–70% |
| Short video | ~90–95% |

Worth weighing against the operational cost of recording video content per broadcast — the trainer demonstrates the recording live and treats it as low-effort (a short, informal, personally-recorded clip), not a production task.

Related: [[training-lesson-10-lead-capturing-management]], [[bizautomation-contact-filtering-and-import]], [[whatsapp-marketing-capping-and-deliverability]]
