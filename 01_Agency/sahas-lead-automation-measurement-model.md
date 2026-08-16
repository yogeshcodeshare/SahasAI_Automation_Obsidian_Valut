---
title: Sahas Lead Automation Measurement Model
created: 2026-08-15
updated: 2026-08-15
tags: [agency, whatsapp, crm, kpi, lead-automation, measurement]
source: Yogesh requirements in Codex conversation; existing Sahas CRM and lead-pipeline notes
origin: ai
author: codex
maturity: emerging
---

# Sahas Lead Automation Measurement Model

## Purpose

Capture only the information that changes qualification, follow-up, service delivery, or a decision. Use **fields/columns for stable values and reporting**; use **tags for stage, intent, routing, or a temporary automation state**. Do not create a tag for every answer.

## Lead Hook Matrix

There is no universal "best" hook. Run the following three variants and select the winner by qualified-booked-call rate, not by raw clicks.

| Hook ID | Promise | Best-fit signal | Proof needed before scaling |
|---|---|---|---|
| H1 — Existing system | "नवीन software नको; आधी तुमचं चालू system कामाला लावूया." | Lead says they already pay for a tool or team is not using it | account audit + working UAT milestones |
| H2 — Transparency | "काय चालेल, काय नाही, आणि खर्च कुठे येईल ते कामापूर्वी लिखित देऊ." | Lead fears vague delivery or has been disappointed by a vendor | written scope, limits, owner, and acceptance tests |
| H3 — Missed enquiry | "कामात असताना enquiry miss होऊ नये आणि follow-up विसरू नये." | Lead has enquiry / booking / reply pain | a relevant demo of capture, booking, or reminders |

`Hook ID` must be stored with every campaign lead so a later campaign decision is evidence-led.

## Contact Master — Required Columns

| Group | Column | Field type / values | Why it exists |
|---|---|---|---|
| Identity | Contact ID | system-generated | joins all tables without relying on phone text |
| Identity | Name, Phone, Email (optional) | text / verified number | normal contact and duplicate control |
| Business | Business Name | text | agency sales context |
| Business | Business Type | dropdown | segment and select matching demo |
| Business | City, State | dropdown/text | local targeting and language analysis |
| Communication | Preferred Language | `mr`, `hi`, `en`, `mixed`, `unknown` | send the right language and measure preference |
| Communication | Preferred Contact Window | dropdown | respect the owner's actual availability |
| Consent | Marketing Opt-in Status, Opt-in Source, Opt-in At | controlled value + timestamps | permission and safe proactive sends |
| Attribution | Lead Source | controlled dropdown | source ROI |
| Attribution | Campaign Name / ID, Hook ID | text / `H1–H3` | campaign and hook comparison |
| Qualification | Main Bottleneck | controlled dropdown | routes the lead to the relevant solution |
| Qualification | Problem Details | free text | retains the owner's own words |
| Qualification | Existing System / Tool | text/dropdown | identifies the rescue opportunity without assuming vendor |
| Qualification | Existing-System Status | `not using`, `partly using`, `needs support`, `working`, `unknown` | distinguishes a true rescue lead |
| Qualification | Authority | `owner`, `decision-maker`, `influencer`, `unknown` | avoids proposals to the wrong person |
| Qualification | Timeline | `<7d`, `8–30d`, `31–90d`, `later`, `unknown` | prioritisation and follow-up timing |
| Qualification | Enquiry Volume Band | `0–9`, `10–29`, `30–99`, `100+`, `unknown` | estimates where automation has enough value |
| Lifecycle | Current Stage, Stage Entered At | controlled dropdown + timestamp | pipeline and aging |
| Lifecycle | Assigned Owner, Last Interaction At, Next Follow-up At | user + timestamps | no lead is forgotten |
| Booking | Booking Offered At, Booked Call At, Call Date/Time, Call Outcome | timestamps + dropdown | conversion funnel and reminder logic |
| Commercial | Offer Shown, Recommended Plan, Proposal Status, Payment Plan Selected | controlled dropdown | separates interest from a real commercial step |
| Loss | Lost Reason, Lost Detail, Lost At, Win-back Eligible At | controlled dropdown + free text + timestamps | learn and re-contact only when appropriate |

## Activity Event Log — Required for Time and Day Analysis

