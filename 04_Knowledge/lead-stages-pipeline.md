---
title: WhatsApp Lead-Stage Pipeline (the 7 stages)
created: 2026-08-11
tags: [whatsapp, crm, pipeline, lead-management, knowledge]
source: Class 3 recording (stage names first taught) — confirmed live in Class 10 recording, Inbox stage tabs
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Lead-Stage Pipeline (the 7 stages)

Referenced by two earlier notes — [[training-lesson-3-sop-crm-logic]] and [[whatsapp-tag-numbering-convention]] — but never written up on its own until Class 10 showed the stages live, moving automatically, in the Inbox.

## The seven stages

| # | Tag | Meaning |
|---|---|---|
| 1.1 | New Lead | Just arrived, nothing selected yet |
| 1.2 | Lead Requirement | Requirement capture in progress (form or Ask Question) |
| 1.3 | Interested Lead | Genuine interest confirmed |
| 1.4 | Site Visit | A visit is booked or in progress |
| 1.5 | Closed Won | Converted |
| 1.6 | Review | Needs a second look |
| 1.7 | Lost | Did not convert |

The numbering is the convention from [[whatsapp-tag-numbering-convention]] — `1.x` reserved for pipeline stages so alphabetical sort produces pipeline order as a side effect. Class 10 is the first lesson to show these tags actually in use, as the Inbox's filter tabs.

## The pipeline is not manually maintained

This is the operational fact worth keeping: nobody re-tags a lead by hand as it progresses. The Inbox tabs are **filtered views over the same attribute data** the chatbot flow already writes — `Lead Stage` / `Site Visit Status` columns updated by ordinary Update Tag and Update Columns actions inside the flow. When a booking is confirmed, the lead's tag changes as a side effect of that flow step, and it surfaces under a different Inbox tab automatically.

Worked example from the class: once Mr Amit's site visit status moves to Confirmed, he drops out of New Lead and is picked up under Site Visit — with zero manual intervention, because the same automation that captured him is what moves him.

## Where each transition actually happens

| Transition | What triggers it | Where it's wired |
|---|---|---|
| → New Lead | First message received | Update Tag, immediately after the trigger |
| → Lead Requirement | Requirement form/question started | Update Columns on the capture step |
| → Site Visit (Pending) | Book Appointment clicked | Update Columns on the CTA click |
| → Site Visit (Confirmed) | Booking actually confirmed | Currently manual; automated later via GHL integration |

The Pending → Confirmed gap is real and stated honestly by the trainer: a click only proves intent, not a completed booking. Closing that gap automatically is deferred to a later class covering third-party scheduling integration.

Related: [[training-lesson-10-lead-capturing-management]], [[training-lesson-4-tagging-contacts-compliance]], [[crm-and-field-model]]
