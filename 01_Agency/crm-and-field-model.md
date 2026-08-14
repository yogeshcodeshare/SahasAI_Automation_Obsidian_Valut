---
title: CRM & Field Model (WhatsApp Automation)
created: 2026-08-05
updated: 2026-08-14
tags: [crm, data-model, whatsapp, sahas-ai]
source: Claude Desktop conversation - AI Automation project
origin: ai
author: claude.ai
maturity: supported
---

# CRM & Field Model (WhatsApp Automation)

Every lead carries a fixed field set and moves through fixed [[lead-stages-pipeline|stages]]. Fields are captured by the intake forms and stored as masters in Google Sheets (see [[ai-tools-stack-3-layer]]).

## Masters — Agency
| Master | Holds | Sample fields |
|---|---|---|
| Contact Master | Leads & clients | Name, Business, Phone, Source, Type, City, Stage, Authority, Timeline, Problem Details |
| Service Master | Offerings | Service, Description, Setup fee, Monthly fee |
| Template Master | Approved WA templates | Name, Category, Text, Variables, Status |
| Pain→Offer Master | Deliverable to send | Pain point, Deliverable, Media link |
| Team Master | Agents | Name, Role |

## Masters — Coaching
| Master | Holds | Sample fields |
|---|---|---|
| Student Master | Enquiries & students | Student, Std, Subjects, Board, Medium, Parent, Area, Stage |
| Batch Master | Batches | Batch, Std, Subjects, Timing, Faculty, Fees, Seats |
| Fee Master | Fees | Student, Total, Installments, Due dates, Paid |
| Result Master | Marks | Student, Test, Marks, Date |

## Generalised field groups (from the real-estate case)
- **Source / Campaign** — campaign name/ID, hook, creative, keywords, budget
- **Requirement** — budget · configuration · purpose *(RE: 2BHK / 3BHK / Penthouse / Bungalow / Studio)*
- **Offer shown** — deliverable + customer reaction
- **Appointment** — date/time · status · agent assigned
- **Conversion hook** — transparency · cost-friendly · location · budget-friendly · future prospect · community
- **Lost reason** — location · budget too high · chose other · not ready
- **Budget range** — banded *(RE: <₹50L · ₹50L–1Cr · ₹1Cr–5Cr · ₹5Cr–10Cr · >₹10Cr)*
- **Geo** — State · City · Area
- **KPI/meta** — language · interaction day&time · availability · review time · lead-submit time

Feeds: [[agency-intake-form]] · [[coaching-intake-form]] · [[whatsapp-lead-sop-8-stage]]

## Update — 2026-08-14: BANT fields, free-text problem capture, Campaign Log master

Three additions from the WhatsApp automation phased-plan work (see [[whatsapp-automation-agency-phased-plan]]):

- **Contact Master gains `Authority`** (is this contact the decision-maker, or do they need to check with someone else?) and **`Timeline`** (how soon they want to start/decide) — completing the BANT set alongside the existing Budget field and Pain-point/"Need" (Main Bottleneck). Source: a Gemini-drafted internal-automation blueprint reviewed this session.
- **Contact Master gains `Problem Details` (free text)** — captures the specific-issue description from the new "Business Growth Checker" WhatsApp Form entry point into the Qualify+Book flow (see the appended section in [[agency-automation-plan]]), alongside the existing predefined Main Bottleneck checklist.
- **New master: Campaign Log** — not in the table above yet, needed for the marketing-broadcast module (Module 5, see [[agency-automation-plan]]'s update). Fields: Campaign Name, Date, Segment Filter Used, Template Used, Contacts Targeted, Sent/Delivered/Failed, Block count, Engagement count, a block-ratio health check (flag if engagement is under 3× the block count, per [[whatsapp-bulk-broadcast-and-block-ratio]]), Notes.

None of this is built yet — it's schema, not a live sheet. maturity for this update: supported (design decision made this session, not yet implemented or Yogesh-verified against a real workbook).
