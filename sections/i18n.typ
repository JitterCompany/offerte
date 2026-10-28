// Translations for all template-generated text.
//
// The free-form body of a quote is written by hand in its own language and
// is not translated here. The quote's JSON selects the language with
// "language": "nl" (default) or "en".

// Unknown values fall back to Dutch
#let quote-lang(data) = {
  let l = data.at("language", default: "nl")
  if l == "en" { "en" } else { "nl" }
}

#let strings = (
  nl: (
    doctype: "Offerte",
    cover-to: [Aan],
    cover-from: [Van],
    cover-date: [Datum],
    cover-version: [Versie],
    vat-label: [BTW],

    pricing-heading: [Kosten en planning],
    pricing-col-item: [Onderdeel],
    pricing-col-cost: [Kosten],
    pricing-col-lead: [Doorlooptijd],

    terms-note: [
      Bedragen zijn exclusief BTW en exclusief eventuele materiaalkosten.
      Op deze aanbieding zijn onze #link("https://jitter.nl/assets/doc/Leveringsvoorwaarden%20Jitter%20BV.pdf")[algemene voorwaarden] van toepassing.
    ],
    validity: days => [Deze aanbieding is geldig tot #days dagen na de datum op dit document.],

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
    doctype: "Proposal",
    cover-to: [To],
    cover-from: [From],
    cover-date: [Date],
    cover-version: [Version],
    vat-label: [VAT],

    pricing-heading: [Pricing and planning],
    pricing-col-item: [Item],
    pricing-col-cost: [Cost],
    pricing-col-lead: [Lead time],

    terms-note: [
      Amounts are exclusive of VAT and exclusive of any material costs.
      Our #link("https://jitter.nl/assets/doc/Leveringsvoorwaarden%20Jitter%20BV.pdf")[general terms and conditions] apply to this proposal.
    ],
    validity: days => [This proposal is valid until #days days after the date on this document.],

    guarantee-heading: [Development guarantee],
    months: n => if n == 1 [1 month] else [#n months],
    guarantee-body: (kind, period) => {
      if kind == "poc" [
        Jitter guarantees that the Proof of Concept delivers usable results
        on which well-founded decisions can be made about the next phase.
      ] else if kind == "hardware" [
        Jitter guarantees delivery of a properly working design. We keep
        going until everything works as intended. After delivery we offer a
        bug-free guarantee of *#period*, including any hardware revisions
        required for bugs in electronics designed by us.
      ] else if kind == "general" [
        Jitter applies the following guarantees, depending on the type of
        work:

        - *Preliminary research* --- Jitter guarantees that the research
          delivers usable results on which well-founded decisions can be
          made about the next phase.
        - *Hardware design* --- Jitter guarantees delivery of a properly
          working design. We keep going until everything works as intended.
          After delivery we offer a bug-free guarantee of *#period*,
          including any hardware revisions required for bugs in electronics
          designed by us.
        - *Software/firmware* --- Jitter guarantees delivery of a properly
          working result. After delivery we offer a bug-free guarantee of
          *#period* in which any defects in work delivered by us are fixed
          free of charge.
      ] else [
        Jitter guarantees delivery of a properly working result. After
        delivery we offer a bug-free guarantee of *#period* in which any
        defects in work delivered by us are fixed free of charge.
      ]
    },

    over-jitter-heading: [About Jitter],
    over-jitter-body: [
      Jitter B.V. is an engineering firm in Delft, the Netherlands,
      specialized in electronics, embedded firmware and software. We are
      the technical partner for companies developing smart hardware.

      Our team of four engineers designs and builds complete systems: from
      PCB design and embedded Rust firmware to cloud backends and
      dashboards. With over 10 years of experience in product development
      we work as an extension of your team.

      Jitter also maintains its own
      #link("https://jitter.nl/platform/")[platform] of proven building
      blocks: reusable hardware modules, firmware components and software
      libraries. By using these where possible we save development time
      and increase the reliability of the end result.

      - *Direct access to engineers* --- no layers of project managers.
      - *Hardware and firmware under one roof* --- designed as an
        integrated whole.
      - *Long-term partnerships* --- many of our client relationships have
        grown into collaborations spanning many years.
    ],
    over-jitter-more: [More information:],
  ),
)

// A translated string or function for the quote's language
#let t(data, key) = strings.at(quote-lang(data)).at(key)
