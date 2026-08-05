---
title: GMB Sarathi
created: 2026-08-02
tags: [project, gmb-sarathi, gbp, audit, dashboard]
source: GMB Sarathi 7-day build session (Claude Code, MAIN agent)
origin: ai
author: claude-code
maturity: supported
---

# GMB Sarathi

Internal **Google Business Profile (GBP) audit + optimization + service-delivery dashboard**
for a solo AI-automation agency in Karad, Maharashtra. Single founder user (RLS, no client
logins). Built as a 7-day sprint with a 3-agent workflow (see [[three-agent-worktree-handoff-workflow]]).

## Stack
- **Next.js 14 (app router) + TypeScript**, Tailwind 3.4 + shadcn/ui, IBM Plex Sans/Devanagari/Mono.
- **Supabase** (Postgres/Auth/Storage, RLS, single founder). Migrations applied by hand by the client.
- **DataForSEO** — the ONLY paid vendor (deferred, see below); guarded by [[spend-guard-paid-api-cost-control]].
- **AI:** Groq → OpenRouter free-model fallback chain (no paid LLMs).
- **PDF:** Playwright/chromium behind `FEATURE_PDF`; Devanagari font bundled as base64.
- **Maps:** Leaflet + OpenStreetMap. **WhatsApp:** Meta Cloud API (deferred, keys pending).

## Status (end of Day 7)
- Repo: `github.com/yogeshcodeshare/GMB_Automation` @ `9e8c891`, **CI green, 317 tests**, migrations through `20260718000001` applied.
- **Milestones done:** M0 foundations · M1 audit engine · M1.5 website audit · M2 grid/teleport ·
  M3 AI layer · M4 PDF+WhatsApp (**MVP gate met**) · M5 dashboard · M6 P12 Optimization Sprint
  (manual mode) + P9 Client Ops + P11 Settings.
- **Deferred → Week 2:** M7 public checker (EP-008/009, Turnstile) + P10 public page + <920px mobile pass.
- **Live screens** (on seed/demo data, ₹0): dashboard, businesses, spend, reviews, AI generate
  (Groq), audit report + PDF (mr/en/hinglish, verified end-to-end), settings (CR-1 toggle), P12 sprint.
- **OFF:** DataForSEO-paid routes (resolve/grid/posts-audit), `/api/wa/send` (keys Week-2).

## Key decisions
- **DataForSEO deferred** — the live API needs a **$50 deposit** to activate (not just email
  verification). Kept fully built but **dormant behind the CR-1 kill-switch** ([[feature-kill-switch-fail-safe-off]]);
  the app ships and demos on synthetic data via [[demo-mode-synthetic-audit-generator]].
- **Ship-with-demo-data** — because DataForSEO is off, the seed/demo data IS the app's content;
  every demo row/report is badged "DEMO" (`is_demo` / `source:"demo"`). Do NOT `flush:demo` at launch.
- **Deploy target = Hostinger KVM2 VPS via Docker** (per `CLAUDE.md`), NOT Vercel — EP-006 PDF uses
  Playwright/chromium, which needs rework to run on Vercel serverless.
- **P12 Optimization Sprint = MANUAL mode** — zero GBP API writes; "apply a fix" = copy value +
  open Google editor link ([[approve-before-publish-immutable-baseline]]).

## Open (deploy HELD on 2 founder decisions)
- **Flag A** — ship-with-demo? (leaning yes; DEMO badges are load-bearing).
- **Flag B** — host VPS vs Vercel? (leaning VPS for Playwright PDF).

## Hard constraints (never violated)
DataForSEO = only paid service · spend-guard on every paid call · no client passwords (OAuth /
manager-access) · approve-before-publish · Devanagari everywhere · RLS enforced (anon blocked).

## Companion records
- [[gmb-sarathi-build-status]] - M0-M6 milestone status and remaining queue.
- [[gmb-sarathi-tech-setup]] - repo, keys, Supabase migrations, blockers, Windows quirks.
- [[gmb-sarathi-uat-fix-list]] - founder UAT findings.
