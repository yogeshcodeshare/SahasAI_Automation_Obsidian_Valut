# Operation Log

Append-only record of every ingest, query-filed-back, and lint pass against this vault.
**Never edit or delete past entries — only append.**

Why it exists: five different tools write here (Claude Code, Codex, Hermes, Claude.ai, ChatGPT).
This log is the shared audit trail that lets any of them see what already happened, avoid
re-ingesting the same source, and answer "when did we learn this?".

## Entry format

Start every entry with this exact prefix so the log stays greppable with plain tools:

```
## [YYYY-MM-DD] <op> | <Title>
```

Where `<op>` is one of `ingest`, `query`, `lint`. Follow with 1–3 lines: what was processed,
which notes were created/updated, and the agent that did it.

Recent entries:

```bash
grep "^## \[" log.md | tail -10
```

---

## [2026-08-02] setup | Vault initialized
Structure, protocol files, and sync configured. No knowledge content ingested yet.
Agent: claude-code

## [2026-08-02] ingest | Full agency knowledge base
Ingested the Sahas AI knowledge base from the Claude planning chats: 6 agency notes (01_Agency), 4 Manovedh client notes (02_Clients/manovedh), 3 GMB Sarathi project companions (03_Projects), 6 knowledge/research notes (04_Knowledge). MOC + all _index.md updated. 19 notes total; no duplicates of the existing 5 pattern notes.
Agent: claude-code

## [2026-08-04] setup | Phase 0 conventions + MCP rule
Added maturity: front-matter, decision-record template, reweave operation, lint mechanical/substantive split, multi-agent transaction discipline, and MCP usage rule. CLAUDE.md + AGENTS.md updated.
Agent: claude-code


## [2026-08-04] setup | MCP tool guardrails
Named the specific Obsidian MCP tools agents may and may not call (no vault_delete, no command_execute; prefer git for writes). CLAUDE.md + AGENTS.md updated. Codex and Claude Code both verified connected.
Agent: claude-code

## [2026-08-05] ingest | Website, WhatsApp onboarding, and current brand boundaries
Processed the local Sahas Website project documents and founder design direction. Created website, WhatsApp onboarding, and logo-direction notes; corrected the AI-written brand note to distinguish the chosen public brand from unverified registration status.
Agent: codex

## [2026-08-05] ingest | Sahas AI website production deployment
Added the verified public website, legal-name display, Dokploy, domain, firewall, and stale-checkout record as [[sahas-ai-website-production]]. Updated MOC.md and 03_Projects/_index.md.
Agent: codex

## [2026-08-05] ingest | Website record reconciliation
Reconciled the architecture and brand-boundary notes with the production deployment record: the public site is live, but the formal legal/trade-name status is still tracked separately.
Agent: codex


## [2026-08-05] ingest | WhatsApp automation SOP, CRM model, forms and templates
Ingested 12 new notes + 5 append-sections drafted in Claude Desktop (which has no vault write access). New: whatsapp-lead-sop-8-stage, crm-and-field-model, lead-stages-pipeline, agency-automation-plan, whatsapp-message-templates-mr-hi-en, agency-intake-form, coaching-intake-form, client-onboarding-brief (01_Agency); whatsapp-api-pricing-model-india, sop-agent-7-step-method, training-lesson-3-sop-crm-logic (04_Knowledge); whatsapp-automation-deliverables (03_Projects). Appended to sahas-ai-overview, pricing-ladder, ai-tools-stack-3-layer, coaching-class-vertical-playbook, whatsapp-automation-vendors. Desktop's overlap map was stale (built before codex added whatsapp-api-onboarding); the Veblika append was trimmed to capacity/building-blocks and cross-linked instead of restating onboarding status. The pricing-ladder append was trimmed to avoid duplicating the existing price table. All notes maturity: supported except whatsapp-automation-deliverables (established, per founder). ai-tools-stack-3-layer promotion still pending founder confirmation. MOC.md and three _index.md updated.
Agent: claude-code

## [2026-08-05] lint | Backfill maturity across all pre-schema notes
Added the maturity: field to 24 notes written before the field existed (2026-08-04). Founder approved: established for gst-legal-structure, bizautomation-reseller-deal, manovedh-profile, gmb-sarathi-build-status, gmb-sarathi-tech-setup, gmb-sarathi-uat-fix-list. emerging for pricing-ladder (its own text says validate on first 3 sales calls), manovedh-review-hesitancy, manovedh-free-month-plan, grexa-competitor-intel, coaching-class-vertical-playbook. Remainder supported. gmb-sarathi and the 5 GMB build-pattern notes defaulted to supported pending founder review - not self-promoted. Welcome.md and PROTOCOL.md left alone (not knowledge notes). Verified the earlier 19-note ingest (commit 912252d) landed complete: all on disk, tracked, indexed in MOC and folder indexes.
Agent: claude-code

## [2026-08-05] lint | Full vault pass
Audited all 41 knowledge notes. Clean: every note listed in MOC.md, zero broken wikilinks, zero front-matter gaps, maturity present everywhere. Fixed 2 orphans by adding inbound links - gmb-sarathi now lists its three companion records, and whatsapp-lead-sop-8-stage links the shipped deliverables note. Verified commits 2576c84 (brand/website/WhatsApp onboarding, ChatGPT) and dca2b49 (website production record, Codex) both landed complete. Flagged for founder: the ChatGPT "Plan Sahas AI website build" session only READ the vault and wrote nothing, so its planning content is not captured.
Agent: claude-code

## [2026-08-05] ingest | Website visual addendum and self-hosting decision
Appended the approved visual/interaction direction to [[sahas-ai-website]] and the Hostinger KVM2 + Dokploy website/n8n decision record, including the rejected Vercel alternative, dependencies, review triggers, and planned Dokploy/n8n subdomains. No MOC or folder-index entries were added because both target notes were already indexed. Confirmed the GMB Sarathi VPS-vs-Vercel flag is a separate application decision and was not changed. Both addenda remain maturity: supported.
Agent: codex
