---
title: Compress Media Before Upload
created: 2026-08-07
tags: [whatsapp, media, delivery, best-practice, knowledge]
source: Class 5 recording — demonstrated live at 29:56
origin: ai
author: claude-code
maturity: supported
---

# Compress Media Before Upload

A small operational habit with a disproportionate effect on how a broadcast lands. The instructor flags it as something "not everyone will tell you".

## The rule

**Always compress image, video and document files before uploading them to a template.**

Measured live in class:

| | Before | After |
|---|---|---|
| File size | 1.79 MB | **358.54 KB** |
| Reduction | — | **81% smaller** |
| Visible quality change | — | **None, including zoomed** |

The saving is effectively free — he verifies the compressed image afterwards and confirms it is identical.

## Why it matters at scale

Send to 500 people with a heavy image and every one of those messages is slow to arrive and slow to download. Compressed, the message lands fast for everyone.

This is a **user-experience** argument as much as a technical one: a customer who has to wait for an image to download often does not wait. On a paid marketing send, that is spend converted into nothing.

## Tools

| Tool | For |
|---|---|
| iloveimg.com | Images — the compress-image function |
| iLovePDF | PDFs — compress-PDF |
| Canva | Editing and watermark removal (free inside their full programme, otherwise paid) |

## Related constraints

Carousel card images are capped at **5 MB** and general header images at roughly 14 MB — see [[whatsapp-template-anatomy]]. Compression is often what brings a generated poster under the carousel limit in the first place, so it is not only a speed optimisation.

AI-generated creative arrives watermarked; removing that is a separate editing step, and the instructor is candid that it is fiddly rather than instant.

Related: [[training-lesson-5-templates-mastery]], [[whatsapp-number-safety-warm-up]]
