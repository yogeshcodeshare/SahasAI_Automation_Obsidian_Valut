---
title: Agent Reach and OpenCLI On-Demand Scraping Policy
created: 2026-09-04
tags: [knowledge, scraping, playwright, crawlee, opencli, agent-reach, privacy]
source: https://github.com/Panniantong/Agent-Reach; https://github.com/jackwener/opencli; user decision in ChatGPT planning conversation
origin: ai
author: codex
maturity: supported
---

# Agent Reach and OpenCLI On-Demand Scraping Policy

## Decision

Do not install Agent Reach or OpenCLI globally yet. First use the approved Crawlee + Playwright approach for a defined, authorized scraping task. If that approach cannot access or reliably operate the required LinkedIn, Reddit, Facebook, or Instagram workflow, evaluate Agent Reach and OpenCLI for that specific task and install only the needed channel or adapter after reviewing the current upstream instructions.

## Why they remain available as a fallback

Agent Reach is a local capability layer that routes to upstream tools and reports channel health. Its official channel table describes YouTube, web, GitHub, RSS, and Bilibili as basic channels, while Facebook, Instagram, Reddit, and some LinkedIn functions require browser login, additional configuration, or a separate upstream tool. OpenCLI provides browser adapters and a Chrome Browser Bridge for logged-in sessions.

## Safe use boundary

- Use only public business/page data or accounts explicitly authorized by the owner.
- Do not scrape personal profiles, followers, commenters, reviewers, private groups, or private messages.
- Do not bypass login barriers, CAPTCHA, anti-bot controls, rate limits, consent, or platform terms.
- Never pass cookies, tokens, or passwords into the vault or chat history.
- Use a secondary account for any approved browser-session experiment and keep the scope small.
- Human approval is required before storing research, contacting people, publishing, or spending money.

## Selection rule

1. Define the exact source, fields, volume, purpose, and permission.
2. Try Crawlee + Playwright with conservative rate limits and a small test.
3. If blocked or incomplete, check whether an official API or permitted export solves the need.
4. Only then evaluate the required Agent Reach/OpenCLI channel, run its diagnostics, and document the result and limitations.
5. Remove or disable the fallback when the project no longer needs it.

Agent Reach and OpenCLI are research fallbacks, not replacements for production crawling infrastructure or permission to collect platform data.

