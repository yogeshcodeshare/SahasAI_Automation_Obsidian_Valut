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

## [2026-08-07] ingest | Class 5 video notes — WhatsApp Templates Mastery
Notes created: 4, updated: 1. All in 04_Knowledge.
Source: the Class 5 recording (55:40), transcribed via Whisper/Groq into 567 segments and cross-read against 58 UI screenshots at 1024px, plus the Veblika knowledge base. Created training-lesson-5-templates-mastery (mirrors the Lesson 3 and 4 notes) plus three atomic notes: whatsapp-template-anatomy, whatsapp-template-categories-and-approval, compress-media-before-upload. Updated whatsapp-course-curriculum-map to point lesson 5 at its note, with updated: 2026-08-07. Dedupe: searched template anatomy, carousel, quick reply, compress, header/body/footer, authentication, approval, variable, 1024 and 160-char — no existing coverage, nothing merged. The existing whatsapp-message-templates-mr-hi-en note is a template LIBRARY (content); the new anatomy note is the STRUCTURE, and they cross-reference rather than overlap. whatsapp-api-pricing-model-india covers what each category costs; the new categories note covers what each category can do. The commercially useful finding is the STOP-button practice: Meta does not require an unsubscribe quick reply on marketing templates, but a customer who taps it costs one contact while a block or report damages the number's quality rating for every contact — worth making a Sahas AI template standard. Also recorded: templates are the ONLY way to broadcast on the API, which retroactively explains why Class 4's broadcast demonstrations all depended on a lesson that had not happened yet. All new notes at origin: ai / maturity: supported. No secrets or PII in the source material.
Agent: claude-code

## [2026-08-07] ingest | Class 6 video notes — WhatsApp Catalog & Payments
Notes created: 5, updated: 1. All in 04_Knowledge.
Source: the Class 6 recording (52:02), transcribed via Whisper/Groq into 513 segments and cross-read against 64 UI screenshots at 1024px. Created training-lesson-6-catalog-payments plus four atomic notes: whatsapp-catalog-setup, meta-business-portfolio-map, whatsapp-api-billing-credit-line, whatsapp-payment-configuration-india. Updated whatsapp-course-curriculum-map to point lesson 6 at its note. Dedupe: searched catalog, catalogue, commerce manager, business portfolio, credit line, billing, razorpay, payment gateway, shops and content id — no existing coverage of the commerce material, nothing merged. meta-business-verification-notes covers the VERIFICATION process; the new portfolio note covers the settings STRUCTURE, and they cross-reference. Billing (paying Meta for messages) and payment configuration (collecting from customers) are deliberately separate notes because they are different money flows that people conflate. Three findings worth acting on. (1) A catalog template must be Marketing: mislabelling marketing as utility repeatedly teaches Meta's classifier the pattern and gets your genuine utility templates reclassified as marketing — capped and ~6x more expensive, gradually and invisibly. (2) Shops are NOT available in India, stated on Meta's own screen — catalogues and ads still work, but there is no Facebook/Instagram storefront, so check before promising a client one. (3) A client cannot send any marketing message until a card is attached at Meta, which is a finance conversation that belongs at the start of an engagement rather than on launch day. Also recorded: the trainer catalogues SERVICES not goods, which maps directly onto making the Sahas AI service-offerings a WhatsApp-sendable product list. Note on sources: neither the Veblika knowledge-base document nor veblika.com/products/whatsapp-automation mentions catalog, shopping or payments, so the video is the sole source for this lesson and nothing was supplemented from those references. All new notes at origin: ai / maturity: supported. No secrets or PII.
Agent: claude-code

