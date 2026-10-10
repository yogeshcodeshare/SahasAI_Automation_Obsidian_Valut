---
title: Decision: Resume Screener processes one resume at a time by calling itself
created: 2026-10-10
tags: [decision, n8n, resume-screener]
source: Claude Code build session 2026-10-09/10 (Resume Screener n8n workflow, live MCP read-back + smoke tests)
origin: ai
author: claude-code
maturity: supported
---

# Decision: Resume Screener processes one resume at a time by calling itself

#decision

**Decided (2026-10-10):** the Drive trigger feeds a Loop Over Items (batch 1); each file is passed to an Execute Workflow node that calls the **same** workflow at an Execute Workflow Trigger ("Start One Resume"), waits for it, then pauses 15 s before the next file. Everything stays on one canvas, as Yogesh asked.

**Why:** when HR dumps many resumes, the trigger delivers them all in one run. That means ~4 Gemini calls × N files at once (rate limits) and Merge-by-position pairing personal data with qualifications — one failed AI call can shift names onto the wrong scores. A separate execution per file isolates each resume; one failure does not stop the batch (On Error = continue).

**Rejected:**
- Processing all items in one run — rate limits + data-mixing risk.
- A separate "Resume Intake" workflow — built first, then merged into the same canvas at Yogesh's request (self-call works the same; fewer workflows to maintain).
- Looping the whole screener inside one execution — every end branch would need wiring back to the loop; fragile.

**Depends on:** workflow staying **published** (Execute Workflow runs the published version); Drive trigger "file created" semantics (only files created after publishing are picked up).

Hub: [[resume-screener-ai]]
