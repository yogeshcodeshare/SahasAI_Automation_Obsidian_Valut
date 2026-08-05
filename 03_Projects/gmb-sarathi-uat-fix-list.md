---
title: GMB Sarathi — UAT Fix List
created: 2026-08-02
tags: [gmb-sarathi, project, uat, bugs]
source: founder UAT 14 Jul 2026
origin: ai
author: claude-code
maturity: established
---

# GMB Sarathi — UAT Fix List

From founder testing on localhost (14 Jul 2026). Companion to [[gmb-sarathi-build-status]].

- **UAT-1** PDF won't download (HIGH)
- **UAT-2** New Audit blocked without DataForSEO → build **Demo audit mode** (product decision, high value)
- **UAT-3** pages slow (mostly dev-mode; verify real speed on Vercel prod build)
- **UAT-4** report header chips blank (★ · reviews / PageSpeed) on live read
- **UAT-5** WhatsApp modal shows fake "recent" numbers → use only real saved contacts
- **UAT-6** dashboard shows 3× duplicate मनोवेध junk rows → clean DB + uniqueness guard + is_demo flag
- **UAT-7** Settings toggle knob renders outside its pill (CSS)
- **UAT-8** spend ledger placeholder shows future dates → real GET /api/spend/ledger

Verdict: layout/flows approved; these are the priority fixes before go-live cutover + Vercel deploy.
