---
title: WhatsApp Chatbot Builder — Node Reference
created: 2026-08-07
tags: [whatsapp, chatbot, reference, how-to, knowledge]
source: Class 8 recording — BizAutomation Chatbot-V2, 25:51–50:03
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Chatbot Builder — Node Reference

Every node in BizAutomation's **Chatbot-V2** builder, as demonstrated live. Other platforms differ (he names DoubleTick as an example), but the node *types* are close to universal.

`Sidebar → Chatbot → New Chatbot`. The builder shows **Triggers 1** and **Actions 16**, with a Draft/Published toggle.

## The one trigger

**On Message**

| Field | What it does |
|---|---|
| Message Type | Text · List Reply · Button Reply · Template Button Reply |
| Keywords | Comma-separated; flow fires only on these |
| **Enable Fuzzy Matching** | Partial keyword matches, configurable sensitivity |
| Phone Numbers | Restrict to a specific connected number |

> **Fuzzy Matching is visible in the UI but never discussed in the class.** It is what catches misspellings like "helo". Worth testing before relying on it.

The four message types map directly to template components from [[whatsapp-template-anatomy]].

## The reusable-keyword pattern — the best idea in the lesson

Rather than rebuilding a flow per template:

1. Set the trigger to **Button Reply** with a keyword (e.g. `Explore Manali`).
2. Use that same keyword on the button in **any** template where it belongs.
3. That one workflow runs whenever the button is clicked, anywhere.

His stated reason: *so you do not have to define the follow-up again and again.* The result is a **library of keyword-triggered flows** any template can call — the same reuse logic as [[whatsapp-forms-json-portability]].

## The sixteen actions

| Action | What it does | Key settings |
|---|---|---|
| Send Text Message | Plain reply | Body text |
| Send Button Message | Up to 3 buttons | Header (text/image/video), body, buttons |
| Send List Message | Menu of up to 10 rows | **Text-only header**, button text, sections, rows |
| Send Media Message | Images / documents | Attachment |
| Ask Question | Captures an answer in chat | Response format, validation, retry, timeout |
| AI Agent | Hands over to the AI bot | Later class |
| HTTP | Webhook / API call | Deferred to its own class |
| Delay | Waits before next step | Value + unit, up to **days** |
| Condition | Branches the flow | All/Any match, operators, True/False outputs |
| Send Template Message | Sends an approved template | Recipient number, template |
| Send CTA Message | Text + URL button | Body 1024, display text 20, URL, footer 60 |
| Send Product Message | Sends a catalog product | Catalog ID, Product Retailer ID |
| Ask Location | Requests location | Prompt message |
| Update Columns | Writes to a custom field | Column, value, **dynamic variables allowed** |
| Update Tag | Assigns a tag | Tags to assign |
| Stop Chatbot | Ends the bot's involvement | No configuration |

## Ask Question — capturing data without a form

The alternative to a WhatsApp form ([[whatsapp-forms-builder-reference]]) when a full form is too heavy. Asks one question in the chat and validates the reply.

| Field | Detail |
|---|---|
| Message | Up to **1024 characters** |
| Response Format | Any Response · Text · Number · Date · Media |
| Validation Message | Shown when validation fails |
| Retry Count | **1–10**; UI shows "Invalid input" outside that range |
| Timeout Value + Unit | Seconds · Minutes · Hours · Days |
| Timeout Message | Sent when the wait expires |
| **Continue on Timeout** | Off = flow stops · On = flow proceeds anyway |

Validation is the reason to use this over plain text: ask for a city and the customer may send a number or a photo. Retry is capped deliberately — *"the system should not sit there waiting forever."*

A timeout is a **business decision**, not a default. 60 seconds suits a live booking; hours suit a considered purchase where the customer is consulting someone.

## Conditions

- **All conditions** = AND — every condition must pass.
- **Any condition** = OR — one passing is enough.

Operators seen: **equals**, **starts with**, **greater than** (more exist in the dropdown).

**Name your nodes.** He calls this *"a very good practice"* — the First value field is populated by selecting from a named node (e.g. `package` → `replyTitle`), producing a variable like `{{UbGX5fr-G5.replyTitle}}`. Unnamed nodes are impossible to tell apart when linking.

Two outputs, **True** and **False**. Chain another Condition on False to test the next case. The **router** in the flow builder handles multi-way branching better — flagged for a later class.

## Limits seen on screen

| Item | Limit |
|---|---|
| Button message buttons | 3 max, third optional |
| Button text | Live counter, turns red when exceeded (~20 chars) |
| **List message rows** | **10 total across all sections** — not 10 per section |
| List message header | Text only or blank — no media |
| Ask Question message | 1024 characters |
| Retry count | 1–10 |
| CTA body / display / footer | 1024 / 20 / 60 |

> The 10-row rule catches people out. Add Kashmir and Manali under Domestic and **eight remain** for every other section combined.

## Closing every branch

End each branch with **Update Columns** + **Update Tag** so the conversation becomes a findable record rather than a chat log. In the demo the tag is `1.3 INTERESTED LEAD` — the numbered convention from [[whatsapp-tag-numbering-convention]] still in use. Because tags drive the filters in [[bizautomation-contact-filtering-and-import]], this is what makes the lead retrievable later.

Related: [[training-lesson-8-workflow-vs-ai-automation]], [[automation-trigger-and-action]]
