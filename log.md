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

## [2026-08-05] ingest | Business-plan sequence and current operating state
Created [[agency-go-to-market-sequence]] and appended current operating state to [[sahas-ai-overview]] plus the explicit 5–8-client reseller review trigger to [[bizautomation-reseller-deal]]. Pricing and existing offer/vertical/SOP notes were intentionally left unchanged.
Agent: chatgpt

## [2026-08-05] ingest | Website legal boundary and hosting decision
Appended explicit Udyam-versus-formal-record evidence boundaries to the brand, GST, and website notes; moved the Hostinger KVM2 + Dokploy decision into [[decision-hostinger-kvm2-dokploy-website-n8n]]; and replaced the duplicated deployment addendum with a pointer. Updated MOC.md and 03_Projects/_index.md.
Agent: codex

## [2026-08-05] lint | Remove PAN number; add explicit never-store list
Founder-approved redaction: removed the PAN value from gst-legal-structure.md (GSTIN retained). Added a concrete "never store" list to CLAUDE.md and AGENTS.md covering PAN, Aadhaar, bank/UPI, credentials, and client personal contact details, so no future agent re-adds them. Note: git history still contains the PAN in earlier commits - scrubbing it fully would require a history rewrite that breaks other clones; the repo is private, so redaction going forward is the proportionate fix. STILL OUTSTANDING: manovedh-profile.md holds a client's personal phone and personal email, not yet removed.
Agent: claude-code

## [2026-08-05] lint | Remove client personal contact details
Founder-approved: removed Dr Sachin Patil's personal phone and personal email from manovedh-profile.md, replaced with a pointer to the CRM. The note keeps all business context (clinic, treatments, GBP data, acquisition story, testimonial). Vault PII scan is now clean apart from Veblika's publicly listed business support line, which is fine. As with the PAN, earlier git commits still contain these values; the repo is private and a history rewrite would break other clones.
Agent: claude-code

## [2026-08-06] ingest | GMB Sarathi Day-7 UAT fixes shipped; three notes refreshed
Appended to [[gmb-sarathi-uat-fix-list]] (UAT-1..8 all resolved, one-line fix each), [[gmb-sarathi-build-status]] (demo-audit mode, seed-wide snapshot backfill, and GET /api/spend/ledger now shipped; 317 tests, main @ 9e8c891; added a "revisit after each merged sprint or when a Flag is decided" review trigger), and [[gmb-sarathi-tech-setup]] (added migration 20260718000001_business_place_id_unique). Set updated: 2026-08-06 on all three; maturity stays established — the work is verifiable on main @ 9e8c891. No MOC or _index changes because all three notes were already indexed. Flags A and B remain open, so no decision note was created.
Agent: claude-code

## [2026-08-06] ingest | GHL deferral decision record (first inbox handoff)
Processed 00_Inbox/decision-ghl-deferral.md, drafted in Claude.ai (files but no git push) using the new inbox-drop workflow. Filed to 01_Agency, INGEST directive stripped, indexed in MOC.md and 01_Agency/_index.md. Formalises the previously informal GoHighLevel deferral that had been flagged three times: decision (Veblika + n8n + Sheets), alternatives rejected (GHL now - cost + rented-rails dependency; DoubleTick - annual-only billing), depends-on including the explicit "Sheets + n8n cover the pipeline" assumption, consequences, and three review triggers. Left at origin: ai / maturity: supported - promotion to established and origin: human is the founder's call. No duplicate: the only other decision note is decision-hostinger-kvm2-dokploy-website-n8n (hosting, unrelated).
Agent: claude-code

## [2026-08-06] ingest | Class 4 video notes (compliance, tagging, contact management)
Notes created: 5, updated: 0. All in 04_Knowledge.
Source: the Class 4 course recording (39:03), transcribed via Whisper and cross-read against 39 UI screenshots, plus the Veblika knowledge-base document and veblika.com/products/whatsapp-automation. Created training-lesson-4-tagging-contacts-compliance (mirrors the Lesson 3 note), plus four atomic notes: whatsapp-marketing-capping-and-deliverability, whatsapp-number-safety-warm-up, whatsapp-tag-numbering-convention, bizautomation-contact-filtering-and-import. Dedupe: searched for capping, utility message, opt-out, cold broadcast, CSV, country code, OR group and numbering — no existing coverage, so no merges. Deliberately did NOT restate the pipeline stages or field model; those live in lead-stages-pipeline and crm-and-field-model and are linked instead. whatsapp-api-pricing-model-india covers message COST; the new capping note covers DELIVERABILITY, and the two cross-reference. All left at origin: ai / maturity: supported — these are the trainer's claims, not practices Sahas AI has validated, matching the precedent set by the Lesson 3 note. No secrets or PII in the source material. 00_Inbox/append-gtm-framework-sharpeners.md left untouched — pre-existing and unrelated to this run.
Agent: claude-code

## [2026-08-06] ingest | Class 4 second frame pass — whiteboard + curriculum
Notes created: 2, updated: 1. All in 04_Knowledge.
A second frame pass over the first 10 minutes of the Class 4 recording — a stretch the first pass never sampled, because the transcript-cue method only fires where the speaker talks about what is on screen. It surfaced two things no transcript could contain. First, a hand-drawn whiteboard reading SOP -> Automation -> AI with 'predictable' and 'defined' beneath Automation: the conceptual spine of the course, drawn in silence, now sop-automation-ai-progression. Second, the course sidebar, giving the full 12-lesson module, the platform (client.automationsaathi.com), the instructor account and the in-lesson signup link, now whatsapp-course-curriculum-map. The curriculum note also records that the local capture is 39:03 against a 50:38 original, so a topic missing from our notes may simply be outside the recorded portion — worth checking before concluding it was not taught. Updated training-lesson-4-tagging-contacts-compliance with updated: 2026-08-06, a link to the whiteboard note, and a course-context section. Both new notes left at origin: ai / maturity: supported. Method note for future runs: cue-frame sampling finds what the speaker DESCRIBES and misses what he DRAWS — a long stretch with no cue frames deserves its own sweep.
Agent: claude-code
