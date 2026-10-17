---
title: Veblika webhook — message-received payload (all message types)
created: 2026-10-17
tags: [whatsapp, veblika, webhook, n8n, reference]
source: Six live test events captured in n8n (Renault WhatsApp Agent (Veblika) workflow, test webhook) on 2026-10-17 — Claude Code session with Yogesh
origin: ai
author: claude-code
maturity: supported
---

# Veblika webhook — message-received payload (all message types)

Captured from real Veblika `message-received` events sent to an n8n Webhook node on 2026-10-17. Fills the gap in [[veblika-whatsapp-messaging-api-reference]], which documents sending but not the inbound webhook.

## Envelope (every message)
- `body.event` = `message-received`
- `body.data.senderName` — WhatsApp profile name
- `body.data.senderPhoneNumber` — reply-to number (digits, country code, no `+`)
- `body.data.recipientPhoneNumberId` — the business number's Meta Phone Number ID → use as `phoneNoId` when replying via Veblika `POST /messages`
- `body.data.messageId` — `wamid…` (use for dedupe / mark-read)
- `body.data.messageTimestamp` — Unix seconds
- `body.data.messageType` — `text | image | audio | document` (others not yet captured)

## `content` per type
| messageType | content fields |
|---|---|
| text | `text` |
| image | `mediaId`, `mimeType` (image/jpeg), `sha256`, `caption` (optional) |
| audio (voice note) | `mediaId`, `mimeType` = `audio/ogg; codecs=opus`, `sha256` — no caption |
| document — PDF | `mediaId`, `mimeType` = `application/pdf`, `sha256`, `filename` |
| document — Word | `mediaId`, `mimeType` = `application/vnd.openxmlformats-officedocument.wordprocessingml.document`, `sha256`, `filename` |
| document — other (CSV test) | `mediaId`, `mimeType` = `text/csv`, `sha256`, `filename` |

## What this means for the build
- Field names differ from Meta's raw webhook (`messages[0]…`); map from `body.data.*`.
- Route first on `messageType`, then on `content.mimeType` for documents (PDF / Word via "contains word" / everything else → unsupported reply). Unsupported files still arrive as `document`.
- Media arrives **only as a Meta `mediaId`** — no download link. Until Veblika provides a get-media API, download with the n8n **WhatsApp Business Cloud → Download media** node + the Sahas AI permanent system-user token, then an HTTP Request with Response = File. The token must have access to the WABA that holds the number (see [[meta-whatsapp-cloud-app-live-and-waba-subscription]]).
- No signature / secret header was observed — the webhook path is the only protection. Not yet confirmed whether status/delivery events arrive on the same endpoint with a different `event`.

Related: [[renault-whatsapp-rag-agent-meta]], [[whatsapp-sahas-ai-current-build-brief]].
