---
title: WhatsApp Catalog Setup (Commerce Manager)
created: 2026-08-07
tags: [whatsapp, catalog, commerce, meta, how-to, knowledge]
source: Class 6 recording — WhatsApp Catalog & Payments
origin: ai
author: claude-code
maturity: supported
---

# WhatsApp Catalog Setup (Commerce Manager)

How to put products into WhatsApp. The catalog does **not** live in your WhatsApp platform — it lives in Meta's Commerce Manager and is referenced by ID.

## Which system does what

| System | What you do there |
|---|---|
| Your WhatsApp platform | Build and submit the catalog template; send it |
| **Commerce Manager** | Create the catalogue; add/edit products; **find the IDs** |
| WhatsApp Manager | Connect the catalogue to the number; toggle chat-header and basket |
| Meta Business Suite | The portfolio that owns all of it → [[meta-business-portfolio-map]] |

## The catalog template

| Setting | Value |
|---|---|
| Template Category | **Marketing** — utility will not approve |
| Template Type | **Text** — always; images come from the catalogue |
| Interactive Action | Product Card Carousel |
| Cards | Up to 10 |
| Per card | A button label only |
| Needed at send | **Catalog ID** (once) + **Product Retail ID / Content ID** (per card) |

> **Never mislabel a marketing template as utility.** The trainer is emphatic: doing it repeatedly teaches Meta's classifier the pattern, and your *genuine* utility templates start being reclassified as marketing — capped and ~6× more expensive. See [[whatsapp-template-categories-and-approval]].

## Product fields

Required in the CSV: `id` · `title` · `description` · `availability` · `condition` · `price` · `link` · `image_link` · `brand`

Optional: `google_product_category` · `fb_product_category` · `quantity_to_sell` · `sale_price` · `sale_price_effective_date` · `item_group_id` · `gender` · `colour` · `size`

Upload accepts CSV, TSV, XML (RSS/ATOM) or XLSX up to **100 MB**, or connect a data feed from a hosted file or Google Sheet. Shopify and WooCommerce integrate directly.

Manual entry limits: title 200 characters, description 9999.

## Numbers to remember

- **5 products minimum** to run Advantage+ catalogue ads.
- **Sale price** is what produces the struck-through original price the customer sees. Price alone gives a plain number.
- Compress product images before upload → [[compress-media-before-upload]]. The customer literally watches the download.

## Errors

| Error | Means | Fix |
|---|---|---|
| `Product can't be shown: Price missing` | Product has no price | Edit item, add price. **Silent** — only visible in the product's Status and issues tab |
| `(#131009) Parameter value is not valid` | The IDs belong to a catalogue **not connected to this WhatsApp account** | Check portfolio / account / catalogue all match |

The second is the one that wastes time. Three correct IDs from the wrong portfolio produce the same error as three wrong IDs.

## Turning it on for customers

WhatsApp Manager → Catalogue. **Both toggles must be on:**
- *Show catalogue icon in chat header* — gives the customer a way in, also on your business profile.
- *Show "Add to basket" button* — gives them a way to act; adds the trolley icon.

## Services are products

Nothing requires physical goods. The trainer's own catalogue lists **Social Media Branding & Scheduling, Task & Team Automation System, Sales Automation Setup, Client Onboarding & Relationship Automation** — each with a price and a link. Directly applicable to the Sahas AI [[service-offerings]] becoming a WhatsApp-sendable list.

## Limitation

**Shops are not available in India.** Meta states it on the Commerce Manager screen. You can still create a catalogue and use it for WhatsApp and for ads — but no Facebook/Instagram storefront. Check before promising a client one.

Related: [[training-lesson-6-catalog-payments]], [[whatsapp-payment-configuration-india]]
