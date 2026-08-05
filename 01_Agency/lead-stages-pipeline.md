---
title: Lead Stages & Pipeline
created: 2026-08-05
tags: [crm, pipeline, whatsapp, sahas-ai]
source: Claude Desktop conversation - AI Automation project
origin: ai
author: claude.ai
maturity: supported
---

# Lead Stages & Pipeline

The fixed stage dropdown in the [[crm-and-field-model|CRM]], tracked via Veblika tags. Same shape for both businesses.

`New Lead → Requirement Captured → Interested → Appointment / Site Visit → Closed Won → Review → Lost (+reason)`

## Site-visit / appointment sub-statuses
Track as custom fields (from [[training-lesson-3-sop-crm-logic]]): Scheduled · Confirmed · Rescheduled · Cancelled.

## Notes
- **Lost** always stores a reason → feeds win-back.
- **Review / Reputation** is its own stage — never skip it.
- WhatsApp can be a **standalone CRM** or integrate with a 3rd-party CRM; we start standalone on Sheets (see [[ai-tools-stack-3-layer]]).

## Automation maturity ladder
Beginner → Intermediate → Advanced. **Day-1 beginner scope:** WhatsApp Forms, Tagging, Gallery & documents, base workflow.

Related: [[whatsapp-lead-sop-8-stage]]
