---
title: WhatsApp Meta Current Pricing and Service Rules (September 2026)
created: 2026-09-15
tags: [whatsapp, meta, pricing, service, utility, policy]
source: Meta official WhatsApp Business Platform pricing documentation checked 2026-09-15
origin: ai
author: codex
maturity: supported
---

# WhatsApp Meta Current Pricing and Service Rules (September 2026)

This note is the current policy snapshot for Sahas AI's Veblika/BizAutomation planning. It supersedes older price examples only for current decision-making; historical notes remain unchanged and must not be treated as current rates.

## Message classification for Veblika

| Veblika send | Meta treatment | Current planning rule |
|---|---|---|
| Non-template text, media or interactive reply from a human or third-party Veblika chatbot/AI | Service message while the 24-hour Customer Service Window is open | Do not call every chatbot message Service automatically; the payload must be non-template and the reply must be inside the open window. |
| Approved Utility template | Utility template | The approved category remains Utility even when triggered by a chatbot or workflow. From 1 October 2026, Utility messages sent inside an open 24-hour window become chargeable. |
| Approved Marketing template | Marketing template | Use for promotion, prospecting, qualification/nurture, offers, re-engagement and campaign messaging. |
| Authentication template | Authentication template | Use for authentication/OTP purposes, not lead qualification. |
| Meta Business Agent response | Meta Business Agent | Separate token-based Meta billing; this is not the same as a third-party Veblika AI assistant. |

## Windows and charges

- A user message opens or resets a 24-hour Customer Service Window (CSW). Service messages are allowed only while that window is open.
- Through 30 September 2026, Meta's documentation states that non-template messages and Utility templates in the open CSW are not charged by Meta.
- From 1 October 2026, Service messages become chargeable after a free allowance of 1,000 delivered Service messages per business phone number per calendar month. The allowance is shared by 1:1 and group delivery, does not roll over, and group delivery consumes one unit per delivered recipient.
- From 1 October 2026, Utility messages sent in response to users inside the open 24-hour CSW become chargeable from the first delivered Utility message; the Service free allowance does not apply to them.
- Meta states that Service uses the same market rate as Utility/Authentication and has no volume tiers. The recipient's country and the current rate card determine the amount. Do not hard-code older vault figures (₹0.13, ₹0.145, ₹0.1150, or other historic values) without checking Meta's current INR rate card.
- Outside the CSW, only approved templates can be sent. A non-template chatbot reply cannot be used to bypass the window.
- A 72-hour Free Entry Point (FEP) can start when a person messages from a Click-to-WhatsApp ad or a Facebook Page call-to-action button on a supported mobile experience. If the business responds within the initial 24-hour window, all message types are free of Meta delivery charges while the FEP is open for 72 hours. This does not erase separate Meta Business Agent token charges.
- “Free” refers only to Meta's delivery charge. Veblika/BizAutomation fees, third-party AI costs, taxes and other provider fees are separate.

## Utility eligibility guardrail

Utility is about an actual ongoing request, service event, transaction, account update or essential alert. A welcome message that merely starts a sales qualification journey, a Business Growth Checker invitation, a booking invitation to a prospect, a proposal/upsell, nurture follow-up, re-engagement or offer is not made Utility by using neutral words, a Form button or a different template name. When the actual purpose is promotional or lead generation, say so and use Marketing or ask for the missing operational trigger.

## Official sources

- https://developers.facebook.com/documentation/business-messaging/whatsapp/pricing/
- https://developers.facebook.com/documentation/business-messaging/whatsapp/pricing/non-template-messages
- https://whatsappbusiness.com/products/platform-pricing/

Related: [[whatsapp-api-pricing-model-india]], [[whatsapp-template-categories-and-approval]], [[whatsapp-message-templates-mr-hi-en]], [[whatsapp-automation-vendors]].
