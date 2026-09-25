---
title: Veblika / BizAutomation WhatsApp Messaging API Reference
created: 2026-09-25
tags: [whatsapp, veblika, bizautomation, api, n8n, reference]
source: "45 screenshots supplied by Yogesh from Developers > Whatsapp API and Whatsapp API Docs in the live BizAutomation/Veblika account; detailed local reference at Automations/What's App Automation/WhatsApp Automation template & workflow/11_Veblika_WhatsApp_API_Reference.md"
origin: ai
author: codex
maturity: supported
---

# Veblika / BizAutomation WhatsApp Messaging API Reference

Screenshot-backed integration map for the API exposed under **Developers → Whatsapp API / Whatsapp API Docs**. This establishes what the live documentation displayed on 2026-09-25; it does not prove that every example succeeds in the Sahas AI account.

The full payload examples and 45 archived screenshots remain in the local working reference:

`Automations/What's App Automation/WhatsApp Automation template & workflow/11_Veblika_WhatsApp_API_Reference.md`

## Trust boundary

- `api.example.com`, example phone numbers, phone-number IDs, media IDs, message IDs, template names, and OTP values shown by the documentation are placeholders.
- The account allows one WhatsApp Messaging API key at a time. A regeneration may invalidate integrations using the prior key.
- Never place a real key, bearer token, OTP, or personal contact data in this vault. Keep credentials in n8n credentials or an approved secret store.
- This is a Veblika wrapper API. Do not assume its fields are interchangeable with raw Meta Cloud API payloads.

## Common send contract

The displayed placeholder send endpoint is:

```text
POST https://api.example.com/api/v2/whatsapp-business/messages
Authorization: Bearer <api-key>
Content-Type: application/json
```

Common fields are `to` (recipient with country code), `phoneNoId` (sending WhatsApp Business phone-number ID), and `type`.

## Operations captured

### Session-window media and text sends

| Operation | `type` | Additional documented fields |
|---|---|---|
| Text | `text` | `text` |
| Image by URL | `image` | `url`, `caption` |
| Image by media ID | `image` | `id`, `caption` |
| Video | `video` | `url`, `caption` |
| Document | `document` | `url`, `caption`, `filename` |
| Audio | `audio` | `url` |

The screenshots do not establish file limits, supported MIME types, URL-fetch requirements, or all optional/required distinctions.

### POST template sends

Every captured template payload uses `type: template`, an exact approved `name`, and a locale such as `en_US`.

| Template operation | Provider-specific additions |
|---|---|
| Basic text | No additional parameters |
| OTP authentication | OTP in `bodyParams`; URL-style button object also carries the OTP text |
| Body variables | Ordered `bodyParams` array |
| Header image | `headerParams` image object with public `url`; optional body variables shown |
| Header video | `headerParams` video object with media `id` |
| Header document | `headerParams` document object with `url` and `filename` |
| Location | `headerParams` location object with numeric latitude/longitude plus name/address |
| Currency | A `bodyParams` object with `type: currency`, `amount_1000`, currency `code`, and `fallback_value` |
| Date/time | A `bodyParams` object with `type: date_time` and `fallback_value` |
| Catalog | Catalog button with `thumbnail_product_retailer_id` |
| Flow | Flow button with `sub_type: flow` |

Notable cautions:

- The documentation spells the currency field `amount_1000`. Preserve the wrapper's spelling for a controlled test, but verify amount scaling before production financial messages.
- The date/time example shows only a human-readable fallback, not timezone or timestamp handling.
- The Flow example shows no Flow ID, token, action, initial screen, or payload. The minimal example must be tested against the exact approved template before activation.
- Body parameter order must match template placeholder order.

## GET template-send compatibility routes

The documentation also presents message-sending `GET` requests to the messages endpoint using query parameters for:

- Basic text template
- OTP authentication template
- Template with variables
- Header image
- Header video
- Header document

This is side-effecting GET behavior and therefore a production risk: query strings may enter browser history, reverse-proxy logs, monitoring systems, or analytics, while clients/intermediaries may retry or cache GET requests. Prefer POST JSON for production. If GET is unavoidable, URL-encode values through the HTTP client, keep authorization in the header, disable automatic retries/caching where possible, and verify one request creates exactly one message.

GET-specific shapes include:

- Variables: one comma-separated `bodyParams` value in placeholder order; do not send `variable1`, `variable2`, etc. Literal commas require provider-confirmed escaping.
- OTP: `bodyParams`, `buttonSubType=url`, and `buttonText`.
- Image: `headerType=image` plus `headerUrl` or `headerId`. The page marks `headerUrl` required while simultaneously saying an ID may be used, so this is a documentation inconsistency.
- Video: `headerType=video` plus a media `headerId` in the example; the text says `headerUrl` is an alternative.
- Document: `headerType=document`, `headerUrl` or `headerId`, and optional `headerFilename`.

## Read endpoints

List templates for a phone-number ID:

```text
GET /api/v2/whatsapp-business/templates/{phoneNoId}
```

Optional filters: `name`, `status` (`APPROVED`, `PENDING`, `REJECTED` examples), `limit`, `after`, and `before`.

Get point-in-time delivery status:

```text
GET /api/v2/whatsapp-business/status/{messageId}
```

Persist the message ID returned by a send. Prefer webhook delivery events for asynchronous state when available; an accepted send response is not proof of delivery.

## Sahas AI implementation gate

Use the sequence **draft → controlled test → owner approval → activation**:

1. Confirm the real Veblika API host inside the account; never call the placeholder host.
2. Store the key in n8n credentials, not in node JSON, screenshots, logs, or this vault.
3. Validate the sending `phoneNoId` and recipient `to` separately.
4. For templates, query the template list and confirm exact name, locale, and approved status.
5. Prefer POST JSON and test with one internal recipient.
6. Capture HTTP status, response body, message ID, and downstream webhook status.
7. Add deduplication before retries. Never blindly resend after an ambiguous timeout.
8. Obtain Yogesh's approval before enabling client-facing or scheduled sends.

This API reference complements [[veblika-platform-admin-reference]], [[whatsapp-template-anatomy]], [[whatsapp-template-categories-and-approval]], [[whatsapp-flow-builder-webhook-reference]], and [[veblika-native-ai-assistant-capabilities]].

## Unverified gaps

The screenshots do not provide response schemas, HTTP/error-code tables, rate limits, timeout behavior, retry rules, idempotency support, webhook signatures, media MIME/size constraints, or GET variants for location/currency/date-time/catalog/Flow templates. Do not invent these details; verify with Veblika support or controlled account testing.