Do not overwrite all timing information inside Contact Master. Create a separate `Lead Activity Log`; one row per event.

`Event ID, Contact ID, Event At, Day of Week, Hour Block, Channel, Actor (bot/human/lead), Event Type, Previous Stage, New Stage, Campaign ID, Hook ID, Automation/Flow ID, Outcome, Error/Stop Reason`

Minimum event types: `first_inbound`, `first_auto_reply`, `first_human_reply`, `qualification_started`, `qualification_completed`, `booking_offered`, `booking_clicked`, `call_booked`, `call_attended`, `proposal_sent`, `payment_received`, `opt_out`, `lost`.

This provides the requested customer-free-time picture. Compare the hour/day of `first_inbound`, `qualification_completed`, `booking_clicked`, and `call_attended` against the lead's declared preferred contact window. Actual interaction time is behaviour; preferred window is permission/context. Keep both.

## Delivery Project Master — Needed for Rescue Sprint Clients

One client can have several workflows, so this is not a Contact Master column.

`Project ID, Contact ID, Existing Tool, Access Verified (yes/no), Scope Approved At, Automation 1–4 Name, Trigger, Action, Owner, UAT Status, UAT Accepted At, M1/M2/M3 Payment Status, Handover Completed At, Blocker, Next Action`

Never store client passwords, tokens, or API keys in any master.

## Tag Library

### Pipeline (one active stage tag only)

`1.1 NEW LEAD` · `1.2 QUALIFICATION IN PROGRESS` · `1.3 QUALIFIED` · `1.4 SOLUTION / DEMO SHARED` · `1.5 CALL BOOKED` · `1.6 CALL COMPLETED` · `1.7 PROPOSAL SENT` · `1.8 NEGOTIATION` · `1.9 CLOSED WON` · `1.10 ONBOARDING` · `1.11 LIVE CLIENT` · `1.12 REVIEW & REFERRAL` · `1.13 NURTURE` · `1.14 LOST`

### Service / offer interest

`2.1 GMB BOOST INTEREST` · `2.2 WHATSAPP AUTOMATION INTEREST` · `2.3 N8N WORKFLOW INTEREST` · `2.4 AI ASSISTANT INTEREST` · `2.5 WEBSITE / LANDING PAGE INTEREST` · `2.6 SOCIAL / CONTENT INTEREST`

`Lead Source`, `Campaign Name / ID`, `Hook ID`, `Main Bottleneck`, and `Problem Details` remain fields—not tags—so they can be filtered and reported without tag clutter. Existing-System Rescue Sprint has no live field or tag in the first build.

### Package fit (one active tag only)

For the **first live lead automation**, use this final package set only:

`3.1 STARTER` · `3.2 PRO` · `3.3 ELITE` · `3.4 WHATSAPP AUTOMATION` · `3.5 AI POWERED WHATSAPP AUTOMATION` · `3.6 SUPERCHARGE`

`Recommended Plan` is the authoritative field. Use one matching package tag only to filter the Veblika Inbox quickly. The dropdown values are `Starter`, `Pro`, `Elite`, `WhatsApp Automation`, `AI Powered WhatsApp Automation`, `Supercharge`, and `Not decided`. **Do not create a Rescue Sprint field or tag in this first build.**

### High-intent signals and routing

`SIG: OWNER` · `SIG: ACCESS READY` · `SIG: URGENT <30D` · `SIG: 10+ ENQUIRIES/MO` · `ROUTE: HUMAN HANDOFF` · `FLOW: FOLLOW-UP ACTIVE`

Tags are removed when no longer true. In particular, remove `FLOW: FOLLOW-UP ACTIVE` on reply, booking, loss, opt-out, or human handoff. Use fields—not tags—for price, payment milestone, dates, language, and detailed vendor/tool information.

Use Veblika's native consent/opt-out status for opt-outs; do not create an `OPT-OUT` pipeline tag.

## Lost-Reason Matrix

