---
title: Read Word (.docx) text in n8n without zlib
created: 2026-10-10
tags: [n8n, how-to, docx]
source: Claude Code build session 2026-10-09/10 (Resume Screener n8n workflow, live MCP read-back + smoke tests)
origin: ai
author: claude-code
maturity: supported
---

# Read Word (.docx) text in n8n without zlib

n8n has no "Extract from Word" and the Code node sandbox blocks `require('zlib')`. A .docx is a ZIP of XML files; the text is in `word/document.xml`. Working pattern (tested 2026-10-10 on n8n 2.39):

1. **Code — Prepare as ZIP:** relabel only — set `binary.data.fileExtension = 'zip'`, `mimeType = 'application/zip'`, file name `.zip`. Compression → Decompress checks the extension, not the bytes ("Unsupported archive format .docx" otherwise).
2. **Compression → Decompress** (input field `data`, prefix `file_`): one item with file_0, file_1… each with File Name + Directory.
3. **Code — Extract Word Text:** find the binary whose fileName ends with `document.xml`, read it with `await this.helpers.getBinaryDataBuffer(i, key)`, then strip tags: `<w:tab/>` → space, `<w:br/>` and `</w:p>` → newline, remove `<[^>]+>`, decode `&lt; &gt; &quot; &apos; &amp;`, collapse blank lines. Return `{ json: { text }, pairedItem: { item: i } }`.

Output matches Extract from File → PDF (`text` field), so PDF and Word share the same downstream AI steps. Full code: `Resume-Screener-Node-Prompts-and-Code.docx` sections P3–P4 (local, Resume Screener AI folder).

Related: [[n8n-lessons-resume-screener]], [[resume-screener-ai]].
