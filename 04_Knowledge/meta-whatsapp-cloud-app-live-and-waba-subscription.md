---
title: Meta WhatsApp Cloud — make your own app receive messages (Live mode + WABA subscription)
created: 2026-10-17
tags: [whatsapp, meta, cloud-api, n8n, troubleshooting, how-to]
source: Claude Code session 2026-10-13 → 2026-10-16 with Yogesh — debugging the n8n WhatsApp Trigger on the Sahas AI number
origin: ai
author: claude-code
maturity: supported
---

# Meta WhatsApp Cloud — make your own app receive messages

How the n8n **WhatsApp Trigger** was fixed after it returned "API access blocked", then 502, and received nothing. Each step was done and then verified by a real inbound message.

## Symptoms and causes
- **"API access blocked" / 502 on Execute step** → the Meta app (N8N-App) was in **Development mode** and had **no WhatsApp account connected**.
- **No messages arrive even though the number works** → the number had been onboarded by Veblika into a **different WABA** ("Sahas AI - Automation Karo", Veblika/Automation Karo as full-control partner). The old token/app were tied to the original "Sahas AI" WABA, which no longer held the number. One number lives in only one WABA at a time.

## Fix (in order)
1. Meta app → App settings → Basic: privacy policy URL, terms URL, data-deletion URL, app icon, category → Save → switch **App Mode to Live**.
2. Business Settings → WhatsApp account (the number) → Assign people → the **system user** behind the permanent token → Full control.
3. Developers → app → WhatsApp → API Setup: confirm the number now appears in "From"; note the **WABA ID** and the new **Phone Number ID** (it changes when the number moves WABA).
4. n8n HTTP Request, **POST** `https://graph.facebook.com/v21.0/<WABA_ID>/subscribed_apps`, auth = WhatsApp API credential → expect `{"success": true}`.
5. WhatsApp Trigger → Execute step → send a test message → payload arrives.

## Notes
- "Connect assets" on the app in Business Settings does **not** offer WhatsApp accounts — access comes from steps 2 and 4.
- Your app can subscribe alongside the BSP's app (Veblika); both receive webhooks. Veblika keeps control, so re-onboarding on their side can break this again.
- Only one WhatsApp Trigger per Meta app (n8n limitation).
- Use the dynamic `metadata.phone_number_id` in send nodes, not a hard-coded ID.

Related: [[renault-whatsapp-rag-agent-meta]], [[whatsapp-api-onboarding]], [[veblika-webhook-message-received-payload]].
