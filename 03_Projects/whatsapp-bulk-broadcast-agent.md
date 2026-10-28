---
title: WhatsApp Agent Team — Agent 4 Bulk Broadcast (Veblika + n8n)
created: 2026-10-27
updated: 2026-10-28
tags: [project, whatsapp, veblika, n8n, supabase, broadcast, renault]
source: Claude Code build session 2026-10-26/27; local "What's App Automation/WhatsApp Team/04 Bulk Broadcast Agent" (plan, BUILD-STEPS, templates)
origin: ai
author: claude-code
maturity: supported
---

# Agent 4 — Bulk Broadcast

Fourth agent of the WhatsApp Agent Team (after the Renault reply agent [[renault-whatsapp-agent-veblika]], lead qualification and follow-up). Sends one approved template to an opted-in segment, slowly and with a full log. Built and tested 2026-10-26/27; not yet published.

## Decisions (Yogesh, 2026-10-26)
- Campaigns are entered in the Google Sheet tab `Campaigns`; only Yogesh sets `status = approved`.
- Cap **150** per campaign (per [[whatsapp-number-safety-warm-up]]).
- Stop/finish alerts go to the dealership's service advisor via template `broadcast_alert`.
- First campaign: Festive check-up (`festive_checkup_mr/hi/en`, Marketing, approved).

## Shape (two n8n workflows)
- **4a Preview**, every 15 min: `draft` rows → count matching leads → write `preview_count` + 5 sample names. Never sends.
- **4b Sender**, every 5 min, 10:00–20:00 Mon–Sat: first `approved` row with `send_at` passed → `running` → send one at a time, **4 s apart, 2 min pause after every 20** → `done` + totals + alert.
- Audience filter: `opt_in_whatsapp = true`, `opt_out_whatsapp = false`, `last_marketing_at` older than 24 h, plus campaign filters (car_model, score, stage_max, language).
- **Safety gate:** every 20 sends, if failures > 10 % → `stopped` + alert. Failed sends are logged, never retried (Meta 131049, see [[whatsapp-marketing-capping-and-deliverability]]).

## Duplicate protection (two layers)
1. `leads.last_marketing_at` — no lead gets two marketing messages within 24 h.
2. Supabase `broadcast_log` with `unique (campaign_id, phone)` — the same campaign never goes to a number twice, checked before sending.

## Sheet mirrors Supabase
The CRM sheet now has tabs named exactly like the Supabase tables (`leads`, `appointments`, `activity`, `broadcast_log`) with identical column names, ready for a later Sheet ↔ Supabase sync (deliberately not built yet; the voice agent team comes later).

## Test status (2026-10-27)
Passed: preview count, festive template send, log + `last_marketing_at`, sheet `done`, advisor alert, re-run sends nothing, Stop button opts out via Agent 1. Not yet tested: safety gate with ~20 fake numbers.

## Lessons
- n8n Google Sheets node set to a tab **by name** before the tab exists fails with "Sheet is required" — point it at the tab's gid once created.
- Supabase node "Filters (String)" accepts raw PostgREST filters, including `or=(...)` and `in.(...)`, which the manual filter UI cannot express.
- An empty re-run must not overwrite earlier `sent/failed` totals in the sheet.

Template wording rules: [[whatsapp-broadcast-template-lessons]].

## Update 2026-10-28
- Part of [[whatsapp-agent-team-renault]]. Fixes: 4a "draft" filter restored (lost to an editor save), all approved rows read, Pause 4 s unit set, `Campaigns!A1` header restored to `campaign_id`, an empty re-run no longer overwrites earlier sent/failed totals.
- The Sheet tabs `leads`, `appointments`, `activity`, `broadcast_log` are now filled automatically by the Supabase → Sheet Sync workflow (every 10 min, one-way).
