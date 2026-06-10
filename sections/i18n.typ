// Centralised translations for template-generated text.
//
// The per-quote free-form body is authored manually and is not translated here.
// Add a "language" field to the quote JSON to select a variant; defaults to "nl".

#import "../brand.typ": *

// Selected language for a quote. Unknown values fall back to "nl".
#let quote-lang(data) = {
  let l = data.at("language", default: "nl")
  if l == "en" { "en" } else { "nl" }
}

#let strings = (
  nl: (
    cover-to: [Aan],
    cover-from: [Van],
    cover-date: [Datum],
    cover-version: [Versie],
    vat-label: [BTW],

    pricing-heading: [Kosten en planning],
    pricing-col-item: [Onderdeel],
    pricing-col-cost: [Kosten],
    pricing-col-lead: [Doorlooptijd],

    guarantee-heading: [Ontwikkelgarantie],
    months: n => if n == 1 [1 maand] else [#n maanden],
    guarantee-body: (kind, period) => {
      if kind == "poc" [
        Jitter garandeert dat het Proof of Concept bruikbare resultaten
        oplevert waarmee gefundeerde beslissingen genomen kunnen worden
        over het vervolgtraject.
      ] else if kind == "hardware" [
        Jitter garandeert een goed werkend ontwerp op te leveren. We gaan
        door tot alles naar behoren werkt. Na de oplevering bieden wij een
        bug-vrij garantie van *#period*, inclusief eventuele benodigde
        hardware-revisies voor bugs in door ons ontworpen elektronica.
      ] else if kind == "general" [
        Jitter hanteert de volgende garanties, afhankelijk van het type
        werkzaamheden:

        - *Vooronderzoek* --- Jitter garandeert dat het onderzoek bruikbare
          resultaten oplevert waarmee gefundeerde beslissingen genomen
          kunnen worden over het vervolgtraject.
        - *Hardware-ontwerp* --- Jitter garandeert een goed werkend ontwerp
          op te leveren. We gaan door tot alles naar behoren werkt. Na de
          oplevering bieden wij een bug-vrij garantie van *#period*,
          inclusief eventuele benodigde hardware-revisies voor bugs in door
          ons ontworpen elektronica.
        - *Software/firmware* --- Jitter garandeert een goed werkend
          resultaat op te leveren. Na de oplevering bieden wij een bug-vrij
          garantie van *#period* waarin eventuele gebreken in door ons
          geleverd werk kosteloos worden verholpen.
      ] else [
        Jitter garandeert een goed werkend resultaat op te leveren. Na de
        oplevering bieden wij een bug-vrij garantie van *#period* waarin
        eventuele gebreken in door ons geleverd werk kosteloos worden
        verholpen.
      ]
    },

    terms-note: [
      Bedragen zijn exclusief BTW en exclusief eventuele materiaalkosten.
      Op deze aanbieding zijn onze #link("https://jitter.nl/assets/doc/Leveringsvoorwaarden%20Jitter%20BV.pdf")[algemene voorwaarden] van toepassing.
    ],
    validity: days => [Deze aanbieding is geldig tot #days dagen na de datum op dit document.],

    over-jitter-heading: [Over Jitter],
    over-jitter-body: [
      Jitter B.V. is een ingenieursbureau in Delft, gespecialiseerd in
      elektronica, embedded firmware en software. Wij zijn de technische
      partner voor bedrijven die slimme hardware ontwikkelen.

      Ons team van vier engineers ontwerpt en bouwt complete systemen:
      van PCB-ontwerp en embedded Rust firmware tot cloud-backends en
      dashboards. Met ruim 10 jaar ervaring in productontwikkeling werken
      wij als verlengstuk van uw team.

      Daarnaast beschikt Jitter over een eigen
      #link("https://jitter.nl/platform/")[platform] van beproefde
      bouwblokken: herbruikbare hardware-modules, firmware-componenten en
      software-libraries. Door deze in te zetten waar mogelijk besparen we
      ontwikkeltijd en verhogen we de betrouwbaarheid van het eindresultaat.

      - *Directe toegang tot engineers* --- geen lagen van projectmanagers.
      - *Hardware en firmware onder één dak* --- geïntegreerd ontworpen.
      - *Langdurige partnerships* --- veel van onze klantrelaties zijn
        uitgegroeid tot jarenlange samenwerkingen.
    ],
    over-jitter-more: [Meer informatie:],
  ),

  en: (
    cover-to: [To],
    cover-from: [From],
    cover-date: [Date],
    cover-version: [Version],
    vat-label: [VAT],

    pricing-heading: [Costs and planning],
    pricing-col-item: [Item],
    pricing-col-cost: [Cost],
    pricing-col-lead: [Lead time],

    guarantee-heading: [Development guarantee],
    months: n => if n == 1 [1 month] else [#n months],
    guarantee-body: (kind, period) => {
      if kind == "poc" [
        Jitter guarantees that the Proof of Concept delivers usable results
        that allow well-founded decisions to be made about the follow-up
        trajectory.
      ] else if kind == "hardware" [
        Jitter guarantees the delivery of a properly working design. We
        continue until everything works as intended. After delivery we
        provide a bug-free guarantee of *#period*, including any necessary
        hardware revisions for bugs in electronics designed by us.
      ] else if kind == "general" [
        Jitter applies the following guarantees, depending on the type of
        work:

        - *Preliminary research* --- Jitter guarantees that the research
          delivers usable results that allow well-founded decisions to be
          made about the follow-up trajectory.
        - *Hardware design* --- Jitter guarantees the delivery of a properly
          working design. We continue until everything works as intended.
          After delivery we provide a bug-free guarantee of *#period*,
          including any necessary hardware revisions for bugs in electronics
          designed by us.
        - *Software/firmware* --- Jitter guarantees the delivery of a
          properly working result. After delivery we provide a bug-free
          guarantee of *#period* during which any defects in work delivered
          by us are resolved free of charge.
      ] else [
        Jitter guarantees the delivery of a properly working result. After
        delivery we provide a bug-free guarantee of *#period* during which
        any defects in work delivered by us are resolved free of charge.
      ]
    },

    terms-note: [
      Amounts exclude VAT and any material costs.
      Our #link("https://jitter.nl/assets/doc/Leveringsvoorwaarden%20Jitter%20BV.pdf")[general terms and conditions] apply to this offer.
    ],
    validity: days => [This offer is valid for #days days from the date on this document.],

    over-jitter-heading: [About Jitter],
    over-jitter-body: [
      Jitter B.V. is an engineering firm in Delft, specialised in
      electronics, embedded firmware and software. We are the technical
      partner for companies developing smart hardware.

      Our team of four engineers designs and builds complete systems:
      from PCB design and embedded Rust firmware to cloud backends and
      dashboards. With over 10 years of experience in product development,
      we work as an extension of your team.

      Jitter also has its own
      #link("https://jitter.nl/platform/")[platform] of proven building
      blocks: reusable hardware modules, firmware components and software
      libraries. By applying these wherever possible, we save development
      time and increase the reliability of the end result.

      - *Direct access to engineers* --- no layers of project managers.
      - *Hardware and firmware under one roof* --- designed in an integrated way.
      - *Long-term partnerships* --- many of our client relationships have
        grown into years-long collaborations.
    ],
    over-jitter-more: [More information:],
  ),
)

// Look up a translated string for the quote's language.
#let t(data, key) = strings.at(quote-lang(data)).at(key)
