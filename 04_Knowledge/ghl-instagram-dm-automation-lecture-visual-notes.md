---
title: GHL Instagram DM Automation — visual lecture notes
created: 2026-09-20
tags: [ghl, instagram, direct-message, automation, workflow, training, source-video]
source: Local video — GHL Account/Video lecture/3_2 Build Instagram DM Automation in GoHighLevel - Refined 0-22m.mp4
origin: ai
author: codex
maturity: supported
---

# GHL Instagram DM Automation — visual lecture notes

## Evidence boundary

This note is derived from the refined 0:00–22:00 cut of the local recording `3_2 Build Instagram DM Automation in GoHighLevel.mp4`. The original 52:39 recording was retained; the refined copy is the working source for the guide and excludes the accidental recording tail. The watch pass recovered 40 scene-selected screenshots. No embedded captions or transcript were available, so this note records visible UI labels, controls, example messages, branches, and test states only.

The companion Word guide and supporting files are saved in the GHL Account `Video lecture` folder:

- `3_2 Build Instagram DM Automation in GoHighLevel - Refined 0-22m.mp4`
- `3_2 Build Instagram DM Automation in GoHighLevel - Complete Visual Lecture Guide.docx`
- `supporting files/3_2 Build Instagram DM Automation in GoHighLevel/frames/`
- `supporting files/3_2 Build Instagram DM Automation in GoHighLevel/watch-report.md`

Raw frames remain outside the vault note. No credentials, tokens, or personal contact values are stored here.

## Visible lesson objective

The lesson page visible near the start of the recording states: “Learn how to trigger Instagram DM auto-replies from keywords, add interactive buttons, prevent repeated responses with tags, and manage conversations inside GoHighLevel.” This description is screen-visible evidence from the course page, not a recovered audio transcript.

## Visually confirmed workflow

1. **Instagram DM entry:** the workflow builder is titled `GHL 1.3 INSTA DM AUTOMATION` and shows a `Customer Replied` trigger. The visible trigger card identifies Instagram DM as the reply channel and shows a message-body condition in truncated form.
2. **Interactive response:** the trigger feeds an `Instagram Interactive Messenger` action. The action panel visibly supports message content, adding files through a URL, Buttons or Quick replies, and a default wait step.
3. **Choice branches:** the canvas shows `Default Timeout`, `GRAB OFFER`, and `Whatsapp Us` paths. The `GRAB OFFER` path continues to an `Add Tag` action; the labels are examples shown in the recording, not mandatory production names.
4. **Recipient test:** the `automation_saathi` Instagram profile shows an automated message with `GRAB OFFER` and `Whatsapp Us` buttons. A mobile-style view is also shown as a recipient-surface check.
5. **Operational handoff:** the GoHighLevel Conversations/Team Inbox shows the Instagram thread, the generated message, interactive buttons, contact details/tags, and a reply/internal-comment composer.

## Practical operating interpretation

- Confirm the intended Instagram asset and test account before enabling the workflow.
- Define the keyword or message-body condition explicitly and test misspellings, unrelated messages, and repeat contacts.
- Keep the first response concise, truthful, and appropriate for a direct-message context.
- Add only buttons with a clear tested destination. The recording’s promotional copy and offer graphic are demonstrations, not approved reusable copy.
- Keep a default-timeout path so a contact who does not select a button has a defined outcome.
- Use a tag on the relevant branch only after deciding what the tag means operationally; the recording demonstrates `Add Tag` but does not establish a required naming convention.
- Test a new contact, a repeat contact, each button, timeout, invalid input, destination link, tag state, and human handoff.
- Review the resulting conversation in Team Inbox before sending real traffic. Publishing, messaging, and external-link actions remain owner-approved side effects.

## Related vault notes

- [[ghl-social-media-scheduling-comment-management-lecture-visual-notes]] — Social Planner, multi-channel posting, previews, and centralized comment replies.
- [[ghl-ads-manager-lead-generation-lecture-visual-notes]] — Meta/GoHighLevel lead-generation ads, creative, previews, lead forms, and review state.
- [[ghl-sales-workflow-trigger-actions-lecture-visual-notes]] — workflow triggers, action chaining, testing, and publish controls.
- [[ghl-contacts-and-opportunities-lecture-visual-notes]] — contacts, opportunities, pipelines, custom fields, and Smart Lists.
- [[decision-ghl-deferral]] — current Phase 2 GHL adoption decision and capability evidence pointers.

## Reverification needed

Verify current GoHighLevel labels, Instagram integration behaviour, permissions, platform policies, link destinations, and account-specific limits in the live account before using this visual note as a production SOP.
