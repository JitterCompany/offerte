// Guarantee section — variant driven by data.guarantee field

#import "i18n.typ": t

#let guarantee-section(data) = {
  heading(level: 2)[#t(data, "guarantee-heading")]

  let kind = data.at("guarantee", default: "software")

  // Per-quote custom text (string, or array of paragraphs), bypassing the
  // built-in variants. Useful when the standard guarantees do not fit.
  if kind == "custom" {
    let gt = data.at("guarantee_text", default: ())
    let paras = if type(gt) == array { gt } else { (gt,) }
    for (i, p) in paras.enumerate() {
      if i > 0 { parbreak() }
      [#p]
    }
  } else {
    let months = data.at("guarantee_months", default: 3)
    let period = (t(data, "months"))(months)
    (t(data, "guarantee-body"))(kind, period)
  }
}
