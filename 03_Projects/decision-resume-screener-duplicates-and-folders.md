---
title: Decision: Resume Screener duplicate check by email and four result folders
created: 2026-10-10
tags: [decision, n8n, resume-screener]
source: Claude Code build session 2026-10-09/10 (Resume Screener n8n workflow, live MCP read-back + smoke tests)
origin: ai
author: claude-code
maturity: supported
---

# Decision: Resume Screener duplicate check by email and four result folders

#decision

**Decided (2026-10-10):**
- **Duplicate check** right after Merge Candidate Data (the email is only known after extraction): Airtable search `AND({Email} != '', LOWER({Email}) = LOWER(new email))`, limit 1, Always Output Data on → If id not empty → HR alert, no re-score, no draft.
- **Four Drive folders** under the Resume Screener folder: *1 Shortlisted · 2 Review · 3 Rejected · 4 Duplicates*. Every handled file leaves Incoming Resumes. Unreadable files go to *2 Review* (a human must open them).

**Why:** without the check, the email upsert silently overwrote the same Airtable row, spent AI again and created a second draft. Duplicates got their own folder so *2 Review* holds only things needing a decision.

**Rejected:** duplicates in *2 Review* (mixed three different jobs in one folder); matching by name or file name (unreliable).

**Known limit:** matches by email only — same person with a new email is treated as new. To re-score someone, delete the Airtable row and upload again.

Hub: [[resume-screener-ai]]
