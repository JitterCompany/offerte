// Standard terms: pricing footnote, payment, start date, validity

#import "../brand.typ": *

#let voorwaarden-section(data) = {
  let en = data.at("language", default: "nl") == "en"

  // Pricing footnote
  v(4pt)
  text(size: 9pt, fill: jitter-gray)[
    #if en [
      Amounts are exclusive of VAT and exclusive of any material costs.
      Our #link("https://jitter.nl/assets/doc/Leveringsvoorwaarden%20Jitter%20BV.pdf")[general terms and conditions] apply to this proposal.
    ] else [
      Bedragen zijn exclusief BTW en exclusief eventuele materiaalkosten.
      Op deze aanbieding zijn onze #link("https://jitter.nl/assets/doc/Leveringsvoorwaarden%20Jitter%20BV.pdf")[algemene voorwaarden] van toepassing.
    ]
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
  let en = data.at("language", default: "nl") == "en"
  let days = data.at("validity_days", default: 30)
  v(8pt)
  text(
    size: 9.5pt,
    style: "italic",
    fill: jitter-gray,
  )[#if en [This proposal is valid until #days days after the date on this document.] else [Deze aanbieding is geldig tot #days dagen na de datum op dit document.]]
}
