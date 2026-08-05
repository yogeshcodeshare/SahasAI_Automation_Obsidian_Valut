---
title: GMB Sarathi — Tech Setup, Keys, Blockers
created: 2026-08-02
tags: [gmb-sarathi, project, infra, keys]
source: Claude planning conversation
origin: ai
author: claude-code
maturity: established
---

# GMB Sarathi — Tech Setup, Keys, Blockers

Companion to [[gmb-sarathi]] and [[gmb-sarathi-build-status]]. No secrets stored here (see vault rule 5).

## Repo & folders
- GitHub: yogeshcodeshare/GMB_Automation (private). Local: `...\Ai Automation\GMB Automation Project Source Code`. Worktrees: `..\GMB_Automation-backend`, `..\GMB_Automation-frontend`.
- Stack: Next.js 14 + TS + Supabase (Postgres/Auth/Storage/RLS) + Vercel (interim) → Hostinger VPS later.

## Keys collected (in .env.local, never committed)
DataForSEO login/pw, Supabase URL+publishable+secret, Groq, PSI, Google OAuth (Testing mode), Cloudflare Turnstile, FEATURE_PDF=on. Deferred: OpenRouter (Groq-only accepted), WhatsApp (Veblika pending).

## Supabase migrations applied (in order)
init_schema, seed, spend_functions, grants (fixed RLS-without-GRANTs bug), grid_top_ranks, is_demo, ai_fixes_type, dataforseo_live_enabled (CR-1), sprint_p12_hardening (baseline immutability trigger).

## Externally-gated blockers (NOT bugs — waiting on outside world)
1. **DataForSEO UNVERIFIED** → paid endpoints 403 (40104). Needs a **$50 deposit** to activate (client DEFERRED). Everything gated behind CR-1 (OFF). Unlocks live audits/grids/competitor data.
2. **GBP API publishing** needs Google approval → requires a verified GBP 60+ days old where the account is Manager. Plan: create Sahas AI's own GBP to start the 60-day clock, or get added as Manager on Manovedh's. Reading = DataForSEO; writing = Google API. Until then: manual mode.
3. **WhatsApp** live = when Veblika keys arrive.

## Windows quirks (any agent running commands)
- Prepend `$env:Path = "C:\Program Files\nodejs;$env:Path"` in EVERY shell.
- Execution policy RemoteSigned.
- Never run `next build` while `next dev` runs (clobbers .next → 500). Fix: remove .next, npm run dev.
- Gates: npm run typecheck / lint / test / build; verify: m0:verify, test:rls.
