// Cover page section

#import "../brand.typ": *

#let cover-page(data, company) = {
  page(
    paper: "a4",
    margin: (x: 2.5cm, top: 3cm, bottom: 1.5cm),
    header: none,
    footer: none,
    background: place(top + left)[
      #rect(width: 100%, height: 6pt, fill: jitter-blue, stroke: none)
    ],
  )[
    #jitter-logo(height: 32pt)

    #v(1fr)

    #text(size: 28pt, weight: "bold", fill: jitter-dark, tracking: -0.5pt)[#data.title.split("\n").map(part => [#part]).join(linebreak())]

    #if data.at("subtitle", default: none) != none [
      #v(6pt)
      #text(size: 13pt, fill: jitter-gray)[#data.subtitle]
    ]

    #if data.at("number", default: none) != none [
      #v(8pt)
      #text(size: 10.5pt, fill: jitter-gray)[\[#data.number\]]
    ]

    #v(28pt)
    #line(length: 4cm, stroke: 2pt + jitter-blue)
    #v(24pt)

    // Metadata table
    #set text(size: 10.5pt)
    #{
      let meta = ()
      if data.at("client", default: none) != none {
        meta.push([*Aan*])
        let client = data.client
        let parts = ()
        if client.at("contact", default: none) != none {
          parts.push(client.contact)
        }
        if client.at("company", default: none) != none {
          parts.push(client.company)
        }
        meta.push(parts.join(linebreak()))
      }
      meta.push([*Van*])
      meta.push(company.name)
      meta.push([*Datum*])
      meta.push(data.date)
      if data.at("version", default: none) != none {
        meta.push([*Versie*])
        meta.push(data.version)
      }
      grid(
        columns: (4.5cm, auto),
        row-gutter: 10pt,
        ..meta,
      )
    }

    #v(1fr)

    // Company contact
    #set text(size: 8pt, fill: jitter-gray)
    #company.street · #company.postcode #company.city · #company.country \
    #company.phone · #company.email · #link("https://" + company.web)[#company.web] \
    KvK #company.kvk · BTW #company.vat

    // Reset page counter so first body page = 1
    #counter(page).update(0)
  ]
}
