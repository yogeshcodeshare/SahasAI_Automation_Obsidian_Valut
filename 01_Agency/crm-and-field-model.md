---
title: CRM & Field Model (WhatsApp Automation)
created: 2026-08-05
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
| Contact Master | Leads & clients | Name, Business, Phone, Source, Type, City, Stage |
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
