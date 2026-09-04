---
title: Sahas AI Global Tooling and Skill Installation Plan
created: 2026-09-04
updated: 2026-09-04
tags: [knowledge, ai-tools, skills, plugins, scraping, agency]
source: ChatGPT planning conversation; https://playwright.dev/agent-cli/installation; https://github.com/apify/crawlee
origin: ai
author: codex
maturity: supported
---

# Sahas AI Global Tooling and Skill Installation Plan

## Operating decision

Install only the small set of tools that supports repeated Sahas AI work. Add third-party skills, plugins, and repositories on demand after checking the official upstream source, license, maintenance, secrets, and client-data boundaries. Do not bulk-install an entire catalog.

Client-critical automation remains in self-hosted n8n; experimental agents and media tools are for internal work or funded client scopes. See [[ai-tools-stack-3-layer]], [[n8n-self-hosting-agency]], and [[on-demand-skill-installation-policy]].

## Already installed globally

- Playwright CLI `@playwright/cli@0.1.19`, verified with its help/version output and a smoke test against example.com.
- Crawlee `3.18.1`, installed globally and version-verified. Crawlee is the reusable crawler framework; individual crawler projects should still declare their own dependencies.
- Lighthouse `13.4.1`, installed globally from the official `GoogleChrome/lighthouse` project and version-verified.
- `@axe-core/playwright` `4.13.0` and Playwright `1.62.1`, installed as development dependencies in `Sahas-AI-Website/frontend` and import-verified.
- `sahas-client-intake`, created and validated in the global Codex skills directory. It structures enquiries into confirmed facts, missing evidence, hypotheses, approvals, and one recommended next step.
- `sahas-business-research`, created and validated in the global Codex skills directory. It defines source quality, confidence labels, permitted research boundaries, and decision-ready output.
- `sahas-competitor-intelligence`, created and validated in the global Codex skills directory. It compares competitors and substitutes using fair, traceable observations and ends with a bounded validation experiment.
- `sahas-client-intake`, `sahas-business-research`, and `sahas-competitor-intelligence` are the completed Sahas skills to date; their staged records are in the operation log.
- Official Playwright CLI skills installed for Claude and Agents skill locations.

These installs came from the official npm package/repository sources. Browser binaries are downloaded by Playwright when required rather than treated as a permanent agency dependency.

## Available connectors observed in the current workspace

Adobe Express, Canva, Creative Production, Data Analytics, Figma, Firecrawl, Gamma, Magnific, Make A Viz, OpenAI Developers, Plugin Management, Spreadsheets, Supericons, and Unsplash. Availability is session/account state, not proof that every connector is globally enabled.

## Recommended execution order

1. Finish vault registration of this plan.
2. Run an accessibility smoke audit with the project-local axe-core/Playwright adapter.
3. Create the next Sahas-specific skill: website strategy. Continue with brand/creative direction, campaign/funnel architecture, local SEO/GBP, AEO/GEO audit, content cascade, automation architecture, asset QA, and client handoff.
4. Add only the connectors needed for a live workflow: Google Drive, Calendar, Airtable, one project-management system, and Apify for a justified scraping job.
5. Adapt high-fit Samin12 workflows one at a time, beginning with branded-motion-sites, content-skill-pack, ContentRepurposeSystem, storyboard/video starters, and media/thumbnail helpers.

## On-demand only

Strix, Premiere Pro MCP, ComfyUI, Wan2GP, Handy, carousel automation repositories, Apify Actors, and Firecrawl paid capacity should be enabled only when a defined project needs them and the license, local resource cost, and data permissions are clear.

Agent Reach and OpenCLI are separately deferred under [[agent-reach-opencli-on-demand-policy]]. Try Crawlee + Playwright first for authorized LinkedIn, Reddit, Facebook, or Instagram work; use these two only as a scoped fallback when the first approach is insufficient.

## Guardrails

Scraping Facebook, Instagram, and YouTube must respect each platform's access rules, authentication boundaries, rate limits, privacy requirements, and terms. Prefer public, permitted data; never bypass login, anti-bot controls, or consent. Use official APIs where they provide the required data. Human approval is required before publishing, outreach, or spend.

Awesome-Hacking and broad agency-agent catalogs are reference material, not global installs. Automatic social publishing, avatar/voice tools, and security testing against systems without explicit authorization remain out of scope.
