---
title: WhatsApp Message Templates (Marathi / Hindi / English)
created: 2026-08-05
updated: 2026-08-23
tags: [templates, whatsapp, multilingual, sahas-ai]
source: Claude Desktop conversation - AI Automation project
origin: ai
author: claude.ai
maturity: supported
---

# WhatsApp Message Templates (मराठी / हिंदी / English)

Reusable, Meta-approvable template library. Placeholders in `{{ }}`. Marathi-first (Karad). Categories per [[whatsapp-api-pricing-model-india]].

## Greeting (agency) — user-initiated / free
- **EN:** 🙏 Namaste, welcome to Sahas AI! More enquiries, less manual work. 3 quick questions — what's your business? (clinic / coaching / salon / shop…)
- **MR:** 🙏 नमस्कार, सहस AI मध्ये स्वागत आहे! जास्त चौकशी, कमी मॅन्युअल काम. ३ छोटे प्रश्न — तुमचा व्यवसाय कोणता?
- **HI:** 🙏 नमस्ते, सहस AI में स्वागत है! ज़्यादा पूछताछ, कम मैनुअल काम। ३ छोटे सवाल — आपका बिज़नेस क्या है?

## Greeting (coaching) — user-initiated / free
- **EN:** 🙏 Namaste! Welcome to {{coaching_name}}. I can help with admissions, batch timings and a free demo lecture. What is the student's name?
- **MR:** 🙏 नमस्कार! {{coaching_name}} मध्ये स्वागत. प्रवेश, बॅच वेळा आणि मोफत डेमो लेक्चरसाठी मदत करतो. विद्यार्थ्याचे नाव?

## Demo/appointment reminder — Utility
- **MR:** ⏰ आठवण: {{student}} चे मोफत डेमो लेक्चर उद्या {{day}}, {{time}} वा. आहे. पुष्टीसाठी 1, वेळ बदलण्यासाठी 2.
- **HI:** ⏰ रिमाइंडर: {{student}} का फ्री डेमो {{day}}, {{time}} बजे है। कन्फर्म के लिए 1, री-शेड्यूल के लिए 2.

## Fee installment reminder — Utility
- **MR:** नमस्कार 🙏 {{student}} चा {{n}} वा हप्ता ₹{{amount}} — देय दिनांक {{date}}. एका क्लिकमध्ये भरा: {{pay_link}}. आधीच भरले असल्यास दुर्लक्ष करा.

## Review request — Utility (7 days post-service)
- **MR:** 🙏 तुमचा अनुभव कसा होता? १ मिनिटात Google रिव्ह्यू द्या: {{review_link}}. मित्राला सुचवायचे? {{referral_link}}

Used by: [[agency-automation-plan]] · [[coaching-class-vertical-playbook]]

## Sahas AI first lead-automation library — 2026-08-23

The first live library is intentionally limited to lead capture, qualification, demo delivery, booking, reminders, and recovery. Create and test the English version first; add Marathi and Hindi language versions after the flow is stable. Use the same template name for language versions where Veblika/Meta supports that relationship; do not send all languages in one message.

| Order | Template name | Trigger / purpose | Stage |
| --- | --- | --- | --- |
| 1 | `lead_welcome` | Welcome a Meta Lead Form lead and ask permission to continue | 1.1 NEW LEAD |
| 2 | `qualification_incomplete_followup` | Lead stopped during qualification | 1.2 QUALIFICATION IN PROGRESS |
| 3 | `requested_demo_delivery` | Send a case study or demo requested by the lead | 1.4 SOLUTION / DEMO SHARED |
| 4 | `growth_check_followup_day_2` | Qualified lead has not booked a call | 1.3 QUALIFIED |
| 5 | `growth_check_followup_day_4` | Second and final booking nudge before nurture | 1.3 QUALIFIED |
| 6 | `call_booking_confirmation` | Confirm a booked Growth Check call | 1.5 CALL BOOKED |
| 7 | `call_reminder_24h` | Reminder 24 hours before the call | 1.5 CALL BOOKED |
| 8 | `call_reminder_1h` | Reminder 1 hour before the call | 1.5 CALL BOOKED |
| 9 | `call_reschedule` | Help a lead choose a new slot | 1.5 CALL BOOKED |
| 10 | `no_show_rebook` | Invite a missed-call lead to reschedule | 1.13 NURTURE / 1.14 LOST |

### Confirmed Veblika build decisions

- `lead_welcome` was created as an English Text template with `{{1}}` for the name, a Utility category selection, plain text plus light WhatsApp emphasis, and the quick replies `Yes, Continue` and `STOP`.
- The `STOP` quick reply is deliberate: it matches the configured opt-out keyword and should route to native opt-out handling. The footer may remain the platform/agency footer if the STOP button is present and tested.
- Do not add `Talk to team` or a phone-number CTA to the first welcome. Add human-handoff/contact buttons later, after the lead has been qualified and shows intent.
- Website, QR, organic WhatsApp, and Click-to-WhatsApp leads normally receive the regular chatbot welcome because they initiate the conversation. `lead_welcome` is primarily for Meta Lead Form leads that have not yet started a WhatsApp chat.
- Template categories are working submissions, not guarantees. Neutral form-follow-up may be submitted as Utility; proactive qualification and nurture follow-ups are Marketing candidates. Meta can recategorise after review.
- Every proactive template should include a clear STOP path, respect native opt-out status, and stop the sequence when the lead replies, books, hands off, opts out, or is closed.

### Out of the first lead library

Proposal, payment, onboarding, review/referral, renewal, reactivation, webinar/event, and client-support templates are later libraries. The Digital Akshay workshop messages and visuals remain private structural references only in [[digital-akshay-workshop-funnel-reference]]; they are not Sahas copy, claims, branding, or public creative.
