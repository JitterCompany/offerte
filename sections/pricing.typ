// Pricing table section

#import "../brand.typ": *
#import "i18n.typ": t

#let _render-table(data, items) = {
  let ncols = items.first().len()
  if ncols >= 3 {
    table(
      columns: (1fr, auto, auto),
      align: (left, right, left),
      fill: (_, row) => if row == 0 { jitter-light },
      table.header(
        strong(t(data, "pricing-col-item")),
        strong(t(data, "pricing-col-cost")),
        strong(t(data, "pricing-col-lead")),
      ),
      ..items.map(row => (row.at(0), row.at(1), row.at(2))).flatten(),
    )
  } else {
    table(
      columns: (1fr, auto),
      align: (left, right),
      fill: (_, row) => if row == 0 { jitter-light },
      table.header(
        strong(t(data, "pricing-col-item")),
        strong(t(data, "pricing-col-cost")),
      ),
      ..items.map(row => (row.at(0), row.at(1))).flatten(),
    )
  }
}

#let pricing-section(data) = {
  heading(level: 1)[#t(data, "pricing-heading")]

  // Grouped pricing: sections with title + items
  if data.pricing.at("sections", default: none) != none {
    for section in data.pricing.sections {
      if section.at("pagebreak_before", default: false) {
        pagebreak()
      }
      heading(level: 2)[#section.title]
      _render-table(data, section.items)
      if section.at("subtotal", default: none) != none {
        v(4pt)
        align(right, text(weight: "bold", size: 10.5pt)[#section.subtotal])
      }
    }
  // Flat pricing: single list of items (backward compatible)
  } else {
    _render-table(data, data.pricing.items)
  }

  if data.pricing.at("note", default: none) != none {
    v(4pt)
    text(size: 9pt, style: "italic", fill: jitter-gray)[#data.pricing.note]
  }
}