## [2026-08-07] ingest | Class 7 video notes — Building WhatsApp Forms
Notes created: 3, updated: 1. All in 04_Knowledge.
Source: the Class 7 recording (28:24), transcribed via Whisper/Groq into 217 segments and cross-read against 50 UI screenshots at 1024px. Created training-lesson-7-whatsapp-forms plus two atomic notes: whatsapp-forms-builder-reference and whatsapp-forms-json-portability. Updated whatsapp-course-curriculum-map to point lesson 7 at its note. Dedupe: searched whatsapp form, flow builder, playground, json, date picker, dropdown, opt-in and field type — WhatsApp Forms appeared only as forward references in the lesson 4 and 6 notes, and no existing note covers the builder itself. Nothing merged. The connection worth recording: agency-intake-form, coaching-intake-form and client-onboarding-brief already specify WHAT to ask; this lesson is HOW to ask it inside WhatsApp; and the JSON export is what makes each form reusable across client accounts. The json-portability note links all three explicitly, because building a standard form library once and deploying it per client in seconds is a concrete agency practice rather than a course detail. Two rejection rules recorded because the trainer states each twice: form button text must be 20 characters or fewer, and a variable can never sit at the very start or very end of a template body. Note a conflict with the Class 5 note: whatsapp-template-anatomy records 25 characters for CTA button titles, this lesson shows 20 enforced for the form button. Both were read from the interface; the forms note flags the discrepancy rather than silently overwriting the earlier figure. Also worth stealing: the trainer writes the template body in English and Marathi in the same message, so one approved template serves both audiences. As with Class 6, neither Veblika reference covers this material — the video is the sole source. All new notes at origin: ai / maturity: supported. No secrets or PII.
Agent: claude-code

## [2026-08-07] ingest | Class 8 video notes — Workflow vs AI Automation
Notes created: 3, updated: 2. All in 04_Knowledge.
Source: the Class 8 recording (50:59 as captured), transcribed via Whisper/Groq into 438 segments and cross-read against 81 UI and whiteboard screenshots at 1024px. Created training-lesson-8-workflow-vs-ai-automation plus two atomic notes, automation-trigger-and-action and ai-agent-five-components, plus the platform reference whatsapp-chatbot-builder-reference. Updated whatsapp-course-curriculum-map to point lesson 8 at its note. Dedupe: searched trigger, action, chatbot, agent, workflow, drip and if/else — the only genuine overlap was sop-automation-ai-progression, which already named lesson 8 as its deep treatment. Rather than create a near-duplicate, that note was APPENDED with the boundary rule it lacked (where workflow automation can be set up, AI is not needed) and its updated: field set. The distinction recorded verbatim from the whiteboard: workflow automation handles set/defined queries, AI automation handles dynamic queries. Two findings not in the trainer's audio, read from the interface: an Enable Fuzzy Matching toggle on the On Message trigger (never mentioned aloud), and the list-message limit being ten rows in TOTAL across all sections rather than ten per section. Both recorded in the builder reference. Also worth keeping: the reusable-keyword pattern — give a button a stable keyword and build one flow per keyword, so templates call a shared library of flows instead of each owning its own. Capture note: the supplied recording runs 50:59 against an original session of approximately 1:03:41, i.e. encoded at roughly 1.25x. Verified against the on-screen clock at three points (01:33/00:13, 38:22/00:58, 50:03/01:13, a constant ratio). No content is missing — the recording runs from opening recap to closing sign-off. Divide original timestamps by ~1.25 to locate them.
Agent: claude-code

## [2026-08-09] ingest | Hermes vault access protocol
Created [[05_Agent-Memory/Hermes/obsidian-vault-access]] with the chief-of-staff retrieval, client-silo, write, MCP fallback, and Git sync rules. Updated MOC.md and 05_Agent-Memory/Hermes/_index.md.
Agent: default

## [2026-08-11] ingest | Hermes model route
Appended the approved Hermes model decision to [[ai-tools-stack-3-layer]]: personal back-office only; Groq free as primary; OpenRouter/DeepSeek as capped pay-as-you-go fallback; no new monthly AI subscription until actual usage justifies it. Clarified that consumer ChatGPT/Claude subscriptions do not automatically provide API credits and that company Claude access requires permission. No MOC or folder-index changes because this was an append.
Agent: codex

## [2026-08-11] ingest | GTM revision - framework sharpeners + coaching niche validated
Appended to agency-go-to-market-sequence.md via 00_Inbox handoff: coaching-class niche confirmed as distinct from US high-ticket coaching, category-layer positioning (Admissions Machine), proof-capture SOP, manual-first-then-productise sequencing. Guardrails (pricing emerging, DataForSEO deferred, 5-8 client scale trigger) reaffirmed unchanged. No MOC/index changes - target note already indexed.
Agent: claude-code

## [2026-08-11] ingest | Jio/Interakt social automation research
Created [[social-media-automation-competitor-reference]] in 04_Knowledge and [[social-media-automation-offer-plan]] in 01_Agency from the supplied Jio social-automation video/transcript analysis and Interakt reference review. Added cross-links and guardrails to service-offerings and agency-go-to-market-sequence. Recorded the 15 August soft launch / 1 September public-launch sequence, pilot Free/Growth/Supercharge concepts, approval-first account permissions, n8n/Hermes boundary, interview-consent rule and unit-economics checklist. All new material remains maturity: emerging; pricing was not promoted to a decision. No secrets or client PII included.
Agent: codex

