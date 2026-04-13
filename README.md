# Jitter Offertes

Typst-based proposal system for Jitter B.V.

## Requirements

- [Typst](https://typst.app/) — `brew install typst`

## Structure

```
assets/                    # Logos (SVG)
brand.typ                  # Brand colors + logo helper
data/
  company.json             # Jitter company info
sections/
  cover.typ                # Cover page layout
  pricing.typ              # Pricing table
  guarantee.typ            # Guarantee (poc / software / hardware)
  over-jitter.typ          # About section (for new clients)
  voorwaarden.typ          # Standard terms + validity
quotes/
  XXXX-XXX.json            # Quote metadata + pricing data
  XXXX-XXX.typ             # Free-form proposal content
output/                    # Generated PDFs
template.typ               # Wires sections together
build.sh                   # Build script
```

## Creating a new proposal

1. Copy an existing JSON + typ pair in `quotes/`
2. Edit the **JSON** for metadata, client, pricing, and config
3. Write the proposal content in the **typ** file

The standard ending sections (pricing table, voorwaarden, guarantee, validity, over-jitter) are assembled automatically based on the JSON.

### JSON fields

| Field | Required | Description |
|---|---|---|
| `number` | yes | Reference number, e.g. `"2604-001"` |
| `date` | yes | Date string, e.g. `"10 april 2026"` |
| `title` | yes | Proposal title |
| `subtitle` | no | Subtitle shown below title on cover |
| `version` | no | Version string, e.g. `"1.0"` |
| `client.company` | no | Client company name |
| `client.contact` | no | Client contact person |
| `pricing.items` | no | Array of `["description", "cost"]` or `["description", "cost", "timeline"]` |
| `pricing.note` | no | Footnote below pricing table |
| `payment` | no | Payment terms text |
| `start` | no | Start date text |
| `guarantee` | no | `"poc"`, `"software"`, or `"hardware"` (default: `"software"`) |
| `guarantee_months` | no | Bug-free guarantee period (default: 3, ignored for poc) |
| `validity_days` | no | Offer validity in days (default: 30) |
| `over_jitter` | no | Include "Over Jitter" section (default: false) |

### Typ file

Standard Typst markup. Start with:

```typst
#import "/template.typ": jitter-offerte
#show: jitter-offerte.with(json("XXXX-XXX.json"))

= Aanleiding
...
```

Everything after the `#show` rule is the free-form proposal body. The pricing, guarantee, terms, and over-jitter sections are appended automatically.

## Installation

To use `offerte` from any directory, symlink it to a directory in your `PATH`:

```bash
ln -s "$(pwd)/offerte" ~/.local/bin/offerte
```

Make sure `~/.local/bin` is in your `PATH`. Alternatively, set `OFFERTE_TEMPLATE_DIR` to point to this repository if the symlink doesn't resolve correctly.

## Building

```bash
# Build all quotes in the current directory
offerte

# Build a single quote (output PDF appears next to the .typ file)
offerte quotes/2604-001-tarka-systems/2604-001.typ

# Build with custom output path
offerte -o output/my-quote.pdf quotes/2604-001-tarka-systems/2604-001.typ
```

Quotes can live anywhere on disk — they don't need to be inside this repository.

## How `offerte` works

Typst requires all source files to be under its `--root` directory. When a quote lives outside this repository, `offerte` creates a temporary build root containing symlinks to the template files and a copy of the quote directory, then compiles against that. For quotes already inside the repo, it compiles directly with `--root` pointing at the repo.
