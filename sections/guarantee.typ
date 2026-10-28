// Guarantee section, variant driven by data.guarantee field

#import "i18n.typ": t

#let guarantee-section(data) = {
  heading(level: 2)[#t(data, "guarantee-heading")]

  let kind = data.at("guarantee", default: "software")

  // Per-quote text (a string, or an array of paragraphs) for when none of
  // the standard guarantees fit
  if kind == "custom" {
    let gt = data.at("guarantee_text", default: ())
    let paras = if type(gt) == array { gt } else { (gt,) }
    paras.map(p => [#p]).join(parbreak())
  } else {
    let months = data.at("guarantee_months", default: 3)
    t(data, "guarantee-body")(kind, t(data, "months")(months))
  }
}
