---
title: GMB Sarathi — Build Status
created: 2026-08-02
updated: 2026-08-06
tags: [gmb-sarathi, project, build-status]
source: Claude planning conversation (7-day sprint)
origin: ai
author: claude-code
maturity: established
---

# GMB Sarathi — Build Status

Companion to [[gmb-sarathi]]. Built in a compressed 7-day sprint (M0–M7) using 3 Claude Code agents (main/backend/frontend, git worktrees) + a PM chat. See [[three-agent-worktree-handoff-workflow]].

## Milestones done (~14 Jul 2026)
- **M0** foundations (scaffold, schema+seed, spend guard, CI) ✅ — [[spend-guard-paid-api-cost-control]]
- **M1** audit engine ✅ (Manovedh fixture = acceptance gate: 41 amber, phone missing, "Hospital" generic, services empty, hours 12–9 AM anomaly, reply rate 6.67%, 7 posts/one per 293 days, NAP mismatch, rented subdomain)
- **M1.5** website audit + SSRF guard (SEC-001) ✅
- **M2** grid/teleport ✅
- **M3** AI layer (Groq→OpenRouter, 7 tools) + prompt-injection defenses (SEC-002) ✅
- **M4** PDF (Playwright, one-page, half-ring score gauge, mr/en/hinglish) + XSS→PDF escaping (SEC-003) ✅ **MVP gate MET** (client approved Marathi PDF)
- **M5** dashboard wired to real data ✅
- **M6** Optimization Sprint (P12) manual mode + P9/P11 ✅ — [[approve-before-publish-immutable-baseline]]
- **CR-1** live-data master switch (default OFF, server-enforced) ✅ — [[feature-kill-switch-fail-safe-off]]
- ~292 tests passing, CI green on GitHub Actions.

## Live vs demo
- **Live (₹0/DB):** Dashboard, Businesses, Spend pill, Review Inbox, AI Tools (Groq), Audit Report read (Manovedh backfilled), Settings/CR-1, Client Ops, Settings & Spend.
- **Demo/mock (until DataForSEO funded):** New Audit run, grid, website, resolve, posts-audit — gated behind CR-1 switch (OFF). See [[demo-mode-synthetic-audit-generator]].

## Remaining (Day-7 queue)
Demo-audit mode (highest value — audits without DataForSEO), seed-wide snapshot backfill, GET /api/spend/ledger, M7 public checker + P10, go-live cutover (flush:demo + delete /public/dev), Vercel deploy. Plus [[gmb-sarathi-uat-fix-list]].

## Day-7 update (2026-08-06) — supersedes the queue above
Shipped + merged (`main @ 9e8c891`, CI green, **317 tests**): **demo-audit mode**, **seed-wide snapshot backfill**, **`GET /api/spend/ledger`**, and **all 8 UAT fixes** (see [[gmb-sarathi-uat-fix-list]]). Migration `20260718000001_business_place_id_unique` applied (see [[gmb-sarathi-tech-setup]]).
**Still remaining:** M7 public checker + P10 (deferred → Week 2), and go-live cutover + host deploy — **blocked on Flag A (ship-with-demo?) and Flag B (host VPS vs Vercel?)** in [[gmb-sarathi]]. Do NOT `flush:demo` while DataForSEO is deferred (demo data IS the app's content).

## Review trigger
Revisit this note after each merged sprint, or when a Flag is decided — so a verified-but-stale status surfaces via `updated:` instead of relying on someone noticing.
