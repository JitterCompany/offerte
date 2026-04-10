// About Jitter section — for proposals to new clients

#import "../brand.typ": *

#let over-jitter-section(company) = {
  heading(level: 1)[Over Jitter]

  [
    Jitter B.V. is een ingenieursbureau in Delft, gespecialiseerd in
    elektronica, embedded firmware en software. Wij zijn de technische
    partner voor bedrijven die slimme hardware ontwikkelen.

    Ons team van vier engineers ontwerpt en bouwt complete systemen ---
    van PCB-ontwerp en embedded Rust firmware tot cloud-backends en
    dashboards. Met ruim 10 jaar ervaring in productontwikkeling werken
    wij als verlengstuk van uw team.

    *Directe toegang tot engineers* --- geen lagen van projectmanagers.
    *Hardware en firmware onder één dak* --- geïntegreerd ontworpen.
    *Langdurige partnerships* --- veel van onze klantrelaties zijn
    uitgegroeid tot jarenlange samenwerkingen.
  ]

  v(4pt)
  text(size: 9pt, fill: jitter-gray)[
    Meer informatie: #link("https://" + company.web)[#company.web]
    · #link("mailto:" + company.email)[#company.email]
    · #company.phone
  ]
}
