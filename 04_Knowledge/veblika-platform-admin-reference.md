---
title: Veblika / BizAutomation — Platform Admin Reference
created: 2026-09-16
tags: [whatsapp, veblika, bizautomation, reference, how-to, knowledge]
source: "Document/veblika knowledge base.pdf (vendor KB, pages stamped 24 Jul – 20 Aug 2025) plus the navigation map read from the Class 4 lesson notes"
origin: ai
author: claude-code
maturity: supported
---

# Veblika / BizAutomation — Platform Admin Reference

The vendor's own knowledge base, plus the navigation map the course notes record. Everything else in the WhatsApp reference set describes *concepts*; this note answers "where does that live, and what does that number on the dashboard actually count?".

## The staleness caveat — read this first

The vendor KB's pages are stamped **24 July to 20 August 2025**. Its Chatbot Builder section lists only **four** actions (Send Message, Wait for Reply, Condition, Send Template Message). The live builder demonstrated in the course has **one trigger and sixteen actions** → [[whatsapp-chatbot-builder-reference]].

So the KB is thinner and older than the product. Treat it as authoritative for **definitions** (what a dashboard metric counts, what an opt-out keyword does) and as unreliable for **feature inventory**. Where the two disagree, the course notes and the live UI win.

## Dashboard metrics — what each number actually counts

These definitions matter because they are the numbers any client report is built from, and several are not what the label suggests.

| Metric | What it counts |
|---|---|
| Total Messages Sent | Every message sent, live chat **and** bulk broadcast combined |
| Total Messages Received | Every message arriving in the inbox |
| Total Contact | **Unique** contacts only |
| Total Agent | Agents added to the panel — **excludes managers and admin accounts** |
| Total Leads | Same number as Total Contacts; unique only |
| Pending Leads | Leads assigned to nobody (no agent, manager or admin) |
| Assigned Leads | Leads assigned to any agent, manager or admin |
| Lead Source Breakdown | Leads per source — **only major sources are displayed** |
| Contact Source Distribution | The same data as a chart |
| Sent and Received Messages | Bar chart of sent vs received |

Two traps for reporting: **Total Agent understates headcount** because managers and admins are excluded, and **Lead Source Breakdown is not exhaustive** — minor sources are omitted, so the rows will not sum to Total Leads. Do not build a client KPI on either without saying so → [[sahas-lead-automation-measurement-model]].

## Where everything lives

| Feature | Path |
|---|---|
| Custom fields | Manage → Columns |
| Tags | Manage → Tags |
| Opt-in / opt-out keywords | Manage → Opts Management |
| WhatsApp templates | Manage → Whatsapp Templates |
| WhatsApp forms | Manage → Whatsapp Forms |
| Webhook events | Manage → Webhook Events |
| Media upload | Gallery → Add Files |
| Contacts, filters, import/export | Contacts |
| Create a contact | Contacts → Create |
| Bulk broadcast / assign / tag | Contacts → select rows → toolbar |
| Live chats | Inbox |
| Notes, Activity, Reminders | Inbox → open chat → Contact Details → tabs |
| Campaigns and delivery reports | Campaigns |
| Broadcast without importing data | Campaigns → Manual fill |
| Chatbot builder | Chatbot → Create Chatbot |
| Add team members | Settings → Team |

The sidebar also carries FAQ Bot, Ai assistant, Flows, Projects, Tasks, Knowledge Base, and a Developers section holding the WhatsApp API — the Flow Builder in [[whatsapp-flow-builder-webhook-reference]] is the `Flows` entry, which is a different canvas from `Chatbot`.

## Column data types

Text · Email · Number (whole numbers only) · Text Area (longer free text) · Phone (strictly a phone number) · Select (option list) · Date

Prefer plain text in Select option values — a special character in a budget-range option caused a display failure in class → [[bizautomation-contact-filtering-and-import]].

## Gallery — upload media before you need it

Images, PDFs and videos upload at Gallery → Add Files, viewable as table or grid, with copy-URL and delete on the row menu. This matters for carousel sends specifically: a carousel asks for a **media URL per card**, not a file upload, so the images must already be in the Gallery with their URLs copied → [[whatsapp-template-anatomy]]. Compress first → [[compress-media-before-upload]].

## Campaign — Manual fill

The route to broadcast **without importing contacts first**: Campaigns → Manual fill → pick the number and template → paste phone numbers, one per line, each with country code → Validate → Broadcast.

The vendor's own stated ceiling: **never attempt more than 5,000 messages in one session** — the same figure recorded in [[whatsapp-number-safety-warm-up]], which also carries the 100–200 warm-up start that governs whether a broadcast should run at all.

## Delivery report and rebroadcast

Campaigns → open a campaign → Overview shows the delivery report. The message section allows a **rebroadcast scoped to a status** — sent, delivered, **read**, or failed — reopening the same send page for that subset.

Rebroadcast-to-failed is the documented recovery path; rebroadcast-to-**read** is a remarketing path the vendor documents and worth treating carefully, since re-messaging people who already read the last one is precisely what drives blocks → [[whatsapp-bulk-broadcast-and-block-ratio]].

## Opt-in / opt-out, per the vendor

Opt-out: if a person writes the exact keyword in live chat, that number is excluded from bulk WhatsApp marketing and receives nothing during a bulk send. Opt-in: writing an opt-in keyword resumes promotional and broadcast messages. Ten keywords per list, regional languages included → [[whatsapp-marketing-capping-and-deliverability]].

Note the scope carefully: the vendor describes this as excluding the number from **bulk marketing**. It is a platform control, and it is not evidence that any template qualifies as Utility → [[whatsapp-meta-current-pricing-and-service-rules-2026-09]].

Related: [[whatsapp-automation-vendors]], [[whatsapp-chatbot-builder-reference]], [[veblika-gemini-ai-bot-flow]], [[bizautomation-contact-filtering-and-import]]
