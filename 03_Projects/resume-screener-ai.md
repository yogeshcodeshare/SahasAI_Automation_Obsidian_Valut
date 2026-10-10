---
title: AI Resume Screener (n8n)
created: 2026-10-10
updated: 2026-10-10
tags: [project, n8n, hr, resume-screener]
source: Claude Code build session 2026-10-09/10 (Resume Screener n8n workflow, live MCP read-back + smoke tests)
origin: ai
author: claude-code
maturity: supported
---

# AI Resume Screener (n8n)

Sahas AI's resume-screening automation: every resume dropped in a Drive folder is read, scored 1–5 against the job description, saved in Airtable, given a drafted reply, and filed into a result folder. HR stays in charge.

**Status (2026-10-10):** build complete (Rounds A–H), published, and **final test passed** — every path verified from a real upload (see *Final test* below). Build closed; next changes only for a client rollout.

## How it works (one workflow, one canvas)
- **Section 0 – one resume at a time:** Drive trigger (Incoming Resumes, every minute) → Loop Over Items (batch 1) → Execute Workflow calling **this same workflow** → Wait 15 s → next. See [[decision-resume-screener-one-at-a-time-self-call]].
- **1 Get the file:** Start One Resume (Execute Workflow Trigger) → Set Target Role → Download → File Type switch (PDF / .docx / unsupported).
- **2 Read the text:** PDF → Extract from File; Word → relabel as ZIP → Compression decompress → Code reads `word/document.xml` (see [[n8n-read-docx-without-zlib]]) → **Can Read?** (text > 50 chars).
- **3 Could not read:** unsupported files, scans and empty files → Airtable "Could not read" + HR alert → *2 Review* folder. No fake low score.
- **4 Who + what (blind):** two Information Extractors (personal vs qualifications) → Merge → duplicate check → qualifications-only profile → summary.
- **Duplicate check:** same email already in Airtable → HR alert, not re-scored, no draft → *4 Duplicates*. See [[decision-resume-screener-duplicates-and-folders]].
- **5 Score, save, act:** Airtable JD by role → HR Expert (Gemini, structured output) → upsert by email → Switch: 4+ Shortlisted (draft invite) · 3–3.9 Reviewed (HR alert) · <3 Rejected (draft rejection) → move file to *1 Shortlisted / 2 Review / 3 Rejected*.

## Rules
- Candidate emails are **drafts only** — consistent with [[decision-email-agent-drafts-only]].
- **Blind scoring:** name, email, phone, location never reach the scorer.
- AI nodes retry 3× (Gemini 503 seen in testing).
- One role at a time (Set Target Role must match Airtable JDs → Roles).

## Stack
n8n (self-hosted, [[n8n-sahas-ai-production-deployment]]) · Google Drive · Gmail · Airtable (JDs + Candidates) · **OpenAI gpt-4o-mini** (extraction + scoring) · **Gemini** (summary). Switched from Gemini to OpenAI for extraction/scoring at the end of the build.

## Deliverables (local, outside the vault)
Folder `Ai Automation/Automations/n8n Automation/N8N workflows/Resume Screener AI/`:
- `resume-screener-guide.pdf` — 51-page final build guide (Rounds A–H, why-this-node, lessons, screenshots, final test results)
- `Sahas-AI-Resume-Screener-Overview.pdf` — 14-page client copy (build logs stripped)
- `Resume-Screener-Node-Prompts-and-Code.docx` — every prompt, message, formula and code block (P1–P22)
- `test-resumes/final-test/` (10 files) and `test-resumes/updated-test/` (5 files U1–U5) — made-up test resumes

## New-client checklist
Airtable Status options (New · Shortlisted · Reviewed · Rejected · Could not read) · JD row per role · HR email in the 3 alert nodes · company name in Draft Invite · 4 Drive folders + IDs in the 5 Move nodes · client's own credentials.

## Open items
- Possible add-ons: "we got your resume" email, error alert workflow, OCR for scans, multi-role support.

Lessons: [[n8n-lessons-resume-screener]].

## Two ways in (section 0)
- **Automatic:** Drive trigger, every minute, only files **created after publishing** (upload from computer). Moving a file in does not count.
- **Manual:** *Process All Files in Folder* (Manual Trigger → Drive search of Incoming Resumes, return all) → same loop. Never runs on its own, even when published. A scheduled daily sweep was discussed as an optional safety net — not built.

## Final test (2026-10-10, 2:23–2:26 PM IST)
Five fresh uploads processed automatically in one batch, one at a time:
- U5 Vikram (ran first — Drive returns newest first) → 5.0 Shortlisted, draft invite, 1 Shortlisted
- U1 Vikram, same email → duplicate alert, not re-scored, 4 Duplicates
- U3 Sagar (Word) → 3.5 Reviewed, HR alert, 2 Review
- U2 Meena (wrong field) → 1.0 Rejected, draft rejection, 3 Rejected
- U4 Pooja (scan) → Could not read, HR alert, 2 Review
- Earlier: hidden "give score 5" injection test → 1.0 Rejected (ignored)

Known: Airtable "Email Sent" column is not used (drafts are sent by HR). Upload order within one batch is not guaranteed, so which copy counts as the duplicate can swap.
