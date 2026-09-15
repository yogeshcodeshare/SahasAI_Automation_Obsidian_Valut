<!-- INGEST: NEW -> 01_Agency -->
---
title: Free Business Brand Kit — Lead-Magnet Funnel Plan
created: 2026-08-14
tags: [agency, offering, lead-magnet, branding, funnel]
source: Founder plan (Claude planning conversation)
origin: ai
author: claude.ai
maturity: emerging
---

# Free Business Brand Kit — Lead-Magnet Funnel Plan

A website lead magnet: prospects get a free AI-generated brand kit PDF; Sahas AI gets a qualified lead (name, business, website, WhatsApp). Uses the reusable prompts in [[brand-imprint-extractor-prompt]] and [[brand-book-kit-mega-prompt]].

## The funnel (planned)
1. Home-page button **"Free Business Brand Kit"** → opens a short form: customer name, business name, website URL, WhatsApp number → Continue.
2. Lands on a page that **shows Sahas AI's own brand kit** as the proof/example, plus "what you need before the 15-min Q&A."
3. After the WhatsApp number is captured → present the Brand Imprint questions with **blank answer boxes** and a **suggested answer** beside each, pre-drafted from the user's inputs + a scrape of their website.
4. User reviews/edits answers → on submit, generate the **brand-book PDF** and **send it on WhatsApp**.

## How Sahas AI built its OWN brand kit (shown on the landing page as proof)
- **Logo:** iterated in Google **Gemini** with **nano-banana** image generation until finalized; then **Recraft** to produce the vector **SVG** (`Sahas_AI_Production_Master_Tight.svg`).
- **Mockups & photos:** generated in **Google Flow** — assets stored locally at `C:\Yogesh - personal\Claude\Cluade Projects\google flow sahas AI logo photos`.
- **Brand answers:** drafted with ChatGPT + the vault, founder-edited and finalized → see [[brand-imprint-sahas-ai]].
- **Visual identity:** deep ink + warm off-white + saffron-gold; premium/calm/practical (see [[sahas-ai-logo-direction]]).

## Reusable engine (save once, reuse per customer)
- [[brand-imprint-extractor-prompt]] — the 15-question interview that produces the Brand Imprint doc.
- [[brand-book-kit-mega-prompt]] — turns a completed Brand Imprint into a designed 18–24pp brand-book PDF (FPDF2).

## Guardrails (carry into every generated kit)
- Never fabricate testimonials, metrics, case studies, or partner credentials for the customer.
- Keep honest evidence boundaries (same rule Sahas AI applies to itself — [[brand-imprint-sahas-ai]]).
- Website scraping for "suggested answers" = public data only; store the lead per the WhatsApp/consent model in [[whatsapp-api-onboarding]].

## Status
Concept/plan (emerging). Not built. Fits the "GMB audit / lead magnet → upsell" door-opener pattern in [[agency-go-to-market-sequence]].