## [2026-08-11] ingest | Class 10 video notes — Lead Capturing, Management, Segmentation & Broadcasting
Notes created: 3, updated: 2. All in 04_Knowledge.
Source: the Class 10 recording (56:48), transcribed via the chunked Whisper/Groq wrapper into 521 segments across 8 chunks (all succeeded first attempt this run, no manual intervention needed) and cross-read against 62 UI screenshots at 1024px. Created training-lesson-10-lead-capturing-management, lead-stages-pipeline and whatsapp-bulk-broadcast-and-block-ratio. Updated whatsapp-course-curriculum-map to point lesson 10 at its note. Dedupe: searched lead, crm, tag, broadcast, segment and field before writing anything. Found two notes that already covered material this lesson demonstrated live — bizautomation-contact-filtering-and-import already had the exact AND/OR filter logic and the Broadcast bulk action verbatim, and whatsapp-tag-numbering-convention already predicted the exact 1.1-1.7 tag scheme this lesson showed as Inbox tabs. Both were APPENDED with live confirmation and updated: set, rather than duplicated. lead-stages-pipeline had been referenced by name in two existing notes (training-lesson-3-sop-crm-logic and whatsapp-tag-numbering-convention) but never created — this lesson's live Inbox-tab demonstration finally supplied enough to write it. Genuinely new material, not covered anywhere in the vault before this lesson: what happens after a bulk broadcast — sent/delivered/failed tracking per recipient, one-click rebroadcast scoped to exactly the failed subset, and a concrete health metric (engagement should run at least 3x the block count, worked example 1000 sent / 10 blocked / 30+ engaged as the healthy floor). Also recorded: video vs text follow-up message visibility (50-70% for text, 90-95% for a short video, per the trainer's own estimate). A real product limitation recorded honestly: no direct 'assign to employee' action exists in the chatbot builder today; Update Columns writing an employee name is the working substitute until Flow Builder routing is covered in a later class. Neither Veblika reference covers lead management, segmentation or broadcasting — the video is the sole source. All new/updated notes at origin: ai / maturity: supported. No secrets or PII.
Agent: claude-code

## [2026-08-12] ingest | Class 9 video notes — Welcome Message to Appointment Booking
Notes created: 3, updated: 1. All in 04_Knowledge.
Source: the Class 9 recording (1:07:10), transcribed via a chunked Whisper/Groq pass into 677 segments and cross-read against 60 UI/whiteboard/phone screenshots at 1024px. This lesson's audio required re-splitting one chunk that repeatedly failed against the transcription service before it recovered in full - a Codex session handed off the completed, verified transcript and window plan (34 windows, 9106 words) for this session to build the document and vault entries from. Created training-lesson-9-welcome-to-appointment-booking plus two atomic notes: lead-capture-option1-vs-option2 (the showcase-first vs requirement-first framework - genuinely reusable beyond WhatsApp, directly usable in a discovery call) and appointment-booking-via-ghl (why a bare CTA link isn't a booking system, and GoHighLevel as the trainer's named alternative). Dedupe: searched appointment, GHL, testimonial, carousel, option, booking - no existing note covered any of this. The one genuine near-duplicate was carousel button limits, which whatsapp-template-anatomy already covered for card count (max 10) but not per-card button min/max (1-2) - appended rather than duplicated, along with the trainer's stated position that only video testimonials carry real weight. The document itself required patching after the first gate run failed at 73.5% coverage across 9 thin windows - each was rewritten with real transcript-sourced content rather than the threshold being lowered; second run passed at 100% coverage, 8207 words against a floor of 8187. Worth recording separately: this document also verified, ahead of vault work, that a second agent (Codex, git-authored as the user) had independently finished and ingested Class 10 while this session was mid-Class-9 - confirmed passing (7344 words, 100% coverage) rather than assumed. As with prior lessons, neither Veblika reference covers this material - the video is the sole source. All new notes at origin: ai / maturity: supported. No secrets or PII.
Agent: claude-code

