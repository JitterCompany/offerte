// Jitter B.V. — Offerte Template
//
// Usage from a quote file:
//   #import "../template.typ": jitter-offerte
//   #show: jitter-offerte.with(json("2604-001.json"))

#import "brand.typ": *
#import "sections/cover.typ": cover-page
#import "sections/pricing.typ": pricing-section
#import "sections/guarantee.typ": guarantee-section
#import "sections/over-jitter.typ": over-jitter-section
#import "sections/voorwaarden.typ": voorwaarden-section, validity-section

#let _company = json("data/company.json")

#let jitter-offerte(data, body) = {
  set document(title: data.title, author: (_company.name,))

  // ── Base typography ──

  set text(
    font: ("Helvetica Neue", "Helvetica", "Arial"),
    size: 10.5pt,
    fill: jitter-dark,
    lang: "nl",
  )
  set par(leading: 0.65em, justify: true)

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(16pt)
    block(text(size: 15pt, weight: "bold", fill: jitter-blue, it.body))
    v(6pt)
  }
  show heading.where(level: 2): it => {
    v(12pt)
    block(text(size: 12pt, weight: "bold", fill: jitter-dark, it.body))
    v(4pt)
  }
  show heading.where(level: 3): it => {
    v(8pt)
    block(text(size: 10.5pt, weight: "semibold", fill: jitter-gray, it.body))
    v(2pt)
  }

  set list(indent: 0.8em, marker: text(fill: jitter-blue, weight: "bold")[--])
  set enum(indent: 0.8em)
  show link: it => text(fill: jitter-blue, it)
  set table(stroke: 0.5pt + jitter-rule, inset: 8pt)

  // ── Cover page ──

  cover-page(data, _company)

  // ── Body pages ──

  set page(
    paper: "a4",
    margin: (top: 2.8cm, bottom: 2.2cm, left: 2.5cm, right: 2.5cm),
    header: {
      set text(size: 8pt, fill: jitter-gray)
      grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        jitter-logo(height: 14pt),
        box(
          fill: jitter-blue,
          radius: 2pt,
          inset: (x: 6pt, y: 3pt),
        )[#text(fill: white, weight: "bold", size: 8pt)[
          #context counter(page).display()
        ]],
      )
      v(6pt)
      line(length: 100%, stroke: 0.5pt + jitter-rule)
    },
    footer-descent: 8pt,
    footer: {
      line(length: 100%, stroke: 0.5pt + jitter-rule)
      v(6pt)
      set text(size: 7.5pt, fill: jitter-gray)
      grid(
        columns: (1fr, auto),
        [#_company.name · KvK #_company.kvk · BTW #_company.vat],
        data.date,
      )
    },
  )

  // ── Free-form proposal content ──

  body

  // ── Standard ending sections (driven by JSON) ──

  if data.at("pricing", default: none) != none {
    pricing-section(data)
  }

  voorwaarden-section(data)

  validity-section(data)

  guarantee-section(data)

  if data.at("over_jitter", default: false) {
    over-jitter-section(_company)
  }
}
