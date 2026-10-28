// Guarantee section, variant driven by data.guarantee field

#import "i18n.typ": t

#let guarantee-section(data) = {
  heading(level: 2)[#t(data, "guarantee-heading")]

  let kind = data.at("guarantee", default: "software")
  let months = data.at("guarantee_months", default: 3)
  t(data, "guarantee-body")(kind, t(data, "months")(months))
}
