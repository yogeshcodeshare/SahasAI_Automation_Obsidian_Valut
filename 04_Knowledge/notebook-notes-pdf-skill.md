---
title: Notebook Notes PDF Skill (Sahas AI notes/carousel generator)
created: 2026-09-27
tags: [agency, content, pdf, skill, carousel, tooling]
source: Claude Code session with Yogesh, 2026-09-27 (skill built and approved page by page)
origin: ai
author: claude-code
maturity: supported
---

# Notebook Notes PDF Skill

An agent skill that turns any topic into Sahas AI's hand-lettered notebook-style PDFs: study notes,
Instagram/LinkedIn carousels (1080×1350), square posts, A4 pages or long A4 notes.

## Where it lives
- **Local (this laptop):** `C:\Yogesh - personal\Claude\Cluade Projects\Ai Automation\.claude\skills\notebook-notes-pdf\`
- **GitHub:** `github.com/yogeshcodeshare/sahas-notebook-pdf-skill`, first pushed 2026-09-27 while the repo was **public**. Yogesh said he would switch it to private; confirm before assuming it is private.
- **Skill name:** `notebook-notes-pdf`. It triggers on requests like "notes in my notebook style", "Sahas style PDF" or "carousel PDF".

## How it works
- The agent writes plain HTML with the skill's component classes, starting from `assets/template.html`.
- `scripts/render.py` injects the CSS, fonts and logos, checks every page for overflow, and prints a PDF with local headless Chrome/Edge. `--png` also writes page previews.
- Everything runs locally; nothing is uploaded.

## Options
- **Modes:** Light mode (default) and Dark mode. See [[sahas-notes-pdf-style-rules]].
- **Languages:** English, Hinglish and Marathi. See [[sahas-content-language-conventions]].
- **Rule files:** `SKILL.md`, `references/style-guide.md`, `references/languages.md`.

## Origin and guardrail
- Built after comparing third-party "automation notes" carousels. No existing skill reproduced that notebook look, so it was written from scratch.
- It was then deliberately re-styled (fonts, text colours, logos, badge, dark mode) so it reads as Sahas AI's own design rather than a copy of the reference creator.
- No reference-creator material is stored in the skill or its repo.

Related: [[sahas-ai-logo-direction]], [[ai-content-strategy-blueprint]], [[sahas-ai-content-calendar]], [[on-demand-skill-installation-policy]].
