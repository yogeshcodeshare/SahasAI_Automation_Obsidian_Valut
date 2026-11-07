---
title: Sarvam voice agents — lessons from building V1 through the Sarvam MCP
created: 2026-11-05
tags: [voice-agent, sarvam, mcp, lessons, renault]
source: Claude Code session 2026-11-05 (building and testing the V1 outbound agent "Anjali")
origin: ai
author: claude-code
maturity: supported
updated: 2026-11-07
---

# Sarvam voice agents — lessons from building V1 through the MCP

Platform facts live in [[sarvam-voice-agents-platform-facts]]; the project is [[ai-voice-calling-agents-sarvam]]. These are the things that only showed up while building and testing.

## Prompt and config rules the platform enforces
- **No language-switching rule in the prompt.** A line like "reply in the language the customer speaks" is refused. Switching comes from the allowed-languages settings and speech detection; a prompt rule would make the agent switch on one English word.
- **Write the tool before the prompt that calls it** (`call tool:search_knowledge` is refused if the tool does not exist). Same for variables.
- **Call goal = one variable, one value.** For "booking OR confirm OR reschedule", add a boolean output variable and test it for `true`.
- **Fallback text for a failed tool is fixed**, so write it in simple English.
- **Allowed values only:** temperature 0–1, speech pace 0.9–1.4, max call 60–1500 s; Bulbul V4 has no Malayalam/Odia/Assamese.
- **Draft vs committed:** committing freezes version N and starts a new draft N+1. n8n calls a version number, so after changing the prompt: recommit and update `app_version` in the dispatcher config.

## Working through the MCP
- **Edit prompts only through the MCP while it is the source of truth** — the dashboard page can save an older copy of the Instructions box over an MCP edit.
- **Greeting translations** are generated from the English greeting; variables must be real `{{name}}` references, not typed text, or the save errors ("reference not found").
- **System variables** `current_day`, `current_time`, `current_date` work inside the prompt (checked with a chat turn: it answered the right day and time).
- **Read the call back after every test:** `analytics` interactions list, then the interaction by id, gives the English transcript, captured variables and goal status.
- **Test agent calls are debug calls**: they ring a real phone but never send the result webhook, so n8n V-2 does not run. Test V-2 by replaying a payload (see [[n8n-lessons-whatsapp-agent-team]]).
- A read-only Supabase MCP blocks deletes; run cleanup SQL in the Supabase editor.

## Voice quality
- **Code-mixed speech (Marathi+English, Hindi+English)** sounds natural; pure Marathi/Hindi is not understood well by real customers. The prompt lists the English words to keep and gives example sentences.
- **Pronunciation dictionary** (Devanagari spellings, one list per language): "Renault" must be written रेनो so it is said "Reno".
- Never let the agent promise what no tool does (sending a location to a roadside service, sending documents on WhatsApp). See [[decision-voice-emergency-calls-never-wait-until-morning]].

## Added 2026-11-07 — building the inbound agent
- **Clone an agent to start a sibling** (configure_agent with clone_from + version): config, prompt and API tools copy; the **pronunciation dictionary does not**.
- **The MCP cannot attach a credential to a tool** — create the tool without auth, then select the secret on the tool in the console.
- **On-start tool** (`webhook_on_start`, via configure_app_tool): send the caller's number with a **system variable** `user_identifier` in the body, and map the reply fields into agent variables with save-to-variables.
- **Call transfer:** set `call_transfer_config` (blind, phone) and turn the `call_transfer` tool on; the prompt must actually call it. Works on Vobiz connections only.
- **Removing variables** the prompt still uses is refused — rewrite the prompt and null the variables in the same call.
- **Chat test** (send_chat on the draft version) is cheap and catches wording problems — it showed the agent saying a slot "चालेल" (is available); fixed by a rule that it cannot see the calendar.
