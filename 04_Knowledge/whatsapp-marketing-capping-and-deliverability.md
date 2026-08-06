---
title: WhatsApp Marketing Capping & Deliverability
created: 2026-08-06
tags: [whatsapp, meta, compliance, deliverability, knowledge]
source: Class 4 recording — WhatsApp Business API Automation course
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Marketing Capping & Deliverability

Why a correctly-configured broadcast still fails to reach some people. What each message type *costs* is a separate matter → [[whatsapp-api-pricing-model-india]].

## Frequency capping

Meta limits how many **marketing** messages one WhatsApp user may receive per day, counted **across every business** that messages them — not just yours.

If a user has already consumed their daily marketing allowance elsewhere before your campaign runs, your message is not delivered. Your template is approved, your wallet is funded, and it still does not arrive. Meta's own terms for this are *marketing capping* or *frequency capping*.

> The numeric limit has changed over time. The trainer deliberately declines to quote a figure and advises checking Meta's current published policy instead. Do not hard-code a number into a client proposal.

**Why Meta does it:** the stated reasoning is Facebook's own history — spam and ad volume drove users away, so engagement collapsed. Capping marketing volume protects the channel, which is precisely why WhatsApp still outperforms email. Treat the restriction as the thing protecting your results, not as an obstacle.

## Marketing vs utility

| | Marketing | Utility |
|---|---|---|
| Frequency cap | Yes — per user per day, across all businesses | **No cap** |
| Content | Offers, promotions, announcements | Order updates, reminders, confirmations |
| Wallet balance | Required — fails silently without it | Required |
| Blocked by opt-out | Yes | Yes, within the platform |

This is the **deliverability** argument for reply-driven, utility-led design. It points the same direction as the **cost** argument in [[whatsapp-api-pricing-model-india]], where utility is roughly 6× cheaper than marketing. Two independent reasons for the same design choice.

## Expected failure rate

On a clean, opted-in list, expect **3–5% failure**. That is the normal background rate, not a fault to debug.

- The number is invalid, disconnected, or not registered on WhatsApp.
- The user has restricted marketing messages in their own WhatsApp privacy settings.
- The user hit their daily marketing cap from other businesses before your campaign ran.
- The user previously blocked or reported the number, so nothing further reaches them.

## Opt-out is automatic and system-wide

A contact who opts out is excluded from every future broadcast with no manual filtering — which is the only workable approach when the list is 500 or 50,000 people.

Two routes write the same flag on the same contact record:

- **Customer-typed keyword.** Up to 10 keywords per list. Configured under Manage → Opts Management. Regional-language keywords work as well as English ones, which matters for an Indian customer base.
- **Staff toggle** in the Inbox, for when a customer says it over the phone instead.

Related: [[whatsapp-number-safety-warm-up]], [[training-lesson-4-tagging-contacts-compliance]]
