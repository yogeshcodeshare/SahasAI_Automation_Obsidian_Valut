---
title: GMB Sarathi — UAT Fix List
created: 2026-08-02
updated: 2026-08-06
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

## Resolved — all 8 fixed + merged (2026-08-06, `main @ 9e8c891`, CI green, 317 tests)
- **UAT-1** ✅ Frontend now toasts `"PDF failed — <msg>"` on any failure (never a fake "PDF ready"); backend hardened the EP-006 envelopes (FEATURE_DISABLED / PdfEngineError / storage-classified). Original root cause was `FEATURE_PDF` not loaded in the client's running dev process — restart `npm run dev`.
- **UAT-2** ✅ Demo-audit mode shipped: `EP-001 mode:"demo"` runs the full pipeline on a deterministic synthetic generator — is_demo=true, source="demo", zero vendor calls, ₹0. See [[demo-mode-synthetic-audit-generator]].
- **UAT-3** ✅ Confirmed dev-compile-bound; live screens carry no artificial delay (dashboard double-fetch killed, mock-fallback 400→100ms). Real speed verdict at the prod build.
- **UAT-4** ✅ Seed-wide snapshot backfill executed → ★/reviews/PageSpeed chips populate on live read.
- **UAT-5** ✅ WA modal uses only real `owner_whatsapp` contacts (DEMO-badged when demo-sourced); fake chips removed.
- **UAT-6** ✅ Deleted the 3 junk मनोवेध rows from the cloud DB (back to 6 seed); migration `20260718000001` adds `place_id`+`cid` unique guard; demo rows carry is_demo for `flush:demo`.
- **UAT-7** ✅ Settings toggle knob anchored `left-0` + focus ring.
- **UAT-8** ✅ Real `GET /api/spend/ledger` (real rows, newest-first) replaces the placeholder.

Still gated (not UAT bugs): go-live cutover + host deploy — blocked on Flag A / Flag B in [[gmb-sarathi]].
