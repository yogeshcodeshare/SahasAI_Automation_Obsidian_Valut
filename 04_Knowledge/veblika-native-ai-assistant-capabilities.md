---
title: Veblika Native AI Assistant — Screenshot Evidence and Integration Boundaries
created: 2026-09-16
tags: [whatsapp, veblika, ai-assistant, chatbot, knowledge-base]
source: Yogesh's AI Assistant screenshots supplied 2026-09-16 and earlier Chatbot-V2 AI Agent screenshot in this conversation
origin: ai
author: codex
maturity: supported
---

# Veblika Native AI Assistant

## Observed in the supplied UI

- AI Assistant has Settings and Knowledge Base tabs, plus an Assistant Name.
- Prompt Configuration offers Predefined Prompts or Custom Prompt.
- Predefined roles shown: Customer Support Agent, Coding Assistant, Sales Assistant, General Assistant.
- Custom Prompt has a free-text instruction field.
- Knowledge Base accepts .txt files up to 1 MB according to its upload control. The screenshot shows zero uploaded files; the existence of the feature does not demonstrate retrieval quality.
- The earlier Chatbot-V2 AI Agent action has an Assistant selector, Stop Agent Keywords, timeout value/unit, welcome message and optional timeout message. This supports selecting a saved assistant in a chatbot.

## What remains to test

Yogesh reports that the assistant can also be configured in the separate Flow Builder. The supplied Flow Builder screenshots show integrations and HTTP actions, but do not show an action that selects this saved assistant. Record direct reuse in Flows as user-reported, pending a live action/configuration check. HTTP integration with an external AI service is a separate capability.

Do not infer persistent memory, contact-field writes, live calendar access, tool execution, conversation summaries or reliable Marathi/Hindi answers from a prompt/KB upload screen. Verify each in the actual build. Use explicit chatbot/form/workflow actions to save structured fields and reserve appointments.

## Relationship to older notes

[[veblika-gemini-ai-bot-flow]] documents a particular older five-node recipe. Its lack of a knowledge-base step must not be read as a claim that Veblika's native AI Assistant lacks a Knowledge Base feature.

[[whatsapp-chatbot-builder-reference]] documents the course-era nodes; this note supplies the newer AI Assistant configuration evidence. [[whatsapp-sahas-ai-current-build-brief]] describes general agent components, not proof that every component is exposed by this native assistant.

## Suggested agency configuration — not yet built

Use a Sahas AI custom prompt and an owner-reviewed TXT knowledge base containing service scope, approved plan information, FAQs, exclusions and human-handoff instructions. Use separate assistant configurations for prospect enquiries and existing-client support. Test language switching, unknown answers, timeouts and human takeover before demo use.

Related: [[veblika-platform-admin-reference]], [[ai-agent-five-components]], [[whatsapp-flow-builder-webhook-reference]].
