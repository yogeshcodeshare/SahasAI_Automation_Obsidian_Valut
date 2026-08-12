---
title: Training — Lesson 10 (Lead Capturing, Management, Segmentation & Broadcasting)
created: 2026-08-11
tags: [training, whatsapp, lead-management, crm, knowledge]
source: Class 10 recording — "Lead Capturing, Management, Segmentation & Bulk Broadcasting with WhatsApp Automation" (56:48)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 10 (Lead Capturing, Management, Segmentation & Broadcasting)

Follows [[training-lesson-9-welcome-to-appointment-booking|training-lesson-9]] (in progress) and [[training-lesson-8-workflow-vs-ai-automation]]; position in the course at [[whatsapp-course-curriculum-map]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported`.

## Why this lesson matters

Class 9 built one automated conversation, welcome to booking, for one customer. **This lesson is about the other fifty** — the ones who inquired, engaged a little, and went quiet. It rebuilds the earlier chatbot flow live, instrumenting tags and attributes at every step, then uses that captured data to filter, segment and re-engage at scale.

## The four-component model

```
Lead Engagement -> Lead Capturing -> Lead Management -> Lead Follow-up
```

1. **Engagement** — Class 9's subject: react the instant an inquiry arrives.
2. **Capturing** — this lesson: get the lead's data into structured fields, not just into a chat transcript.
3. **Management** — this lesson: keep that data organised so its state is knowable at any time.
4. **Follow-up** — deferred explicitly to the next class.

## The KPI argument, stated plainly

Without structured capture, a manager checking "how many of yesterday's 50 leads want a 2BHK" has to re-read 50 conversations. With it, the answer is a filter. The fields change by industry (real estate: configuration, location, budget; travel: package, dates, budget) but the discipline — capture as structured data while the conversation happens, not afterward — is universal.

## What got instrumented, end to end

Every meaningful moment in the rebuilt flow now writes to a tag or column:

| Moment | Action | Field |
|---|---|---|
| First message arrives | Update Tag | `New Lead` |
| Project selected | Update Columns | `Project` |
| Project selected | Update Columns | `Employee` (who owns this lead) |
| Book Appointment clicked | Update Columns | `Site Visit Status` = `Pending` |
| Requirement form submitted | WhatsApp Form → columns | Name, mobile, project preference, configuration |

**A real limitation, stated honestly by the trainer:** there is no direct "assign to employee" action inside the chatbot builder today. Update Columns writing an employee name is the working substitute; true routed assignment is a Flow Builder feature covered later.

## The reusable-flow pattern, applied concretely

Book Appointment was deliberately split into its own flow with a stable keyword — the same reusable-keyword idea from [[whatsapp-chatbot-builder-reference]], now shown paying off: one booking flow gets called from every project's flow, from social ads, from anywhere, and never needs rebuilding per project. The trainer flags the same idea for a **central "current offers" flow** — build the offers message once, reference it everywhere, update it in one place.

## Two ways to manage captured leads

- **Inbox, by stage tab** — a live filtered view per pipeline stage. Confirmed live: exactly the `1.1`–`1.7` numbered tags from [[whatsapp-tag-numbering-convention]]. See [[lead-stages-pipeline]] for the full stage list, finally filled in from this lesson.
- **Contacts, by table + filter** — the same AND/OR filter logic already documented in [[bizautomation-contact-filtering-and-import]], now confirmed live and extended with a segmentation strategy → see that note's update.

## What's genuinely new here: broadcast results and the block-ratio rule

Neither prior lesson covered what happens *after* a bulk broadcast is sent. This lesson does — full detail at [[whatsapp-bulk-broadcast-and-block-ratio]]:
- Sent / Delivered / Failed tracking per recipient, with reasons for failure.
- One-click rebroadcast scoped to exactly the failed subset.
- A concrete health metric: **engagement should run at least 3x the block count**.

## Video versus text, restated with numbers

Text-only follow-up: ~50–70% chance of being seen, per the trainer's estimate. The same message as a short video: ~90–95%. Consistent with the general principle that richer message formats outperform plain text, now with a specific claimed uplift for follow-up messages.

## Note on sources

Neither the Veblika knowledge-base document nor veblika.com/products/whatsapp-automation covers lead management, segmentation or broadcasting. The video is the sole source.

## Capture note

56:48 as captured, consistent pacing with no detected speed offset (unlike Class 8, which ran at ~1.25x). Full recording, opening recap through closing sign-off.
