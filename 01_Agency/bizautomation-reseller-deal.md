---
title: Bizautomation Reseller Deal
created: 2026-08-02
updated: 2026-09-16
tags: [agency, vendors, bizautomation, ghl, veblika]
source: Claude planning conversation
origin: ai
author: claude-code
maturity: established
---

# Bizautomation Reseller Deal

Bizautomation (Delhi, ~3 yrs, ~200 clients) mentors Yogesh and provides reseller access. Solves the "can't afford GHL $497/mo" problem by renting sub-accounts cheap.

## Terms (agreed)
- **GHL sub-account:** ~₹1,000+GST/mo or ₹8,000/yr (list ₹2k/₹12k). Resell to client at ₹3,000–5,999/mo → 3–6× margin.
- **Veblika (WhatsApp):** ~₹1,000+GST/mo or ₹8,000/yr (list ₹2k/₹10k). See [[whatsapp-automation-vendors]].
- **Combo (GHL + WhatsApp) ₹15k+GST/yr — ALREADY BOUGHT** (for himself, 1 yr).
- **Hostinger VPS affiliate ₹15k+GST / 2 yrs** — planned in 2–3 weeks. NOTE: VPS plans do NOT include a free domain — buy domain separately (~₹1k/yr).

## Risks (building on rented rails)
1. Clients live in Bizautomation's GHL/Veblika accounts → migrate to own agency license once 5–8 stable clients.
2. Get in writing: can he resell sub-accounts? per-client cap? notice on price changes? data export on exit?
3. Confirm Veblika WABA ownership: client's number should sit in CLIENT's Meta Business Manager (churn-safe), not Veblika/Bizautomation's.
4. Confirm GHL sub-account price stays ₹1k as clients are added (per-account vs flat).

## Review trigger — reseller rails vs own SaaS

Remain on the reseller arrangement while Sahas AI validates demand and delivery. **Revisit the reseller-vs-own-SaaS question when: 5–8 stable paying clients AND written portability/ownership terms are in hand.**

That review must confirm WABA ownership, client-data export, account migration, pricing-change notice, and the commercial cost of an independent agency stack. The open WABA ownership questions are tracked in [[whatsapp-api-onboarding]].

## Account reuse when a client leaves
- **n8n** — fully yours; delete + reuse instantly (default layer for this reason).
- **GHL** — delete sub-account (permanent after 24h) or pause; recreate from snapshot. No one-click wipe.
- **WhatsApp/BSP** — number migrates between WABAs (same Meta Business Manager), but display name is verified to a business → can't reassign identity. Best model: client owns WABA + number, pays BSP directly, you charge setup + management → zero stranded cost.

## Update — 2026-08-14: formal associate partnership, public pricing found, unreconciled conflicts

Sahas AI is now a **formal associate partner of BizAutomation** (bizautomation.io). Several things surfaced this session that need Yogesh's direct verification before being treated as fact — none of this is established yet:

- **Legal entity name**: bizautomation.io's own site footer reads "SPBG BizAutomation Private Limited," not simply "BizAutomation Private Limited." Confirm the exact name before it's cited anywhere public (e.g. an "Associate Partner" credit on the Sahas AI site).
- **Relationship to automationsaathi.com**: NOT confirmed to be the same company. That site's footer shows a *different* legal entity ("KTPG Professional Saathi Corporate Consultant Private Limited"), and neither site cross-links to the other publicly.
- **Public B2C pricing found** (a 3-page BizAutomation marketing PDF, not a partner-terms document): Starter ₹999/mo, Pro ₹1,499/mo, Elite ₹2,499/mo, all +18% GST. **WhatsApp Business Automation only unlocks at the Elite tier** — it is not sold separately. A Website/Landing-Page/Forms builder is included from Starter up (see [[decision-hostinger-kvm2-dokploy-website-n8n]]'s update). **This conflicts with the ~₹1,000/mo separate GHL and ~₹1,000/mo separate Veblika figures recorded above** — unreconciled. Possible explanations: the terms above may be older, or may reflect actual negotiated partner/reseller pricing distinct from this public B2C listing. Confirm directly with the BizAutomation contact before quoting either figure to a client or updating [[pricing-ladder]].
- No reseller margin, white-label terms, or minimum-commitment figures were found in the source PDF — the terms above (from the original deal conversation) remain the only reseller-specific numbers on record, but are now unverified against current pricing.

Full detail and open-items tracking: [[whatsapp-automation-agency-phased-plan]].

## Update — 2026-09-16: observed operational link to Automation Saathi (evidence, not proof)

The "no cross-links between them" point above needs qualifying. The training course Yogesh holds locally is itself the link:

- The course — *AI-Powered WhatsApp Automation System*, a 12-lesson WHATSAPP BUSINESS API module — is hosted at **`client.automationsaathi.com`**.
- The platform it teaches, and the signup link given inside the lessons, is **`https://app.bizautomation.io/signup`**.
- The instructor account is **Automation Prince (Ai Automation Coach)**; the on-screen watermark reads Prince Gupta.
- The vendor knowledge-base document supplied with it is branded Veblika over the same BizAutomation product.

So the two brands are operationally entwined — one sells the course that onboards you to the other. That is a real commercial relationship and worth knowing. It is **still not proof of a single legal entity**, which is what the open item actually asks: the footers name *SPBG BizAutomation Private Limited* and *KTPG Professional Saathi Corporate Consultant Private Limited* respectively, and a course-hosting arrangement is compatible with either same-group or arm's-length structures.

**Do not resolve Phase-0 item 8 on this evidence.** The question that matters commercially — which legal entity Sahas AI's associate-partner terms are actually with, and whose name goes on any public "Associate Partner" credit — still needs a written answer from the BizAutomation contact. Source detail: [[whatsapp-course-curriculum-map]].
