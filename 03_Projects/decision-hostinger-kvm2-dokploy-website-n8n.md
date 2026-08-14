---
title: Decision - Hostinger KVM2 and Dokploy for Website and n8n
created: 2026-08-05
updated: 2026-08-14
tags: [decision, project, sahas-ai, hosting, dokploy, n8n]
source: Founder-approved website and deployment direction
origin: ai
author: codex
maturity: established
status: partially superseded — website portion changed, see Update below
---

# Decision - Hostinger KVM2 and Dokploy for Website and n8n

## Decision

Use the Hostinger KVM2 Ubuntu VPS with Dokploy for the Sahas AI marketing website and self-hosted n8n. Deploy the static React website as a Docker/Nginx service, keep n8n as a separate service, and use the private GitHub repository as the controlled release source.

## Context

The agency needs one operational environment for the public website and its self-hosted automation layer, while retaining control of deployments and avoiding unnecessary providers. The site is static, but n8n needs a long-running self-hosted service.

## Alternatives rejected

- **Vercel for the website** - rejected for this combined setup because it would split the static site from the self-managed Dokploy and n8n services, creating another deployment, DNS, and secret-management boundary.
- **Separate managed hosting for the website and VPS for n8n** - rejected because it adds operational surfaces without solving a current scaling or reliability need.

## Depends on

- [[sahas-ai-website-production]] - the website remains a static React frontend served by Nginx.
- [[n8n-self-hosting-agency]] - n8n remains the intended self-hosted automation layer.
- Assumption: the Hostinger KVM2 VPS remains available at an acceptable cost with sufficient capacity for the website, Dokploy, n8n, backups, and monitoring.
- Assumption: Dokploy remains maintained and suitable for private-repository deployments.
- Assumption: DNS, HTTPS renewal, access control, backups, and secret handling remain safely operated outside this vault.

## Consequences

Website and n8n operations stay together on one VPS and are administered through Dokploy. This choice rules out treating Vercel as the production home for the combined website-and-automation setup. It does not decide hosting for the separate GMB Sarathi Playwright/PDF workload.

## Review trigger

Reopen this decision if VPS cost or reliability changes materially, traffic or workflow volume requires horizontal scaling, Dokploy maintenance becomes burdensome, a CDN/edge deployment becomes necessary, or a new workload creates resource or isolation requirements.

## Update — 2026-08-14: website portion superseded

The **n8n half of this decision is unchanged** — self-hosted n8n stays on this Hostinger KVM2 VPS via Dokploy. The **website half is superseded**: per the WhatsApp automation roadmap's Phase 3, the next website build is planned inside the BizAutomation/GHL platform's included Website/Landing-Page/Forms builder (available from their Starter tier up — see [[bizautomation-reseller-deal]]) rather than a separately-hosted custom React/Nginx site on this VPS. Rationale: once the agency is already paying for the BizAutomation platform for WhatsApp+CRM automation, the included builder is faster and cheaper than maintaining a second deployment surface. A custom-coded site can still be revisited later if the builder proves limiting. This does not affect [[sahas-ai-website-production]]'s existing live site — that stays up; this is about what the *next* iteration builds on. See [[whatsapp-automation-agency-phased-plan]].
