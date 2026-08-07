---
title: WhatsApp Payment Configuration (India)
created: 2026-08-07
tags: [whatsapp, payments, india, meta, knowledge]
source: Class 6 recording — WhatsApp Catalog & Payments
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Payment Configuration (India)

How you **collect money from customers** on WhatsApp. Distinct from how you pay Meta for messages → [[whatsapp-api-billing-credit-line]].

Configured at: WhatsApp Manager → **Payment configurations → India**. It is country-specific — the sidebar literally has a country entry.

## Meta's three steps

1. **Create** — name the payment configuration (internal only; customers never see it).
2. **Connect** — link it to your payment gateway, or to your bank with a UPI VPA ID.
3. **Test** — if using a gateway, confirm the configuration can receive payments.

## Supported gateways

**Razorpay · PayU · BillDesk · Zaakpay · UPI VPA ID**

Meta's own instruction: *"Choose your payment gateway. If the gateway that you work with is not listed, choose UPI VPA ID."*

> ⚠️ **"Only gateway-generated UPI IDs are supported."** A personal UPI handle will not work. If your gateway is not one of the four, you need a gateway-generated VPA *from it*. The trainer used a personal one for demonstration and noted that is not how it is meant to be done.

Also on the form: Merchant category code (MCC) and Purpose code, both optional and defaulting to test values — complete them properly with your gateway's guidance.

## The simpler alternative: a payment link

You do **not** need native payment configuration to collect money. Every catalog product has a **Link** field, and the trainer's recommendation is to point it at a payment collection page rather than a generic product page.

He demonstrates with **Cashfree** — a gateway *not* on Meta's list — creating a payment form and pasting its URL into the product link. A customer tapping through from the catalog card lands somewhere they can pay immediately.

| | Native payment config | Payment link in product Link field |
|---|---|---|
| Gateways | Only the 4 listed, or gateway UPI VPA | **Any** gateway |
| Setup | 3-step Meta flow, MCC, purpose code | Paste a URL |
| Experience | Pay inside WhatsApp | Opens the gateway page |
| Good for | Full in-chat checkout | Getting started, or an unlisted gateway |

**Why a payment form rather than a product page:** the catalog card has already shown the image, name and price. Another product page repeats what they just read and adds a step. A payment form converts the tap.

Gateways also usually offer a **QR download** for the same form — useful offline.

## Sequence

Catalog first → [[whatsapp-catalog-setup]], then payment. A catalog works and sells without payment configuration; payment configuration without a catalog has nothing to charge for.

Related: [[training-lesson-6-catalog-payments]], [[pricing-ladder]]
