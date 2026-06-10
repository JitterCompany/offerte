# Jitter Offertes

Typst-based proposal system for Jitter B.V. — an engineering company specializing in electronics, embedded firmware, and software.

## Quick reference

- **New quote**: Create a directory with a `.json` + `.typ` pair. Use `example/` as starting point. Quotes live in their own project directories, not in this repo.
- **Build**: `offerte quote.typ` (globally from any directory) or `./build.sh` (from within the repo).
- **Language**: Proposals are written in Dutch.

## Architecture

- `template.typ` — main template, assembles cover + body + standard ending sections
- `brand.typ` — colors and logo
- `data/company.json` — Jitter company info
- `sections/` — modular section files (cover, pricing, guarantee, over-jitter, voorwaarden)
- `example/` — example quote demonstrating all template features
- `offerte` — global build wrapper (symlink to PATH)

## JSON config drives the ending sections

The JSON `guarantee` field selects the variant: `"poc"`, `"software"`, or `"hardware"`. Use `"custom"` with a `guarantee_text` field (string or array of paragraphs) when none of the standard guarantees fit, for example a design-only assignment with per-phase sign-off where compliance testing is the client's responsibility.
Set `"over_jitter": true` for new clients. Pricing items can be 2-col `["item", "cost"]` or 3-col `["item", "cost", "timeline"]`.

The JSON `language` field (`"nl"` default, or `"en"`) switches all template-generated sections (cover labels, pricing header, guarantee, terms, validity, over-jitter) between Dutch and English. Translations live in `sections/i18n.typ`. The free-form body is written manually in the chosen language. Proposals are Dutch by default; only write English when the client requests it.

## When helping create a new proposal

1. Ask for: client name, project title, project type (poc/software/hardware), and a brief description of the work
2. Generate both the JSON and typ file
3. Compile with `offerte path/to/quote.typ` and verify the output

## Writing guidelines

- Do not use em-dashes `—` anywhere in proposal text, in any language. Note `---` in Typst also renders as an em-dash, so avoid it too. Use a colon, a comma, or a separate sentence instead. The only exception is an official name or quoted document title that genuinely contains one.
- Minimise the "AI-generated" vibe. Avoid the formulaic `*Bold label* --- description` bullet pattern in prose sections such as "Assumptions and required input" or "Out of scope"; write natural prose bullets or short sentences instead. A bold-label-then-colon list is fine for a dense requirements summary, but keep narrative sections human.
