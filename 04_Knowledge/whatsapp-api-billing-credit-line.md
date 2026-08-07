---
title: WhatsApp API Billing — It's a Credit Line
created: 2026-08-07
tags: [whatsapp, billing, meta, operations, knowledge]
source: Class 6 recording — WhatsApp Catalog & Payments
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp API Billing — It's a Credit Line

How you pay **Meta** for messages. Distinct from how you collect money from customers → [[whatsapp-payment-configuration-india]]. What each message *costs* is in [[whatsapp-api-pricing-model-india]].

## There is no prepaid

The trainer states it directly: **WhatsApp Business API has no prepaid option.** Meta allows prepaid plus postpaid for some products (ads, for instance) but not here.

Instead you get a **credit line**:

1. Attach a card in the portfolio's billing section.
2. Meta extends credit — thresholds around **$10 / $15 / $20** were mentioned.
3. Money is deducted **only when you use it**. Nothing taken up front.
4. Billing fires on whichever comes first: the **monthly cycle**, or **reaching your threshold**. Consume the limit in 15 days and you are billed at 15 days.
5. The same card then appears on the WhatsApp account's Payment method line.

Path: portfolio settings → WhatsApp accounts → select the account → payment settings / billing. Several levels deep → [[meta-business-portfolio-map]].

## The onboarding consequence

**A client cannot send a single marketing message until a card is attached at Meta.**

That is a finance conversation, not a technical one, and it routinely takes longer than the technical setup. Raise it at the *start* of an engagement, not on launch day. Belongs in the [[whatsapp-api-onboarding]] checklist.

## The error it produces

`Business eligibility payment issue` on a failed send = no payment method attached.

**Do not confuse it with** `the message was not delivered to maintain healthy ecosystem engagement`, which is frequency capping and is not a fault at all → [[whatsapp-marketing-capping-and-deliverability]]. The first is a setup problem you fix; the second is Meta working as designed and cannot be configured away. Confusing the two wastes hours.

## No in-platform wallet (yet)

BizAutomation has **no built-in wallet** at the time of recording, so billing must be managed at Meta. The trainer relays that his team expects a wallet inside the software within **one to two months**, after which it could be managed in one place.

> Treat that as a plan, not a promise. Verify current state before promising a client single-pane billing. The Meta-side process works regardless.

## Where to check spend

WhatsApp Manager → **Insights** gives the free/paid message split and approximate charges per category in rupees. In the demo: 24 messages delivered, 23 of them free customer-service, 1 paid, total ≈ ₹0.86. A "Marketing-lite" category appears alongside marketing — worth investigating on your own account.

Related: [[training-lesson-6-catalog-payments]]
