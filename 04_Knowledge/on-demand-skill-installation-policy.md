---
title: On-Demand Skill Installation Policy
created: 2026-08-14
tags: [knowledge, tooling, claude-code, skills, policy]
source: Claude Code planning session (WhatsApp Automation Plan)
origin: ai
author: claude-code
maturity: established
---

# On-Demand Skill Installation Policy

**Policy (Yogesh-confirmed, 2026-08-14): install third-party Claude Code skills on-demand, when a concrete task actually needs one — never preemptively in bulk.**

## Why

During the WhatsApp automation planning session, research surfaced two candidate skill sources: the [Scrapling](https://github.com/d4vinci/Scrapling) web-scraping library (packaged as a Claude Code skill via a third-party directory, claudeskills.info) and the [Samin12/skills](https://github.com/Samin12/skills) repo (244 bundled skills, 2 stars, no license, some with destructive capabilities — force-push, delete, arbitrary code execution). Bulk-installing the latter had no concrete payoff — no WhatsApp/n8n/GHL-specific skill was found in it — so Yogesh's call was to skip it entirely rather than grant standing, automatic access to destructive capabilities for no clear benefit.

## What was actually installed

**`scrapling-official`** — but not via the third-party `npx skills add` installer. Instead: traced the claudeskills.info listing back to its real source (`SKILL.md` lives in Scrapling's own official GitHub repo, authored by the library's maintainer), read it in full plus its example scripts, confirmed explicit safety guardrails (robots.txt compliance, no credential harvesting, authorized-access-only) and no exfiltration risk, then pulled the verified files directly from the upstream repo into the local `.claude/skills/` folder. Same end result as the installer command, without running unaudited third-party code.

## The standing rule going forward

When a third-party skill repo surfaces during research (this will happen again), don't install from it as part of that research pass. Note what's available and wait for an actual task before installing anything specific — and when installing, prefer pulling verified content directly from the tool's own upstream source over running a third-party packaging/install script, the same way `scrapling-official` was handled.

This applies across all of Sahas AI's tooling, not just WhatsApp automation.
