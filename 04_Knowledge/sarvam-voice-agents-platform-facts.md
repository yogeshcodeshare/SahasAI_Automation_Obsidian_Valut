---
title: Sarvam Voice Agents (Samvaad) — platform facts for building
created: 2026-10-28
tags: [voice-agent, sarvam, reference, india]
source: Official docs https://docs.sarvam.ai/voice-agents (162 pages read 2026-10-28; append .md to any page URL for plain text). Full notes: local "AI Voice Calling Agents/SARVAM-DOCS-REFERENCE.md"
origin: ai
author: claude-code
maturity: supported
---

# Sarvam Voice Agents — what matters when building

Used for [[ai-voice-calling-agents-sarvam]].

- **No YAML / no public agent API.** Agents are built in the dashboard (tabs: Instruction · Variables · Tools · Settings · Tests).
  A JSON agent config exists only via Sarvam's MCP server (`https://mcp.sarvam.ai/voice-agents`, Sarvam login, 24 h token).
  Deployments, campaigns and API calls always use a **committed** version, never the draft.
- **Greeting** is a separate field played as-is (needs a translation per language); **Instructions** come after it. Variables are inserted with `@` (chips).
- **Variables:** input (with defaults, per-call values) and **output** (String/Enum + extraction prompt, extracted after the call). One **call goal** per agent.
- **Single outbound call:** `POST https://apps.sarvam.ai/api/outbounds/v1/orgs/{org}/workspaces/{ws}/outbounds`, header `X-API-Key`;
  body `app_config` {app_id, app_version, connection_config {connection_id, agent_phone_number}, agent_variables, app_overrides {initial_language_name}},
  `user_config` {user_phone_number}, `webhook_config` {url, metadata} → returns `attempt_id`. Campaigns + cohorts exist for bulk.
- **Call results:** a fixed-shape webhook after every attempt (instant outbound, campaign, inbound deployment): status
  (connected / no_answer / busy / failed), duration, interaction_id, final/output agent variables, English transcript, echoed metadata.
  **Not signed**, **no summary field** (make an output variable). Recordings and original-language transcripts via the Analytics API.
- **Tools:** API tool (method, URL, headers, body, bearer/api_key/basic auth stored as secrets, max wait 30 s, "save reply into variables"),
  run timing `run` / `on_start` / `on_end` (hooks have no LLM). Built-in: end call, KB query, call transfer, voicemail, language switch.
  **Call transfer self-serve only on Vobiz (incl. Rent from Sarvam) and Plivo**; Exotel needs Sarvam support. Keypad (DTMF) input: not available yet.
- **Languages:** Marathi supported (Saaras v4 speech-to-text, Bulbul v4 voices; code-mixed speech in general). **Bulbul v3 retires on Voice Agents 10 Nov 2026 → use v4.** No Marathi-specific voice name listed — test voices.
- **Knowledge base:** PDF, DOCX, TXT, MD, CSV; the agent routes by the KB **description**.
- **Pricing (2026-10):** ₹3.50/min pay-as-you-go (4 concurrent calls) down to ₹3.00 Business; 60-second pulses, connected calls only;
  Sarvam number ₹59 per 30 days (KYC; released if credits run out at renewal); Sarvam telephony ₹0.20 per 30 s.
- **Compliance:** org-wide DND list; consent and telemarketing rules are the customer's responsibility. DLT / 140-160 series not covered in the docs.