| Lost reason (dropdown) | What it means | Action |
|---|---|---|
| No response after valid follow-up | lead went silent | one bounded sequence; set a later win-back date, then stop |
| Not decision-maker | contact cannot approve | ask for decision-maker introduction; do not pressure |
| Not ready / timeline later | genuine timing issue | revisit on stated date |
| Price or payment schedule mismatch | value/scope not accepted | record objection; revise offer only if scope supports it |
| Chose another provider / existing vendor support | competitive or vendor retention | ask one neutral learning question; no negative-vendor pitch |
| Existing-tool access unavailable | no account/permission available | pause; send access checklist; close only if unresolved |
| Tool capability gap / needs paid tool | current system cannot deliver scope | disclose cost; offer reduced scope or close transparently |
| Low enquiry volume / no immediate use case | automation has weak current ROI | move to nurture, not a sales push |
| Privacy / trust concern | owner needs proof or control | share scope and access policy; human discussion |
| Outside service fit | language, geography, service mismatch | close politely / refer where appropriate |
| Opt-out / do not contact | permission withdrawn | apply opt-out and stop all proactive sends |
| Invalid / spam | unusable record | mark and exclude from KPI denominators |

## Conversion Triggers

Move a lead to a human call priority when at least two of these are true: `SIG: OWNER`, `SIG: ACCESS READY`, `SIG: URGENT <30D`, `SIG: 10+ ENQUIRIES/MO`, clear pain, or accepted Growth Check.

| Trigger | Automation action | Human action |
|---|---|---|
| Says they already bought a tool but it is unused | tag `PAIN: EXISTING TOOL UNUSED`; present H1 | run a rescue discovery call |
| Shares missed-enquiry / follow-up pain | tag matching pain; show a narrow relevant demo | quantify current process and target workflow |
| Declares owner + time within 30 days | apply signals; offer nearest call slot | confirm authority and problem before call |
| Booking click but no booking | create follow-up task; send one reminder inside policy | offer help only once, then stop or nurture |
| Call attended and scope agreed | stage `PROPOSAL SENT`; create project draft | issue written scope and acceptance test |
| Access verified + M1 accepted | open Delivery Project Master | build only the first two accepted workflows |

## KPI Framework

Do not set final numeric targets until Sahas has baseline data. Track these weekly and use the first 20–30 valid leads to establish a provisional baseline.

| Type | KPI | Definition | Decision it changes |
|---|---|---|---|
| Primary outcome | Qualified-booked-call rate | unique leads with a booked Growth Check ÷ valid new leads | which hook/source deserves more effort |
| Primary outcome | Rescue Sprint activation rate | paid M1 clients with two UAT-accepted automations ÷ paid M1 clients | whether the pilot scope/tool fit is real |
| Primary outcome | 30-day workflow adoption | client projects with at least one agreed workflow used in the last 30 days ÷ live projects | whether delivery creates usable systems, not just setup |
| Driver | Median time to first meaningful response | median `first_human_reply - first_inbound`; report bot reply separately | staffing and handoff design |
| Driver | Qualification completion rate | leads completing required fields ÷ leads starting qualification | question count and flow usability |
| Driver | Call show rate | attended calls ÷ booked calls | reminder, slot, and confirmation design |
| Driver | Proposal-to-M1 conversion | M1 payments ÷ proposals sent | pricing, scope, and trust message |
| Diagnostic | Loss-reason distribution | valid lost leads by controlled loss reason | what to fix vs what to stop pursuing |
| Diagnostic | Hook conversion by language/state/time | qualified-booked rate segmented by Hook ID, language, state, day/hour | targeting and message selection |
| Guardrail | Opt-out/block rate | opt-outs or blocks ÷ proactive sends | consent, message quality, and send frequency |
| Guardrail | Flow error / incorrect-routing rate | failed or manually corrected runs ÷ flow starts | automation safety and testing |
| Guardrail | Unpaid scope hours | hours outside signed scope per project | whether ₹5,000 pilot economics are safe |

## Reporting Cadence

- **Daily:** new leads, unread human-handoff leads, overdue follow-ups, opt-outs, flow errors.
- **Weekly:** source/hook/language/state/time funnel, stage aging, loss reasons, booked vs attended, proposal/M1, and pilot scope hours.
- **Monthly:** live workflow adoption, rescue-sprint acceptance rate, referral/testimonial consent, and whether pricing/scope must change.

## Related

[[crm-and-field-model]] · [[lead-stages-pipeline]] · [[agency-automation-plan]] · [[decision-existing-system-rescue-sprint]] · [[decision-marathi-local-business-lead-campaign-direction]]
