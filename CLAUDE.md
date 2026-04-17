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

The JSON `guarantee` field selects the variant: `"poc"`, `"software"`, or `"hardware"`.
Set `"over_jitter": true` for new clients. Pricing items can be 2-col `["item", "cost"]` or 3-col `["item", "cost", "timeline"]`.

## When helping create a new proposal

1. Ask for: client name, project title, project type (poc/software/hardware), and a brief description of the work
2. Generate both the JSON and typ file
3. Compile with `offerte path/to/quote.typ` and verify the output

## Writing guidelines

- Do not use em-dashes `—` in Dutch sentences. Only exception is as separator in a list.