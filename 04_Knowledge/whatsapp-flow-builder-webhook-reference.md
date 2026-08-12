---
title: WhatsApp Flow Builder — Webhook and Router Reference
created: 2026-08-12
tags: [whatsapp, flow-builder, webhook, reference, how-to, knowledge]
source: Class 11 recording — WhatsApp Flow Mastery
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Flow Builder — Webhook and Router Reference

BizAutomation's **Flow Builder** (`Sidebar → Flows`) is a separate canvas from the **Chatbot-V2 builder** used throughout [[whatsapp-chatbot-builder-reference]]. Where the chatbot builder offers guided trigger/action nodes, the Flow Builder is webhook-first: you read raw JSON, filter it with conditions, and branch with a dedicated Router node.

## The trigger: a webhook, connected by copy-paste

`Choose Trigger → Select App → Whatsapp bizautomation`. A connection is selected, then BizAutomation generates an endpoint URL — copy it and paste it into the WhatsApp side's webhook field. Not automatic; a manual two-step link.

Other trigger apps available in the same picker: Scheduler, Shopify, Tradeindia, Webhook, Woocommerce, Zoom (Webhook) — this Flow Builder isn't WhatsApp-only.

## The raw event shape

Every inbound WhatsApp message becomes one JSON event:

```
event: "message"
data.senderName / data.senderPhoneNumber
data.messageId / data.messageTimestamp
data.messageType: "text" | "interactive"
data.content: shape depends on messageType
```

| `messageType` | `content.interactiveType` | What it means |
|---|---|---|
| `text` | — | Plain message; `content.text` holds it |
| `interactive` | `list_reply` | A list-message row was tapped |
| `interactive` | `button_reply` | A quick-reply button was tapped |
| `interactive` | **`nfm_reply`** | **A WhatsApp Form was submitted** |

**`nfm_reply` is the load-bearing constant.** Whatever fields a form asks for, a submission always arrives with `content.interactiveType` equal to exactly that string. One Condition node checking for it reliably isolates form submissions from every other message type in a single filter.

Form answers themselves live nested under `content.nfm_reply.screens.0.[fieldname]` — keyed by the field names set when the form was built in [[whatsapp-forms-builder-reference]].

## Filtering: Continue if conditions match

- First value: mapped via the platform's own data picker to `content.interactiveType` — never typed by hand, so the path is guaranteed correct.
- Operator: Equal.
- Second value: `nfm_reply`.

Test output for a genuine match: `{"evaluation": true}`.

## Update Contact

Matched by phone number — the same identity-key pattern as [[ai-agent-five-components]]'s memory mechanism and [[crm-and-field-model]]. Can write name, project, configuration, lead stage, and every other custom field, all sourced from the mapped webhook data rather than typed manually.

**Before mapping anything: decide update-vs-create.** The node is configurable for whether an existing phone number's contact gets updated or a new one gets created — confirm this deliberately rather than assume it.

## Router — branching a flow multiple ways

| Execution mode | Behaviour |
|---|---|
| **First matching branch** | Stops at the first branch whose condition is true — an if/else-if chain. Later branches are skipped even if they'd also match. |
| **All matching branch (left to right)** | Evaluates every branch; runs every one that's true, not just the first. |

Each branch carries its own condition (e.g. `Project Preference equal "Gurgaon Nirvana"`) and its own downstream action chain — in Class 11, a different **Auto Assign Contact** node per branch, routing the lead to a different named employee per project.

**Name every branch as you create it** — the same discipline as node-naming in [[whatsapp-chatbot-builder-reference]], more important here because an unnamed branch in a multi-way router is unreadable at a glance.

## A real failure mode: "Execution step not found"

Surfaced live in Class 11 when a later branch referenced a step that hadn't been mapped consistently with an earlier branch. Fix: go back into the node and remap the field (e.g. Phone Number) to the correct source explicitly. Read the error literally — it means exactly what it says, a referenced step doesn't exist where expected — then check every branch got the same mapping treatment, not just the one being tested.

Related: [[training-lesson-11-whatsapp-flow-mastery]], [[whatsapp-chatbot-builder-reference]], [[automation-trigger-and-action]]
