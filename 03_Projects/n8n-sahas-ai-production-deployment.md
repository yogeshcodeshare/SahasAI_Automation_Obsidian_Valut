---
title: n8n Sahas AI Production Deployment
created: 2026-09-28
tags: [project, n8n, dokploy, hostinger, postgresql, deployment]
source: Codex deployment conversation and supplied Dokploy/n8n screenshots, 2026-09-16 to 2026-09-28
origin: ai
author: codex
maturity: supported
---

# n8n Sahas AI Production Deployment

## Verified current state

- The self-hosted n8n instance is reachable at `https://n8n.sahasai.in` through Dokploy on the Hostinger KVM2 VPS.
- n8n owner login was confirmed after deployment.
- The active n8n service is deployed with Docker Compose and uses PostgreSQL 17. The PostgreSQL container was shown healthy and accepting connections after the change.
- The n8n image shown in Dokploy is `docker.n8n.io/n8nio/n8n:2.39.5`.
- The active named volumes are `n8n_data` for n8n application data and `n8n_postgres17_data` for PostgreSQL 17 data.
- The compose configuration retains `N8N_ENCRYPTION_KEY` as a Dokploy environment reference and sets `N8N_UNVERIFIED_PACKAGES_ENABLED: "false"`. Secret values are intentionally not recorded here.

## PostgreSQL 16 to 17 transition

- A SQL export named `n8n-pg16.sql` was created from the former PostgreSQL 16 database inside its container and its existence was checked.
- The prior PostgreSQL 16 volume, `n8n_postgres_data`, remains declared as a rollback artifact but is not the active database volume.
- Do not remove the old volume until the instance has been stable through real workflow use and a separate recoverable backup exists. Its removal was deliberately deferred.

## Current operating choices

- This is currently a practice and internal Sahas AI environment. Automated off-server backups are deferred for roughly 15–20 days while workflows are being learned.
- Before client-critical workflows or credential-heavy client automations are activated, configure and test a recoverable backup process. Export workflow JSON manually during the practice period.
- Two-factor authentication is also deferred by Yogesh during personal practice. The public login must continue using a strong unique password; enable 2FA before granting client/team access or operating client-critical workflows.
- Folders are available for workflow organization (`Sahas AI Automation` and `Test` were created), but folders alone do not create client credential isolation. For future client isolation, use separate n8n instances/containers and domains when isolation is required; revisit the earlier capacity/tenancy guidance before selling shared hosting.

## Warnings observed

- n8n logs showed a task-runner Python-related internal-mode error/warning and PostgreSQL 16 compatibility warning before the PostgreSQL 17 transition. The running n8n service remained reachable. Treat task-runner configuration as a future hardening item; do not alter it without a specific verified requirement.
- The Docker terminal's `Bash` option failed for the n8n image because Bash is not installed. Use `/bin/sh` in that container when a shell is genuinely needed.

## Next safe actions

1. Keep learning with non-critical workflows in the `Test` folder.
2. Export important workflows manually after meaningful changes.
3. Before client production use: enable 2FA, establish and restore-test off-server backups, review access/isolation, and confirm current n8n licensing and tenancy capabilities.

## Related notes

- [[decision-hostinger-kvm2-dokploy-website-n8n]]
- [[n8n-self-hosting-agency]]
