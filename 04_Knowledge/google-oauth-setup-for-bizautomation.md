---
title: Google OAuth Setup for BizAutomation Integrations
created: 2026-08-12
tags: [google, oauth, integration, reference, how-to, knowledge]
source: Class 12 recording — Google Cloud Console walkthrough
origin: ai
author: claude-code
maturity: supported
---

# Google OAuth Setup for BizAutomation Integrations

Step-by-step reference for connecting any Google product (Sheets first; the same client works for Drive, People, etc.) to BizAutomation. Demonstrated for Google Sheets in [[training-lesson-12-google-sheets-integration]], but the console steps themselves are generic to any Google API integration — reusable well beyond this course.

## The three APIs to enable together

| API | Why |
|---|---|
| **Sheets API** | Reads and writes spreadsheet data — the obvious one |
| **People API** | Required for the integration's authentication to work correctly |
| **Drive API** | Lets BizAutomation list existing sheets in a dropdown; without it, sheet IDs must be typed in manually |

Enable all three at `console.cloud.google.com → APIs & Services → Library` before creating the OAuth client — skipping Drive specifically is the easy one to miss, and its absence isn't obvious until you're stuck typing a spreadsheet ID by hand.

## The checklist, in order

1. **Create a project** — `console.cloud.google.com`, new project, named after the integration (e.g. "WhatsApp API").
2. **Enable the three APIs** above.
3. **Create an OAuth client** — `Google Auth Platform → Clients`. Name it clearly.
4. **Set Authorized JavaScript origin** — must match the actual platform making the API calls (e.g. `app.bizautomation.io`; a white-labelled account uses its own domain instead).
5. **Set Audience to External** — correct whenever the account isn't managed under one company's Google Workspace.
6. **Add a test user** — the same Google account's own email address.
7. **Publish to Production** — see the warning below; do not skip this.
8. **Copy Client ID and Client Secret** — the secret is shown **exactly once**, in the creation dialog. Once closed it cannot be re-viewed, only regenerated (which invalidates the old one).
9. **Paste both into BizAutomation's Add Connection form** — completes the connection.
10. **Confirm the security interstitial and sign in** — Google warns the app isn't verified; safe to proceed past on Advanced → "Go to [yourplatform]" when you built the app yourself and added no unusual scopes.

## The trap: Testing mode expires weekly

An OAuth app left in **Testing** status is only valid for about one week at a time. Every week it needs re-authenticating unless explicitly published to **Production** — step 7 above. This is the single most important warning in the whole setup: skipped, it reads as a mysterious, recurring, unexplained failure rather than the one-time fix it actually is.

## Cost

Free to start — no payment required for account creation or enabling APIs. The trainer's own estimate of the free-tier ceiling: roughly **100 requests per minute** before billing becomes necessary — comfortably above typical single-business lead volume.

## A terminology note

This flow connects a Google **account**, not one specific spreadsheet. Multiple sheets under that account become available afterward through the same connection — think of it as linking the account, then picking a sheet per automation node, not one connection per sheet.

Related: [[training-lesson-12-google-sheets-integration]], [[whatsapp-flow-builder-webhook-reference]]
