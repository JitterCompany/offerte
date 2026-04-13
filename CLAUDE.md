# Jitter Offertes

Typst-based proposal system for Jitter B.V. — an engineering company specializing in electronics, embedded firmware, and software.

## Quick reference

- **New quote**: Create a `quotes/XXXX-XXX/` directory with a `.json` + `.typ` pair. Use an existing quote as starting point. Quote-specific assets (images, spreadsheets) live in the same directory.
- **Build**: `./build.sh` (all) or `./build.sh quotes/XXXX-XXX/XXXX-XXX.typ` (single). The `offerte` wrapper can be used globally from any directory.
- **Language**: Proposals are written in Dutch.

## Architecture

- `template.typ` — main template, assembles cover + body + standard ending sections
- `brand.typ` — colors and logo
- `data/company.json` — Jitter company info
- `sections/` — modular section files (cover, pricing, guarantee, over-jitter, voorwaarden)
- `quotes/XXXX-XXX/` — per-proposal directory with JSON, typ, and assets

## JSON config drives the ending sections

The JSON `guarantee` field selects the variant: `"poc"`, `"software"`, or `"hardware"`.
Set `"over_jitter": true` for new clients. Pricing items can be 2-col `["item", "cost"]` or 3-col `["item", "cost", "timeline"]`.

## When helping create a new proposal

1. Ask for: client name, project title, project type (poc/software/hardware), and a brief description of the work
2. Generate both the JSON and typ file
3. Compile with `./offerte quotes/XXXX-XXX/XXXX-XXX.typ` and verify the output
