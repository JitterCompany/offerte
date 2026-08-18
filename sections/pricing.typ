// Pricing table section

#import "../brand.typ": *

#let _render-table(items, en: false) = {
  let ncols = items.first().len()
  let headers = if en {
    ([*Item*], [*Cost*], [*Lead time*])
  } else {
    ([*Onderdeel*], [*Kosten*], [*Doorlooptijd*])
  }
  if ncols >= 3 {
    table(
      columns: (1fr, auto, auto),
      align: (left, right, left),
      fill: (_, row) => if row == 0 { jitter-light },
      table.header(..headers),
      ..items.map(row => (row.at(0), row.at(1), row.at(2))).flatten(),
    )
  } else {
    table(
      columns: (1fr, auto),
      align: (left, right),
      fill: (_, row) => if row == 0 { jitter-light },
      table.header(..headers.slice(0, 2)),
      ..items.map(row => (row.at(0), row.at(1))).flatten(),
    )
  }
}

#let pricing-section(data) = {
  if data.at("language", default: "nl") == "en" {
    heading(level: 1)[Pricing and planning]
  } else {
    heading(level: 1)[Kosten en planning]
  }

  // Grouped pricing: sections with title + items
  if data.pricing.at("sections", default: none) != none {
    for section in data.pricing.sections {
      if section.at("pagebreak_before", default: false) {
        pagebreak()
      }
      heading(level: 2)[#section.title]
      _render-table(section.items, en: data.at("language", default: "nl") == "en")
      if section.at("subtotal", default: none) != none {
        v(4pt)
        align(right, text(weight: "bold", size: 10.5pt)[#section.subtotal])
      }
    }
  // Flat pricing: single list of items (backward compatible)
  } else {
    _render-table(data.pricing.items, en: data.at("language", default: "nl") == "en")
  }

  if data.pricing.at("note", default: none) != none {
    v(4pt)
    text(size: 9pt, style: "italic", fill: jitter-gray)[#data.pricing.note]
  }
}
