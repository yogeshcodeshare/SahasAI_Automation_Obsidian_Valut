---
title: GST purchase-bill test scenarios (demo test kit)
created: 2026-10-08
tags: [testing, gst, document-ai, ai-accountant]
source: AI Accountant demo kits (batch 1 2026-10-05, batch 2 2026-10-07); GST invoice research
origin: ai
author: claude-code
maturity: supported
---

# GST purchase-bill test scenarios

Two fictional test kits (all companies, GSTINs and amounts invented and marked DEMO) used to prove [[ai-accountant-w1-inbox-processor]]. Each kit has a README with the expected result per file and a Python generator in the project's `Documents/` folder.

## Batch 1 (15 bills)
Clean PDF · inter-state IGST · scanned image-only PDF · tilted phone photo · Word file · duplicate re-sent on WhatsApp · totals wrong · invalid GSTIN check digit · quotation · password PDF · handwritten cash memo (no GSTIN) · blurry photo · same-state supplier charging IGST · clean PNG · WhatsApp-compressed image.

## Batch 2 (23 files, new suppliers)
- **Positive:** two GST rates + round-off · lakh-format amounts + "05-Oct-2026" date · 2-page bill (totals on page 2) · e-invoice with IRN / Ack no / QR · upside-down photo · Word services bill (SAC, due date) · Marathi + English PNG · .webp image.
- **Negative:** billed to another company · credit note · delivery challan · other-state supplier charging CGST + SGST · no invoice number · photo cut off before the totals · same bill re-sent as a photo.
- **Edge:** bill of supply (composition, ITC No) · two bills in one PDF · reverse charge (GTA freight) · .tif scan.
- **Other file:** Excel invoice · invoice saved as a web page · bill inside a ZIP · email text file.

## What the kits proved
Checks fire only if the reader copies values exactly as printed; compressed images need a second reader; the edge cases exposed rules worth adding (bill-of-supply ITC, multi-bill files, RCM, TIFF). Duplicates: whichever copy is processed second is flagged.
