---
title: Training — Lesson 12 (WhatsApp Form Data to Google Sheets)
created: 2026-08-12
tags: [training, whatsapp, google-sheets, oauth, knowledge]
source: Class 12 recording — "Capturing WhatsApp Form Data & Sending It to Google Sheets" (46:59)
origin: ai
author: claude-code
maturity: supported
---

# Training — Lesson 12 (WhatsApp Form Data to Google Sheets)

The first lesson in the series that leaves BizAutomation entirely. Follows [[training-lesson-11-whatsapp-flow-mastery]]; position in the course at [[whatsapp-course-curriculum-map]].

> Trainer's recommendations, not practices Sahas AI has validated in delivery. Kept at `supported`.

## What gets built, in one line each

1. A plan-selection form flow, rebuilt with the same webhook mechanics as [[training-lesson-11-whatsapp-flow-mastery]], now filtered by **flowId** as well as `nfm_reply` → [[whatsapp-flow-builder-webhook-reference]].
2. A Router branching Monthly vs Annual plan, using **Contains** rather than **Equal** — the first appearance of that operator in this series.
3. A live bug — an action node added in the wrong place, breaking both branches identically — diagnosed and fixed on screen.
4. A full Google Cloud Console OAuth setup, connecting Google Sheets, so every form submission writes itself into a spreadsheet.

## Why flowId matters — the genuinely new idea

Class 11 filtered form submissions on `content.interactiveType equal "nfm_reply"` alone — correct for one form, but not enough once a business runs several. This lesson adds a second condition: `flowId equal <this form's own ID>`, copied directly from a real test payload. Together the two conditions guarantee downstream logic only fires for **this exact form**, even if several forms share the same webhook. Full mechanics appended to [[whatsapp-flow-builder-webhook-reference]].

## The OAuth setup — a reusable reference, not a one-off

The Google Cloud Console walkthrough is generic enough to reuse for any Google integration, not just this course → [[google-oauth-setup-for-bizautomation]].

**The trap worth remembering on its own:** an OAuth app left in **Testing** mode expires roughly weekly and needs re-authenticating every time until it's explicitly **published to Production**. Missed, this reads as a mysterious recurring failure rather than what it actually is — a one-step fix.

## The live bug, kept in deliberately

An action node was added one level too low in the chain, breaking the Monthly branch. The trainer initially treated it as isolated, moved on to build Annual the same way, and the **identical bug reappeared** — because it was the same mistake copied twice, not two separate problems. The fix: rebuild the affected section cleanly rather than patch around the misplaced node.

**Worth carrying forward as a debugging habit:** when an error resurfaces on a different branch after a fix, check whether the *same* mistake was repeated, not just whether the new branch has its own bug.

## A naming mismatch worth flagging

The trainer calls the Google Sheets action an "update row" node throughout the class. The interface's actual label is **Create spreadsheet row**. Functionally it adds a new row per submission, matching what "Create spreadsheet row" says it does — worth knowing if searching the interface yourself.

## Note on sources

As with prior lessons, neither the Veblika knowledge-base document nor veblika.com/products/whatsapp-automation covers this material. The video is the sole source.

## Capture note

The user supplied a tentative outline with its own timestamps for this lesson. Per instruction, only the outline's **content and sequence** were used as guidance — every timestamp in the delivered document was taken from the actual transcript.

Related: [[whatsapp-flow-builder-webhook-reference]], [[google-oauth-setup-for-bizautomation]], [[training-lesson-11-whatsapp-flow-mastery]]
