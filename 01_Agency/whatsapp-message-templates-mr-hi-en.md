---
title: WhatsApp Message Templates (Marathi / Hindi / English)
created: 2026-08-05
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
