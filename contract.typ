// Jitter B.V. contract template
//
// A short contract between two parties: frame order, supply agreement,
// service agreement. The JSON supplies the title, the parties and the
// numbered clauses; the template only does the layout.
//
// Usage from a contract file:
//   #import "/contract.typ": jitter-contract
//   #jitter-contract(json("supply-agreement.json"))

#import "brand.typ": *

#let _company = json("data/company.json")

#let _labels = (
  en: (no: "No.", date: "Date", reference: "Reference", page: "Page", signed: "Signed for",
       name: "Name", sig-date: "Date", signature: "Signature", reg: "Reg. no.", vat: "VAT"),
  nl: (no: "Nr.", date: "Datum", reference: "Referentie", page: "Pagina", signed: "Ondertekend namens",
       name: "Naam", sig-date: "Datum", signature: "Handtekening", reg: "KvK", vat: "Btw"),
)

// A party marked "jitter": true is filled in from data/company.json
#let _party(p, l) = {
  if p.at("jitter", default: false) {
    (
      role: p.role,
      name: _company.name,
      address: (_company.street, _company.postcode + " " + _company.city, _company.country),
      reg: _company.kvk,
      vat: _company.vat,
      note: p.at("note", default: none),
    )
  } else {
    (
      role: p.role,
      name: p.name,
      address: p.address,
      reg: p.at("reg_no", default: none),
      vat: p.at("vat", default: none),
      note: p.at("note", default: none),
    )
  }
}

#let _party-box(p, l) = block(fill: jitter-light, inset: 10pt, radius: 3pt, width: 100%)[
  #text(size: 8pt, fill: jitter-gray, weight: "bold")[#upper(p.role)] \
  *#p.name* \
  #p.address.join(linebreak()) \
  #let ids = ()
  #if p.reg != none { ids.push(l.reg + ": " + p.reg) }
  #if p.vat != none { ids.push(l.vat + ": " + p.vat) }
  #ids.join(" · ")
  #if p.note != none [ \ #text(size: 8.5pt, fill: jitter-gray)[#p.note]]
]

#let _signature(name, l) = block(width: 100%)[
  #text(size: 8pt, fill: jitter-gray, weight: "bold")[#upper(l.signed + " " + name)]
  #v(6pt)
  #set text(size: 9.5pt)
  #let field = line(length: 100%, stroke: 0.5pt + jitter-gray)
  #grid(
    columns: (auto, 1fr),
    rows: (28pt, 28pt, 80pt),
    column-gutter: 8pt,
    align: bottom,
    [#l.name:], field,
    [#l.sig-date:], field,
    [#l.signature:], field,
  )
]

#let jitter-contract(data) = {
  let l = _labels.at(data.at("language", default: "en"))
  let parties = data.parties.map(p => _party(p, l))

  set document(title: data.title + " " + data.number, author: _company.name)
  set text(
    font: ("Helvetica Neue", "Helvetica", "Arial", "Liberation Sans"),
    size: 10pt,
    fill: jitter-dark,
    lang: data.at("language", default: "en"),
  )
  set par(leading: 0.6em, justify: false)

  set page(
    paper: "a4",
    margin: (top: 2.6cm, bottom: 2.2cm, left: 2.3cm, right: 2.3cm),
    header: {
      set text(size: 8pt, fill: jitter-gray)
      grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        jitter-logo(height: 14pt),
        [#data.title #data.number],
      )
      v(6pt)
      line(length: 100%, stroke: 0.5pt + jitter-rule)
    },
    footer: {
      set text(size: 7.5pt, fill: jitter-gray)
      line(length: 100%, stroke: 0.5pt + jitter-rule)
      v(4pt)
      grid(
        columns: (1fr, auto),
        [#_company.name · #_company.street · #_company.postcode #_company.city · KvK #_company.kvk · VAT #_company.vat],
        context [#l.page #counter(page).display() / #counter(page).final().first()],
      )
    },
  )

  show heading.where(level: 2): it => {
    v(8pt)
    block(text(size: 11pt, weight: "bold", fill: jitter-blue, it.body))
    v(2pt)
  }

  text(size: 20pt, weight: "bold")[#data.title]
  v(2pt)
  {
    let meta = (l.no + " " + data.number, l.date + ": " + data.date)
    if data.at("reference", default: none) != none { meta.push(l.reference + ": " + data.reference) }
    text(fill: jitter-gray, meta.join(h(0.8em) + "·" + h(0.8em)))
  }

  v(10pt)
  grid(columns: (1fr, 1fr), column-gutter: 16pt, ..parties.map(p => _party-box(p, l)))

  // Clauses are numbered per section (4.3), so both sides can refer to them
  for (i, sec) in data.sections.enumerate(start: 1) {
    heading(level: 2)[#i. #sec.title]
    grid(
      columns: (2.2em, 1fr),
      row-gutter: 0.65em,
      ..sec.clauses.enumerate(start: 1).map(((j, c)) => (
        text(fill: jitter-blue, weight: "bold")[#i.#j],
        eval(c, mode: "markup"),
      )).flatten(),
    )
  }

  v(36pt)
  block(breakable: false, grid(
    columns: (1fr, 1fr),
    column-gutter: 28pt,
    ..parties.map(p => _signature(p.name, l)),
  ))
}
