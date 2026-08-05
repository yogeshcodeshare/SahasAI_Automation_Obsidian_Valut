---
title: Sahas AI Website
created: 2026-08-05
tags: [project, sahas-ai, website, marketing]
source: Sahas-AI-Website local documentation and the verified deployment record
origin: ai
author: codex
maturity: supported
---

# Sahas AI Website

## Purpose

The website is a minimal, informative, WhatsApp-first agency site for Sahas AI. It should establish credibility for local businesses and support Veblika/Meta onboarding without inventing client results, ratings, team size, or case studies.

## Current implementation

- Separate local repository: `Sahas-AI-Website`.
- Static-first React site (CRA + CRACO, Tailwind, shadcn/ui primitives, Framer Motion).
- Public routes: Home, Services, About, Contact, Privacy Policy, Terms, and an internal Design System page.
- Copy is centralised in `frontend/src/config/site.js`.
- Every conversion CTA opens the agency WhatsApp flow; the growth-check form validates in-browser and does not store form data.
- Site language is English-first with Marathi-safe typography and Marathi-ready CTA support.

## Content and safety rules

- Core message: help local businesses get found on Google, reply faster on WhatsApp, and remove repetitive work.
- Include the interim legal footer from [[brand-name-sahas-ai]].
- No fabricated performance claims, testimonials, logos, awards, metrics, dashboards, or guarantee of Google ranking.
- Do not deploy the optional backend for version 1. The public marketing site needs no database, authentication, or paid API.

## Deployment status

The public site is live at [sahasai.in](https://sahasai.in). The older local `Sahas-AI-Website` checkout still describes a preview-ready implementation and carries older public-name wording, so it must be treated as a **stale working copy**, not the production source of truth. Before future site changes, locate the active repository checkout, pull its `main` branch, and repeat the production checks. Deployment and ingress details live in [[sahas-ai-website-production]].

## Open work

1. Approve the original logo and final public tagline.
2. Keep the live site, certificate, and public routes checked after any DNS/VPS/Dokploy change.
3. Verify public copy against the formal trade-name, tax, and invoice status before changing legal claims.
4. Use the live website in the Meta/Veblika business-verification package.

Related: [[brand-name-sahas-ai]], [[sahas-ai-logo-direction]], [[whatsapp-api-onboarding]], [[service-offerings]].

## Addendum: approved visual direction from website-planning review (2026-08-05)

The founder's preferred direction is a premium editorial, scroll-led marketing site. The Spark Interact screenshot and insell.io were supplied as visual and content references only; the implementation must remain original and must not copy distinctive artwork, layouts, or marks.

- Use a dark ink/green hero and CTA sections, warm cream content sections, and a restrained saffron/orange accent.
- Use a professional display face paired with a highly readable sans-serif body face, with strong hierarchy and generous whitespace.
- Keep the home page structured around the three practical systems: **Get found on Google**, **Reply faster on WhatsApp**, and **Remove repetitive work**.
- The “Get found on Google” visual should use the founder-supplied static Karad map image as a subdued background layer, with a clear location marker and business-card overlay; it must remain legible and decorative rather than imply live Google data.
- The WhatsApp section should show an understandable mobile conversation mock-up, and the repetitive-work section should show a centered, readable n8n-style workflow path with nodes, approval state, and a clear completion signal.
- Add tasteful scroll-reveal, path-drawing, and staggered-card motion with `prefers-reduced-motion` support. Animations must explain the workflow rather than distract from the CTA.
- Maintain responsive mobile layouts, accessible contrast, keyboard navigation, and working links to Services, About, Contact, Privacy Policy, and Terms.
