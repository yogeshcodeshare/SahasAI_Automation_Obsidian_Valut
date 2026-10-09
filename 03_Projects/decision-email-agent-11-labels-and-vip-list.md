---
title: Decision — Email AI Agent uses 11 action labels plus a VIP list
created: 2026-10-09
tags: [decision, email-ai-agent, gmail]
source: Claude Code session 2026-10-08 (Yogesh approved "go with 11 labels and VIP list")
origin: ai
author: claude-code
maturity: supported
status: active
---

# Decision — 11 action labels plus a VIP list

## Decision
Each email gets **exactly one label** saying what the owner needs to do: 1 Reply Needed · 2 Deadline & Legal · 3 Meeting Update · 4 Waiting on Others · 5 FYI · 6 Notifications · 7 Newsletters & Promos · 8 Cold Pitch · 9 Suspicious · 10 Finance & Invoices · 0 Needs Review. A **VIP list** (Google Sheet: investors, key clients, board, family) makes any email from those senders starred + phone alert, whatever its label. Inside Reply Needed, the AI marks **High/Normal** priority; drafts for all Reply Needed, alerts only for High or VIP.

## Context
Base video 1 used 9 labels; base video 2 used 19 influencer-specific labels and tagged every category scoring above 0 (several labels per email). Busy executives need a short list centred on the next action, plus a reliable way to catch the few senders who always matter.

## Alternatives rejected
- **Video 2's scored multi-label taxonomy** — too many labels per email, influencer-specific (fans, charity, constituent casework).
- **10 labels without Finance** — invoices and payment confirmations would mix with app notifications.
- **Letting the AI guess who is important** — less reliable than an explicit VIP list.

## Depends on
- [[email-ai-agent]]
- Assumption: one label per email is enough; priority and VIP flags carry "importance".

## Review trigger
First users report a frequent email type with no fitting label, or Needs Review exceeds ~10% of emails after tuning.
