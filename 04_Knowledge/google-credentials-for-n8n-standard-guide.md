---
title: Google credentials for n8n — standard guide
created: 2026-10-08
tags: [n8n, google, oauth, standard-guide]
source: Google Cloud + n8n setup done with screenshots, 2026-10-05
origin: ai
author: claude-code
maturity: supported
---

# Google credentials for n8n — standard guide

A reusable 21-page, screenshot-backed PDF for connecting Google services to Sahas AI's self-hosted n8n. Local path: `Ai Automation/Automations/n8n Automation/Standard Guides/google-credentials-setup/`.

- **Part A** — Cloud project + enable 6 APIs (Drive, Sheets, Gmail, Docs, Slides, Calendar).
- **Part B** — Google Auth Platform consent screen: External audience, add a test user. Testing mode expires the sign-in after 7 days → publish the app before a workflow goes live.
- **Part C** — Web-application OAuth client with the n8n redirect URL (`…/rest/oauth2-credential/callback`).
- **Part D** — paste client ID + secret in n8n, Sign in with Google, tick "Select all"; one credential per Google node type, all reusing the same client ID/secret.

Tips: on "Google hasn't verified this app" use **Advanced → Go to …**, never "Back to safety"; the client secret lives only in n8n — never in chats, PDFs or sheets. Done so far: Drive, Sheets, Docs, Slides, Calendar. **Gmail still to create** (needed for [[decision-ai-accountant-payment-detection-bank-alerts]]).

Related: [[google-oauth-setup-for-bizautomation]] · [[n8n-sahas-ai-production-deployment]] · [[ai-accountant-system]]
