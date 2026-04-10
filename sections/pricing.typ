// Pricing table section

#import "../brand.typ": *

#let pricing-section(data) = {
  heading(level: 1)[Kosten en planning]

  let items = data.pricing.items
  let ncols = items.first().len()

  if ncols >= 3 {
    table(
      columns: (1fr, auto, auto),
      align: (left, right, left),
      fill: (_, row) => if row == 0 { jitter-light },
      table.header([*Onderdeel*], [*Kosten*], [*Doorlooptijd*]),
      ..items.map(row => (row.at(0), row.at(1), row.at(2))).flatten(),
    )
  } else {
    table(
      columns: (1fr, auto),
      align: (left, right),
      fill: (_, row) => if row == 0 { jitter-light },
      table.header([*Onderdeel*], [*Kosten*]),
      ..items.map(row => (row.at(0), row.at(1))).flatten(),
    )
  }

  if data.pricing.at("note", default: none) != none {
    v(4pt)
    text(size: 9pt, style: "italic", fill: jitter-gray)[#data.pricing.note]
  }
}
