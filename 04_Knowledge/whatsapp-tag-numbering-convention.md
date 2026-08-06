---
title: WhatsApp Tag Numbering Convention
created: 2026-08-06
tags: [whatsapp, tagging, crm, pipeline, knowledge]
source: Class 4 recording — WhatsApp Business API Automation course
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Tag Numbering Convention

A small setup decision with outsized consequences. Applies to the stages in [[lead-stages-pipeline]].

## Tags sort alphabetically — number them

Create a tag per pipeline stage and the platform sorts them alphabetically:

```
CLOSED WON · INTERESTED LEAD · LEAD REQUIREMENT · LOST · NEW LEAD · REVIEW · SITE VISIT
```

A lead does not travel through a pipeline in alphabetical order. A closed-won deal appearing above a new lead is not merely untidy — the filter strip stops working as a mental model of the funnel, because the visual order contradicts the actual flow.

**Fix: prefix each tag with a number**, so alphabetical sorting produces pipeline order as a side effect:

```
1.1 NEW LEAD · 1.2 LEAD REQUIREMENT · 1.3 INTERESTED LEAD · 1.4 SITE VISIT
1.5 CLOSED WON · 1.6 REVIEW · 1.7 LOST
```

## Why the decimal, not just 1, 2, 3

- Inserting a stage later needs no renumbering — 2.1, 2.2 and so on remain free.
- `1.x` is reserved for pipeline stages, keeping them visually grouped.
- Later tag groups (source, priority, campaign) take `2.x` and `3.x` and stay clearly separate.
- Renaming tags after they are in use means re-tagging existing contacts. Get the scheme right before the first client goes live.

## Tags vs custom fields — they answer different questions

| | Tag | Custom field |
|---|---|---|
| Filter contacts | Yes | Yes |
| **Filter live chats in the Inbox** | **Yes** | **No** |
| One-click filter strip in the Inbox | Yes | No |
| Store values (budget, date, project) | No | Yes |
| Best for | Pipeline stage | Lead attributes → [[crm-and-field-model]] |

The practical difference: a custom field tells a manager that twelve leads sit at site-visit stage. A tag lets them open those twelve conversations and see that four have gone quiet for a week.

## The portability rule

On a WhatsApp API platform that has **no tagging**, the stages must live in custom attributes instead — otherwise leads cannot be filtered by stage at all. Worth checking before recommending a vendor → [[whatsapp-automation-vendors]].

Related: [[training-lesson-4-tagging-contacts-compliance]]
