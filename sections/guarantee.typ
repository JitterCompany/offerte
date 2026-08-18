// Guarantee section — variant driven by data.guarantee field

#let guarantee-section(data) = {
  let en = data.at("language", default: "nl") == "en"

  heading(level: 2)[#if en [Development guarantee] else [Ontwikkelgarantie]]

  let kind = data.at("guarantee", default: "software")
  let months = data.at("guarantee_months", default: 3)
  let period = if en {
    if months == 1 [1 month] else [#months months]
  } else {
    if months == 1 [1 maand] else [#months maanden]
  }

  if kind == "poc" [
    #if en [
      Jitter guarantees that the Proof of Concept delivers usable results
      on which well-founded decisions can be made about the next phase.
    ] else [
      Jitter garandeert dat het Proof of Concept bruikbare resultaten
      oplevert waarmee gefundeerde beslissingen genomen kunnen worden
      over het vervolgtraject.
    ]
  ] else if kind == "hardware" [
    #if en [
      Jitter guarantees delivery of a properly working design. We keep
      going until everything works as intended. After delivery we offer a
      bug-free guarantee of *#period*, including any hardware revisions
      required for bugs in electronics designed by us.
    ] else [
      Jitter garandeert een goed werkend ontwerp op te leveren. We gaan
      door tot alles naar behoren werkt. Na de oplevering bieden wij een
      bug-vrij garantie van *#period*, inclusief eventuele benodigde
      hardware-revisies voor bugs in door ons ontworpen elektronica.
    ]
  ] else if kind == "general" [
    #if en [
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
    ]
  ] else [
    #if en [
      Jitter guarantees delivery of a properly working result. After
      delivery we offer a bug-free guarantee of *#period* in which any
      defects in work delivered by us are fixed free of charge.
    ] else [
      Jitter garandeert een goed werkend resultaat op te leveren. Na de
      oplevering bieden wij een bug-vrij garantie van *#period* waarin
      eventuele gebreken in door ons geleverd werk kosteloos worden
      verholpen.
    ]
  ]
}
