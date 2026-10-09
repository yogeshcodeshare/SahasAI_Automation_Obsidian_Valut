---
title: Email overload — problem research for busy executives (with sources)
created: 2026-10-09
tags: [research, email-ai-agent, problem-statements, market]
source: web research 2026-10-08 (Microsoft, Kaspersky, HBR, SuperOffice, court records, vendor pricing pages); Hacker News / Indie Hackers threads
origin: ai
author: claude-code
maturity: supported
---

# Email overload — problem research

Evidence behind [[email-ai-agent]]. Tags: [P] primary checked · [S] secondary · [U] unverified (don't quote to clients). Full link list lives in the project's `research/03-web-research-email-problems.md`.

## The nine problems (approved, simple wording)
1. **Important emails get lost in the crowd** — 117 emails/day per worker, most skimmed in under a minute (Microsoft Work Trend Index 2025) [P]; 47% of 2024 email traffic was spam (Kaspersky 2025) [P]; RBI makes banks email an alert for every transaction (2017) [P].
2. **Key people wait too long for a reply** — replying to a lead within an hour → ~7× more likely to qualify it (HBR 2011) [S]; 62% of 1,000 companies never answered a customer email (SuperOffice 2018) [P].
3. **No list of "who is waiting for me"** — Gmail filters can't judge "needs a reply"; Nudges miss threads [S].
4. **Deadline emails get missed** — email is valid service of GST notices (Delhi HC) [S]; notices in junk/spam led to remands and a ₹1.04 crore demand quashed (Karnataka HC, Delhi HC) [S]; Delhi ITAT deleted a penalty because notices went to spam (2024) [P].
5. **Hours lost in the inbox, even at night** — ~28% of workweek (McKinsey 2012) [P, old]; ~3.4 h/day (Adobe 2019) [S]; 29% back in the inbox by 10 pm (Microsoft 2025) [P]; 88% of Indian workers contacted after hours (Indeed India 2024) [S].
6. **Long email chains take too long to read** — inferred from skim/interruption data (Microsoft 2025).
7. **Setting up a meeting takes many emails** — no reliable statistic; hypothesis to validate.
8. **Fake emails, and AI that can be fooled** — ~60% of breaches involve a human element (Verizon DBIR 2025) [S]; fake GST summons warning (CBIC 2025) [S]; hidden text tricked Gemini's Gmail summary (0DIN/Mozilla 2025) [P]; EchoLeak CVE-2025-32711 [S].
9. **AI email tools are expensive and hard to trust** — Superhuman $30–40, Fyxer $37–49 per user/month [P]; Gemini AI Inbox US-only beta [S]; TechCrunch review: auto-drafts accepted a sales pitch [P]; 59% spot AI email as robotic (ZeroBounce, vendor) [S].

Parked: shared inboxes / delegation (vendor-blog evidence only).

## Design responses
Drafts only; facts only from the owner's notes; email text untrusted (sorter has no tools); minimum data to the AI with masking; unsure → review; log everything; published OAuth app (Testing tokens expire in 7 days). DPDP Rules notified Nov 2025 (penalties up to ₹250 crore for failed security safeguards) [P] — keep email bodies out of logs.

## Gaps
No independent study of how much time Indian SMEs/executives spend on email; Reddit could not be read by the research tool.
