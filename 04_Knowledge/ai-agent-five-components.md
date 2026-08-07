---
title: The Five Components of an AI Agent
created: 2026-08-07
tags: [ai, agents, prompt-engineering, knowledge]
source: Class 8 recording — whiteboard, 12:38–19:06
origin: ai
author: claude-code
maturity: supported
---

# The Five Components of an AI Agent

The trainer's breakdown of any AI bot. Taught for WhatsApp but explicitly general — this is the structure of any agent, and it is worth learning as a reusable model.

| # | Component | What it is |
|---|---|---|
| 1 | **System prompt** | The agent's objective, role and rules |
| 2 | **User message** | What the customer actually asked |
| 3 | **Memory** | What keeps this conversation distinct from the others |
| 4 | **Knowledge base** | The reference material it can draw on |
| 5 | **Tools** | The external systems it can act in |

## 1. System prompt — treat it as a job description

His analogy is the useful part: write it exactly as you would **an employee's profile and job description**. You tell a new hire which clients they own, that they must maintain updates, and what tools they have. The system prompt is that instruction written for a machine.

Contents:
- **Role** — who this agent is
- **Goal** — what it is trying to achieve
- **Tools** — what it may use to get there
- **Guardrails** — its restrictions
- **Personality** — how it comes across
- **Tone** — how it sounds

**How much you write:** around **50–100 questions with their answers**. That is what he means by "training" the bot — not machine learning, but writing out what customers ask and how to answer. Plus instructions for what to do when a question falls *outside* that set, and whether it may answer from general knowledge or must hand off.

The system prompt is therefore the bulk of the configuration work, not a short paragraph.

## 2. User message

Simply the incoming text. His example: a family asking whether two children need a second room.

## 3. Memory — and the problem it solves

The problem stated before the answer, which is the instructive part:

- A customer does not ask one question. They ask a second, third, fourth.
- Meanwhile **ten different people** are messaging the same number simultaneously.
- How does the bot know this message belongs to *that* conversation?

**The answer: an identity key.** Memory is tracked against the **mobile number**, with a **thread / conversation ID** keeping each exchange distinct. Each conversation carries its own prior context and none bleed together.

This is why the mobile number matters structurally rather than as a contact detail — it identifies the contact record, carries the tags ([[whatsapp-tag-numbering-convention]]), and anchors the AI's memory. See also [[crm-and-field-model]].

## 4. Knowledge base

- A website link
- A PDF
- A text file
- Others depending on platform

Formats differ between platforms — he notes every software has its own conditions.

## 5. Tools — where it stops talking and starts working

| Tool | What the agent does with it |
|---|---|
| Google Sheets | Pushes captured detail into a sheet the team reads |
| API calls | Sends to or pulls from another system |
| Email | Sends inquiry detail, or an invoice, with nobody creating it |
| WhatsApp | Sends a further message in the same flow |
| CRM | Adds the lead directly |

His full-chain example: payment completes → booking detail captured → invoice emailed automatically. Each step is a tool the agent was granted.

## Scope caveat

The trainer is explicit that this programme covers the AI agent **only as far as WhatsApp needs it**. Full prompt-engineering training is a separate programme he references twice. For WhatsApp purposes, these five components and the 50–100 question list are the working knowledge.

Related: [[training-lesson-8-workflow-vs-ai-automation]], [[sop-automation-ai-progression]], [[sop-agent-7-step-method]]
