// Standard terms: pricing footnote, payment, start date, validity

#import "../brand.typ": *
#import "i18n.typ": t

#let voorwaarden-section(data) = {
  // Pricing footnote
  v(4pt)
  text(size: 9pt, fill: jitter-gray)[#t(data, "terms-note")]

  // Payment terms (custom per quote)
  if data.at("payment", default: none) != none [

    #data.payment
  ]

  // Start date (custom per quote)
  if data.at("start", default: none) != none [

    #data.start
  ]
}

#let validity-section(data) = {
  let days = data.at("validity_days", default: 30)
  v(8pt)
  text(
    size: 9.5pt,
    style: "italic",
    fill: jitter-gray,
  )[#(t(data, "validity"))(days)]
}
