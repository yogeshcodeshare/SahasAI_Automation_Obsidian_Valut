---
title: Sahas AI Website Production Deployment
created: 2026-08-05
tags: [project, sahas-ai, website, deployment, dokploy, security]
source: Verified Codex website and Dokploy deployment session (2026-07-31), local checkout review (2026-08-05)
origin: ai
author: codex
maturity: supported
---

# Sahas AI Website Production Deployment

## Purpose and public identity

The public marketing website represents **Sahas AI Business Automation Agency** and is live at [sahasai.in](https://sahasai.in). Public website copy was updated at the founder's request to remove the former name `CHITRARTHA ENTERPRISES` and use **Sahas AI Business Automation Agency**, including the copyright line:

> Copyright 2026 Sahas AI Business Automation Agency. All rights reserved.

The public-name change should not be interpreted as independent proof that every tax, invoice, bank, or statutory record has also changed. Refer to [[gst-legal-structure]] and obtain CA/legal confirmation before making that broader claim.

## Application and release record

- Source repository: `yogeshcodeshare/Sahas-AI-Website`, branch `main`.
- Production service: Dokploy application `frontend`, built with Docker and served by Nginx.
- Verified deployment commit: `e7b93a3d210f2b4d7378af52014449b7bbb19d28` - `Use Sahas AI registered enterprise name`.
- Verified public routes: `/contact`, `/privacy-policy`, and `/terms`.
- Release checks passed before deployment: lint, automated tests, and production build.

The frontend is a React 19 single-page application using CRACO. Its public contact flow opens WhatsApp; it does not use the public website as a data-store for the growth-check form.

## Domain and ingress

- Production domains configured in Dokploy: `sahasai.in` and `www.sahasai.in`.
- Both were configured to reach the Nginx container on port 80 and to use Let's Encrypt HTTPS.
- The temporary `sslip.io` preview domain was deleted after custom domains were added.
- Hostinger VPS firewall was configured to accept TCP ports 22, 80, and 443, then drop other inbound traffic.

The firewall rules and HTTPS hosts were observed during setup, but are time-sensitive. Re-check certificate renewal, both hostnames, and that raw port 3000 is not publicly reachable after any VPS, Dokploy, DNS, or firewall change.

## Important checkout warning

The older local checkout at `C:\Yogesh - personal\Claude\Cluade Projects\Ai Automation\Sahas-AI-Website` was reviewed on 2026-08-05 and still contains the former public-name wording and uncommitted files. Treat it as a stale working copy, not as the approved production source. Before any further site work, locate the active `yogeshcodeshare/Sahas-AI-Website` checkout, pull `main`, verify the latest commit, and run the production checks again.

## Vault contradiction to resolve

The uncommitted companion draft [[sahas-ai-website]] describes the site as preview-only and says the former service-brand footer should remain. This production record contains later deployment evidence from the Codex/Dokploy session. Both notes are retained because the formal legal trade-name status and the public website wording are separate questions. A founder/CA review should decide the authoritative wording for invoices, GST, Meta, and other formal records; do not treat either website note as a substitute for that decision.

## Related notes

- [[sahas-ai-overview]] - agency positioning.
- [[gst-legal-structure]] - legal/tax details requiring separate verification.

## Addendum: self-hosting decision for the website and n8n (2026-08-05)

### Decision

For the Sahas AI marketing website and self-hosted n8n, the selected production direction is the Hostinger KVM2 Ubuntu VPS with Dokploy. The website remains a static React build deployed through Dokploy; n8n is kept as a separate service. Planned hostnames include `dokploy.sahasai.in` for the Dokploy administration panel and `n8n.sahasai.in` for the n8n service. The GitHub repository is private and is connected to Dokploy for controlled deployment.

### Rejected alternative and reason

Vercel was rejected for this combined setup because it can host the static frontend but cannot replace the self-managed Dokploy and n8n services. Using Vercel would split the website and automation stack across providers, add another deployment/secret/ DNS boundary, and weaken the intended single-VPS operating model. This is a hosting decision for the website+n8n combination, not a resolution of the separate GMB Sarathi Playwright/PDF hosting question.

### Depends on

- The KVM2 VPS remains available at an acceptable cost and has sufficient capacity for the website, Dokploy, n8n, backups, and monitoring.
- Dokploy remains maintained and suitable for the required private-repository deployment flow.
- DNS, HTTPS renewal, access control, backups, and secret handling continue to be managed safely.
- The website remains a static frontend and n8n remains the intended self-hosted automation layer.

### Review triggers

Reopen this decision if VPS cost or reliability changes materially, traffic or workflow volume requires horizontal scaling, Dokploy maintenance becomes burdensome, a CDN/edge deployment becomes necessary, or Playwright/PDF workloads create resource or isolation requirements. Review before adding client workloads that could exceed the current capacity assumptions.
