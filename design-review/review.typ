// Standard PCB design review quote. The quote JSON only holds the client,
// the product and their focus points; this file supplies body and terms.
//
// Usage from a quote file:
//   #import "/design-review/review.typ": design-review-offerte
//   #show: design-review-offerte.with(json("OF26-343-1.json"))

#import "/template.typ": jitter-offerte

#let _iban = "NL51SNSB0923493948"

#let _text = (
  en: (
    title: product => "Design review " + product,
    subtitle: "Independent review of schematic and PCB layout before production",
    item: "PCB design review: schematic and PCB layout",
    lead: lead => lead + " after payment",
    note: "Fixed price.",
    payment: [Payment in full in advance. After your acceptance we send an invoice. Please pay by bank transfer to Jitter B.V., IBAN #_iban, quoting the invoice number. We start the review once the payment has been received.],
    guarantee-heading: "Guarantee",
    guarantee: "No remarks, money back. If our review report contains no remarks at all, you get the full amount back.",
    body: (product, focus) => [
      = Proposal

      We propose our standard
      #link("https://jitter.nl/en/services/design-review/")[PCB design review]
      of the schematic and PCB layout of the #product.

      == Scope

      - Schematic and component choice, including availability.
      - PCB layout, power integrity and signal integrity.
      - Reliability: thermal behaviour, derating and ESD protection.
      - Architecture and manufacturability.

      #if focus.len() > 0 [
        As you asked, we pay particular attention to:
        #list(..focus.map(f => [#f]))
      ]

      You receive a PDF report: what is good, what can be improved and why,
      with a severity and a recommended fix per finding. A call to go through the report is included.

      The offer covers one review round on the files you send us. If you
      change the design after the review, a second review is a new
      assignment. Measurements on hardware and formal compliance statements
      are not included. Implementation of fixes is quoted separately if you
      want us to do it.

      == Confidentiality

      We treat your design files as confidential. We use them only for this
      review, only the Jitter engineers working on it have access, and we do
      not share them with third parties or copy or reuse your design. On
      request we delete the files after the review.

      This applies to all files you send us for the review, also before you
      accept this offer, and lasts three years after the review. It does not
      cover information that is public, that we already had, or that we
      develop independently, nor general know-how. It does not restrict us from working for other
      companies, also in the same field.
    ],
  ),
  nl: (
    title: product => "Design review " + product,
    subtitle: "Onafhankelijke review van schema en PCB-layout voor productie",
    item: "PCB design review: schema en PCB-layout",
    lead: lead => lead + " na betaling",
    note: "Vaste prijs.",
    payment: [U betaalt vooraf. Na uw akkoord sturen we een factuur. U betaalt per bankoverschrijving aan Jitter B.V., IBAN #_iban, onder vermelding van het factuurnummer. We starten de review zodra de betaling binnen is.],
    guarantee-heading: "Garantie",
    guarantee: "Geen opmerkingen, geld terug. Bevat ons reviewrapport geen enkele opmerking, dan krijgt u het volledige bedrag terug.",
    body: (product, focus) => [
      = Voorstel

      We stellen onze standaard
      #link("https://jitter.nl/aanbod/design-review/")[PCB design review]
      voor van het schema en de PCB-layout van de #product.

      == Scope

      - Schema en componentkeuze, inclusief beschikbaarheid.
      - PCB-layout, power integrity en signal integrity.
      - Betrouwbaarheid: warmte, derating en ESD-bescherming.
      - Architectuur en produceerbaarheid.

      #if focus.len() > 0 [
        Op uw verzoek letten we extra op:
        #list(..focus.map(f => [#f]))
      ]

      U ontvangt een PDF-rapport: wat goed is, wat beter kan en waarom, met
      per bevinding de ernst en een advies voor de oplossing. Een gesprek om het rapport door te nemen
      is inbegrepen.

      De aanbieding omvat één reviewronde op de bestanden die u ons stuurt.
      Past u het ontwerp na de review aan, dan is een tweede review een
      nieuwe opdracht. Metingen aan hardware en formele verklaringen van
      conformiteit vallen erbuiten. Het doorvoeren van verbeteringen
      offreren we apart als u dat wilt.

      == Vertrouwelijkheid

      We behandelen uw ontwerpbestanden als vertrouwelijk. We gebruiken ze
      alleen voor deze review, alleen de Jitter-engineers die eraan werken
      hebben toegang, en we delen ze niet met derden en kopiëren of
      hergebruiken uw ontwerp niet. Op verzoek verwijderen we de bestanden na
      de review.

      Dit geldt voor alle bestanden die u ons voor de review stuurt, ook
      voordat u deze aanbieding accepteert, en tot drie jaar na de review.
      Het geldt niet voor informatie die openbaar is, die we al hadden of die
      we zelf ontwikkelen, en niet voor algemene kennis. Het beperkt ons niet in
      werk voor andere bedrijven, ook niet in dezelfde branche.
    ],
  ),
)

#let design-review-offerte(data, body) = {
  let lang = if data.at("language", default: "nl") == "en" { "en" } else { "nl" }
  let s = _text.at(lang)
  let product = data.product
  let lead = data.at("lead_time", default: if lang == "en" { "5 working days" } else { "5 werkdagen" })
  let full = (
    title: (s.title)(product),
    subtitle: s.subtitle,
    pricing: (
      items: ((s.item, data.at("price", default: "€ 599"), (s.lead)(lead)),),
      note: s.note,
    ),
    payment: s.payment,
    guarantee: "custom",
    guarantee_heading: s.guarantee-heading,
    guarantee_text: s.guarantee,
    validity_days: 14,
    over_jitter: true,
  ) + data
  show: jitter-offerte.with(full)
  (s.body)(product, data.at("focus", default: ()))
  body
}
