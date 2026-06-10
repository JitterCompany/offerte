// About Jitter section — for proposals to new clients

#import "../brand.typ": *
#import "i18n.typ": t

#let over-jitter-section(company, data) = {
  heading(level: 1)[#t(data, "over-jitter-heading")]

  t(data, "over-jitter-body")

  v(4pt)
  text(size: 9pt, fill: jitter-gray)[
    #t(data, "over-jitter-more") #link("https://" + company.web)[#company.web]
    · #link("mailto:" + company.email)[#company.email]
    · #company.phone
  ]
}