## [2026-08-12] ingest | Class 11 video notes — WhatsApp Flow Mastery
Notes created: 2. Both in 04_Knowledge.
Source: the Class 11 recording (23:14), transcribed via Whisper/Groq into 195 segments (the engine's normal path, not the chunked wrapper - the shortest lesson so far, well under the chunking threshold) and cross-read against 42 UI screenshots at 1024px. Created training-lesson-11-whatsapp-flow-mastery plus the atomic reference note whatsapp-flow-builder-webhook-reference, covering the raw webhook event shape, the nfm_reply filter that isolates WhatsApp Form submissions, and the Router node's two execution modes (first-matching-branch vs all-matching-branch). Dedupe: searched webhook, router, flow-builder, auto-assign, nfm - nothing existing covered any of this; this is BizAutomation's separate Flow Builder, distinct from the Chatbot-V2 builder documented across lessons 8-10, so no near-duplicate existed to merge into. Added a new row to whatsapp-course-curriculum-map for lesson 11, which had none before this ingest. Worth recording: this lesson closes a gap explicitly left open at the end of lesson 10 - lesson 10 assigned employees by manually writing to an Employee column; lesson 11 does the same job through a dedicated Auto Assign Contact action, one per Router branch. It also contains the second genuine live debugging moment in this series (the first was lesson 9's keyword mismatch) - an 'Execution step not found' error, diagnosed and fixed on screen rather than edited out, kept in the document deliberately. Capture note: the user supplied a tentative outline with its own timestamps for this lesson; per instruction, only the outline's content and sequence were used - every timestamp in the delivered document was taken from the actual transcript. As with prior lessons, neither Veblika reference covers this material - the video is the sole source. All new notes at origin: ai / maturity: supported. No secrets or PII.
Agent: claude-code

## [2026-08-14] ingest | WhatsApp Automation Agency Phased Plan (Yogesh-approved, GHL/Hermes decisions updated)

Notes created: 3 (03_Projects/whatsapp-automation-agency-phased-plan, 04_Knowledge/hermes-desktop-and-samin12-research, 04_Knowledge/on-demand-skill-installation-policy), updated: 8 (decision-ghl-deferral, sahas-ai-overview, decision-hostinger-kvm2-dokploy-website-n8n, crm-and-field-model, agency-automation-plan, bizautomation-reseller-deal, whatsapp-api-pricing-model-india, whatsapp-automation-vendors).

Source: a multi-session Claude Code planning pass building the `What's App Automation/WhatsApp Automation template & workflow/` working folder (17 files, outside the vault) — Yogesh explicitly approved the phased roadmap via plan-mode approval twice, and confirmed the GHL-timing and Hermes-timing reversals directly.

**Superseded, not deleted, per the golden rule**: [[decision-ghl-deferral]]'s indefinite deferral (GHL now firmly scheduled at Phase 2, `status: superseded`, update appended); [[sahas-ai-overview]]'s "Hermes waits for a paying client" line (Hermes now Phase 4, update appended); [[decision-hostinger-kvm2-dokploy-website-n8n]]'s website half (now built inside the BizAutomation/GHL platform's included builder — n8n hosting on the VPS is unchanged, `status: partially superseded`).

**New CRM fields**: Authority + Timeline (completing BANT) and Problem Details (free text) added to Contact Master in [[crm-and-field-model]]; a new Campaign Log master specified for the new Module 5 (Marketing Broadcast & Win-back, appended to [[agency-automation-plan]] — was not in the original 4-module sketch).

**Module 1 (Qualify+Book) gained two new entry points** (appended to [[agency-automation-plan]]): a "Business Growth Checker" WhatsApp Form (Entry B) and a candidate missed-call trigger (Entry C, explicitly not committed). A RAG-based conversational qualifier is flagged as a possible future Entry B upgrade, deferred until Phase 1 is confirmed live.

