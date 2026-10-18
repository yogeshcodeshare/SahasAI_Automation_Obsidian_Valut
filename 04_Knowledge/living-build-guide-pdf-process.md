---
title: Living build-guide PDF process (screenshots added as we build)
created: 2026-10-08
tags: [pdf, documentation, process, notebook-style]
source: AI Accountant build guide and Google credentials guide, 2026-10-05 to 2026-10-08
origin: ai
author: claude-code
maturity: supported
updated: 2026-10-18
---

# Living build-guide PDF process

How Yogesh and Claude document a build while doing it, so each workflow ends with a reusable, screenshot-backed guide. Used for the AI Accountant guide (44 pages) and the Google credentials standard guide (21 pages). Style and renderer: [[notebook-notes-pdf-skill]] and [[sahas-notes-pdf-style-rules]].

## Loop
1. Claude gives **2–3 build steps** (exact node names, settings, what to expect). Yogesh builds them himself.
2. Yogesh sends screenshots (he marks key fields with red boxes and arrows).
3. Claude checks the screenshots for mistakes first (wrong mapping, missing setting, item counts).
4. Claude adds them to the guide HTML, re-renders the PDF and sends it.

## Screenshot handling
- Keep the untouched original in `screenshots/_original/`.
- **Crop** empty panels and irrelevant areas.
- **Add red boxes or arrows** where Yogesh did not already highlight the important field — same red style as his.
- Name `W1-NN-what-it-shows.png`, numbered in order. Helper script in the project: `tools/guide_shots.py` (crop / box / arrow).

## Page pattern
Breadcrumb tab → heading "Step N — …" → one-line intro → screenshot(s) with a numbered caption (**what to click** + what you see) → settings table → one note box for the lesson. A real bug gets its own "Lesson: …" page (for example "read the output, not just the green tick").

## Render and verify
Render with the skill's `render.py --png`; it must report "all pages fit". Look at every changed page preview; fix overflow and wrapped headings. A PDF open in a viewer is locked on Windows — render to a new file name.

## Derived documents
A prospect-facing overview is cut from the same HTML (concept pages only, plain-language rewrite, sourced facts, no build pages).

Update 2026-10-09: the Email AI Agent project generates its client copy with a script (`tools/make_overview.py`) from the build-guide HTML after every change, so the prospect PDF never drifts from the working guide. Screenshot names there use `E1-NN-…` (E1 = Setup workflow). Used in [[email-ai-agent]].

## "How everything connects" full-flow page (added 2026-10-17)
Every build guide and its client overview now carry one full-flow map page (model: AI Accountant guide page 6). Yogesh's rule: the **parts are standard, the shape is not** — each map follows that automation's real structure, never a copied skeleton.
- Write the shape in one line first (e.g. Resume: trigger → loop per file → file-type switch → has-text gate → parallel contact|qualifications → merge → duplicate gate → summary → scorer with job side box → save → score switch).
- Map each construct to a part: switch → diamond/lanes · IF → dashed box, "no" sideways · loop → dashed frame + drawn return arrow (font lacks ↻) · parallel → split + merge · lookup/KB/memory → side box, dashed blue line · save → thick navy box · human → amber · scheduled → orange · not built → dashed "(planned)". Outcomes green / amber / red.
- Client overview map uses plain words only — no tool, model or build names; `make_overview.py` blocks banned words (plus per-project `banned_extra`).
- Applied to [[resume-screener-ai]] and [[renault-whatsapp-rag-agent-meta]] guides; parts kit lives in the skill's `assets/full-flow-snippet.html`.

## Screenshot badge colour on dark screens (added 2026-10-18)
Yogesh's rule: highlight boxes and arrows stay **red**, but the numbered step badge turns **green** when the screenshot is dark (dark UIs with red/orange text make red badges disappear). On light screenshots it stays red. The skill's `annotate.py` picks this automatically (`"badge": "auto"`, override `"red"`/`"green"`). Used for the Veblika screenshots in [[renault-whatsapp-agent-veblika]].
