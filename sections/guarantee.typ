// Guarantee section — variant driven by data.guarantee field

#let guarantee-section(data) = {
  heading(level: 2)[Ontwikkelgarantie]

  let kind = data.at("guarantee", default: "software")
  let months = data.at("guarantee_months", default: 3)
  let period = if months == 1 [1 maand] else [#months maanden]

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
}