**Unreconciled conflicts flagged, not resolved** (per the lint rule — report, don't silently resolve): [[bizautomation-reseller-deal]] now carries the newly-formal BizAutomation associate-partnership, a legal-entity-name question ("SPBG BizAutomation Private Limited" vs. the plain name previously assumed), an unconfirmed relationship to automationsaathi.com (different legal entity in its own footer), and a pricing conflict (public B2C tiers found — Starter ₹999/Pro ₹1,499/Elite ₹2,499/mo, WhatsApp gated to Elite — vs. the existing ~₹1,000/mo separate GHL/Veblika figures). [[whatsapp-api-pricing-model-india]] and [[whatsapp-automation-vendors]] now cross-reference a **third** conflicting Meta per-message pricing figure from a YouTube source, on top of the two already on record.

**New knowledge**: [[hermes-desktop-and-samin12-research]] records an open question (is Samin12's `hermes-desktop` GitHub repo the same Hermes ecosystem referenced in `05_Agent-Memory/Hermes/`? — not resolved) and four candidate building blocks if Hermes is built from scratch. [[on-demand-skill-installation-policy]] records the Yogesh-confirmed policy of installing third-party Claude Code skills on-demand rather than in bulk, with the `scrapling-official` install (pulled directly from Scrapling's verified upstream repo, not the unaudited third-party packaging) as the working precedent.

Dedupe: searched BANT, campaign log, business growth checker, missed call, RAG agent, hermes-desktop, samin12, scrapling, associate partner, SPBG, professional saathi before writing anything — no existing vault coverage of any of this, so nothing was merged beyond the updates listed above. All new/updated content at origin: ai / author: claude-code; the phased-plan pointer note and the skill-installation policy are maturity: established (Yogesh directly and explicitly confirmed both), everything else stays supported or emerging pending Yogesh's verification of the flagged conflicts. No secrets, credentials, or client PII in any of this material.
Agent: claude-code

## [2026-08-12] ingest | Class 12 video notes — Google Sheets Integration
Notes created: 2, updated: 1. All in 04_Knowledge.
Source: the Class 12 recording (46:59), transcribed via a chunked Whisper/Groq pass into 490 segments and cross-read against 37 UI/Google-Cloud-Console screenshots at 1024px. This lesson's transcription hit a genuine Groq service degradation - the standard 450s chunk size, which had worked for every prior lesson including a 51-minute one, failed deterministically on the very first chunk. Binary-searched the live failure threshold directly against the API (150s: 200 OK reliably; 160s+: 500 reliably) rather than retrying blind, then fixed the repo properly: added a --chunk-seconds override to ingest.py with tests, pushed as learn-from-video-Skill v3.5.0 (commit f1cad3b), and re-ran successfully at 140s chunks (21 chunks, 490 segments, complete). Created training-lesson-12-google-sheets-integration plus the atomic reference note google-oauth-setup-for-bizautomation - a step-by-step Google Cloud Console checklist that is genuinely reusable for any Google API integration, not just this course. Dedupe: searched google, sheet, oauth - nothing existing covered any of this. Appended (did not duplicate) the flowId-filtering technique and the Contains operator to whatsapp-flow-builder-webhook-reference, since both extend that note's existing Condition-node material directly rather than standing alone. Added a new row to whatsapp-course-curriculum-map for lesson 12, which had none before this ingest. Worth recording: this lesson contains the series' third genuine live debugging moment (after lesson 9's keyword mismatch and lesson 11's execution-step error) - an action node added one level too low in the router chain, which broke two branches identically because the same mistake was copied rather than made twice independently; kept in the document and flagged as a debugging-habit lesson in its own right. Also flagged a naming mismatch: the trainer calls the Google Sheets write action 'update row' verbally, but the interface's actual label is 'Create spreadsheet row'. Capture note: the user supplied a tentative timestamped outline for this lesson; per instruction, only the outline's content and sequence were used - every timestamp in the delivered document was taken from the actual transcript. As with prior lessons, neither Veblika reference covers this material - the video is the sole source. All new notes at origin: ai / maturity: supported. No secrets, credentials or PII - the real Client ID/Secret shown live in the recording were described structurally in the document, not reproduced verbatim.
Agent: claude-code

## [2026-08-15] ingest | Marathi local-business lead campaign direction

Notes created: 1, indexes updated: 2. Created [[decision-marathi-local-business-lead-campaign-direction]] in 01_Agency after Yogesh explicitly approved the future campaign direction and asked to save it. The decision records the approved original Marathi-first anchor, "ओरडून नाही, system ने business वाढतो", the missed-enquiry story, the Click-to-WhatsApp → qualify → Growth Check booking direction, and the safeguard that user-supplied MBG videos are structural inspiration only, not copyable creative or performance proof. It also records the deliberate scope boundary: WhatsApp automation is the current workstream; reel shooting scripts, Canva creatives/carousels, and social-media automation are deferred until that future workstream. Dedupe: searched existing agency, project, and knowledge notes for Marathi campaign, Click-to-WhatsApp, and missed-enquiry coverage; the existing agency plan covers entry points and the intake form covers bottlenecks, but neither captured the approved campaign decision and deferred scope. Source: user-supplied transcripts plus an earlier public research pass; Watch download of the first URL was blocked by the local proxy, so no visual claim is made. Maturity: emerging. No credentials or PII recorded.
Agent: codex

## [2026-08-15] ingest | Existing-System Rescue Sprint and lead measurement model

Notes created: 2, indexes updated: 2. Created [[decision-existing-system-rescue-sprint]] for Yogesh's ₹5,000 milestone-based pilot: ₹1,000 after an accepted audit/scope, ₹2,000 after two UAT-accepted workflows, and ₹2,000 after delivery of up to two further workflows. The record explicitly tightens the ambiguous "4 or 5" automation promise to up to four independent workflows, with a fifth only as a small linked action, and preserves the pricing conflict with [[pricing-ladder]] rather than silently replacing it. Created [[sahas-lead-automation-measurement-model]] to operationalise the active WhatsApp lead work: H1/H2/H3 hook experiment, Contact Master columns, separate Activity Event Log for day/time analysis, rescue-project master, tag library, loss reasons, conversion triggers, KPI definitions, and reporting cadence. Public Trustpilot, Justdial, LinkedIn, and MBG's own grievance-policy pages were reviewed as market signals; individual complaint allegations were not treated as adjudicated facts. Outreach guardrail: no complaint-based targeting, scraped reviewer data, or vendor-negative campaign. Both notes maturity: emerging. No credentials or client PII recorded.
Agent: codex

## [2026-08-15] ingest | Recurring service catalogue without lifetime offers

Notes created: 1, indexes updated: 2. Created [[decision-service-catalog-no-lifetime]] from Yogesh's revised Starter/Pro/Elite/Supercharge and WhatsApp-only service request. The decision removes lifetime offers, records ₹1,000 as a one-time onboarding/account-registration fee, defines GHL Workspace / GHL Guided Workspace / Business Automation Suite / Supercharge Custom Build, and creates the WhatsApp Lead Engine (₹1,999/mo) and WhatsApp Lead Engine AI (₹2,499/mo) names. The AI plan includes one—not "one or two"—fixed-scope agent and up to four independently testable flows. Annual amounts are labelled prepaid plan prices rather than assumed monthly multiplication. The PDF was scanned and non-extractable locally; its plan interpretation was taken from Yogesh's supplied pasted summary. The note preserves the unresolved reseller public-price/account-ownership conflict in [[bizautomation-reseller-deal]] and leaves GST display as a publishing prerequisite. Maturity: emerging. No credentials or PII recorded.
Agent: codex

## [2026-08-15] ingest | Final package fit in lead schema

Updated [[sahas-lead-automation-measurement-model]] to add the `Recommended Plan` field and seven exclusive package-fit tags: Starter, Pro, Elite, WhatsApp Lead Engine, WhatsApp Lead Engine AI, Supercharge, and Existing-System Rescue Sprint. Confirmed WhatsApp-only prices: Lead Engine ₹1,999/mo and Lead Engine AI ₹2,499/mo. The field is authoritative; the tag is an Inbox-filter convenience. No credentials or PII recorded.
Agent: codex

## [2026-08-15] ingest | First lead automation package tags finalised

Updated [[sahas-lead-automation-measurement-model]] with Yogesh's final first-build package tags: `3.1 STARTER`, `3.2 PRO`, `3.3 ELITE`, `3.4 WHATSAPP AUTOMATION`, `3.5 AI WHATSAPP AUTOMATION`, and `3.6 SUPERCHARGE`. Existing-System Rescue Sprint remains saved in [[decision-existing-system-rescue-sprint]] but is explicitly deferred from the live Recommended Plan field and Veblika tag list. No credentials or PII recorded.
Agent: codex

## [2026-08-15] ingest | First lead pipeline tags finalised

Updated [[sahas-lead-automation-measurement-model]] to use the final exclusive 14-stage pipeline from `1.1 NEW LEAD` through `1.14 LOST`, including DEMO SHARED, NEGOTIATION, ONBOARDING, LIVE CLIENT, and REVIEW & REFERRAL. Opt-out is now explicitly native consent status rather than a manually applied pipeline tag. No credentials or PII recorded.
Agent: codex
