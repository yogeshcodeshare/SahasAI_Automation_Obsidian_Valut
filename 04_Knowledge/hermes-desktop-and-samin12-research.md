---
title: Hermes-Desktop and Samin12 Repo Research
created: 2026-08-14
tags: [knowledge, hermes, research, samin12, agent]
source: GitHub research (github.com/Samin12), Claude Code planning session
origin: ai
author: claude-code
maturity: emerging
---

# Hermes-Desktop and Samin12 Repo Research

Research from the WhatsApp Automation Plan session, prompted by Yogesh asking to mine github.com/Samin12's broader repo list (beyond the already-known `skills` repo) for anything useful to Sahas AI's own agency tooling — specifically the planned [[ai-tools-stack-3-layer|Hermes]] back-office agent.

## The open question: is `hermes-desktop` the same Hermes?

Samin12 has a repo called **hermes-desktop** — "Mac manager for Hermes using pure SSH" (Swift, 2★/1 fork, updated May 2026). Link: `https://github.com/Samin12/hermes-desktop`.

This is a notable coincidence, not a confirmed match: it manages something called "Hermes" remotely over SSH — architecturally consistent with a self-hosted VPS agent managed from a local machine, which is exactly the shape [[05_Agent-Memory/Hermes/obsidian-vault-access|Hermes's own protocol]] already describes. **Not verified either way.** Could be the same Hermes ecosystem Yogesh has in mind, or an unrelated personal tool that happens to share the name. Check directly before any Phase-4 Hermes build work assumes either way.

## Candidate building blocks, if building Hermes from scratch

None of Samin12's ~127 other repos are purpose-built for WhatsApp/GHL/CRM — his broader work skews toward YouTube/short-form-video content tooling. A few are relevant to *building* Hermes specifically, though none have been evaluated beyond a README-level read:

| Repo | What it is | Why it's relevant |
|---|---|---|
| [obsidian-openclaw-memory](https://github.com/Samin12/obsidian-openclaw-memory) | "OpenClaw skill: Use Obsidian + OpenClaw as an AI memory system" — his most-starred repo (59★/53 forks) | Closest architectural match to Hermes's own already-specified protocol (pull → orient → work → write → push against an Obsidian vault via Git). Worth evaluating as a starting pattern before building that loop from scratch. |
| [Evolving-Brain-Template](https://github.com/Samin12/Evolving-Brain-Template) | Template for an AI-native "second brain" / Life OS | Reusable scaffolding for a personal knowledge-OS structure. |
| [claude-command-center-beta](https://github.com/Samin12/claude-command-center-beta) | "The command center for your AI agents" | A control-panel pattern for running/monitoring an agent once Hermes exists. |
| [zo-automations-snapshot](https://github.com/Samin12/zo-automations-snapshot) | "Git-tracked snapshot of scheduled agents for health checks" | A reusable monitoring pattern — could apply to Hermes itself or to the WhatsApp+n8n+GHL stack's health once running. |

## What Hermes remains, regardless of what this research turns up

Per [[ai-tools-stack-3-layer]] and the Hermes governance docs in `05_Agent-Memory/Hermes/`: strictly personal/agency back-office, never client-facing automation (that stays in n8n), Groq-free-first model routing, no new monthly subscription until Groq proves insufficient. This research doesn't change any of that — it's only about *how* to build it, and *whether* an existing tool already does part of the job.

See [[whatsapp-automation-agency-phased-plan]] for where this sits in the overall roadmap (Phase 4).
