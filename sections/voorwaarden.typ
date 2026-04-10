// Standard terms: pricing footnote, payment, start date, validity

#import "../brand.typ": *

#let voorwaarden-section(data) = {
  // Pricing footnote
  v(4pt)
  text(size: 9pt, fill: jitter-gray)[
    Bedragen zijn exclusief BTW en exclusief eventuele materiaalkosten.
    Op deze aanbieding zijn onze algemene voorwaarden van toepassing.
  ]

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
  )[Deze aanbieding is geldig tot #days dagen na de datum op dit document.]
}
