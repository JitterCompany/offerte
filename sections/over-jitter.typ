// About Jitter section — for proposals to new clients

#import "../brand.typ": *

#let over-jitter-section(company, lang: "nl") = {
  let en = lang == "en"

  heading(level: 1)[#if en [About Jitter] else [Over Jitter]]

  if en [
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
  ] else [
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
  ]

  v(4pt)
  text(size: 9pt, fill: jitter-gray)[
    #if en [More information:] else [Meer informatie:]
    #link("https://" + company.web)[#company.web]
    · #link("mailto:" + company.email)[#company.email]
    · #company.phone
  ]
}
