#import "trads.typ": tr

/* Variables */
#let colors = (
  resume-blue: rgb(5, 99, 193),
  left-grey: rgb(240, 240, 240),
)

#let page-common = (
  paper: "a4",
)
#let margins-fr = (
  left: 0.3cm,
  bottom: 0.6cm,
  right: 0.3cm,
  top: 0.6cm,
)
#let margins-en = (
  left: 0.2cm,
  bottom: 0.85cm,
  right: 0.2cm,
  top: 0.85cm,
)

#let page-fr = page-common + (margin: margins-fr)
#let page-en = page-common + (margin: margins-en)

#let left-block-style = (
  block: (
    fill: colors.left-grey,
    inset: (
      left: 2pt,
      right: 3pt,
      top: 1pt,
      bottom: 0pt,
    ),
    outset: (
      left: 5cm,
      right: 0pt,
      top: 6pt,
      bottom: 5cm,
    ),
  ),
  h1: (
    fr: (above: .7em, below: .7em),
    en: (above: .7em, below: .6em),
  ),
)

#let left-block-margins = (
  left: left-block-style.block.inset.left + left-block-style.block.outset.left,
  right: left-block-style.block.inset.right + left-block-style.block.outset.right,
)

#let right-col-style = (
  h1: (
    fr: (above: 1.2em, below: .85em),
    en: (above: 1.2em, below: .85em),
  ),
)

#let apply_style(it) = {
  /* Formatting */
  // #set text(font: "Segoe UI")
  set text(font: "Century Gothic")
  set text(size: 10.5pt)
  // Link format (underlined blue)
  show link: it => underline(offset: 1pt, it)
  // show link: set text(fill: rgb(5, 99, 193))
  // Headings
  set par(leading: 0.55em, spacing: 0.55em, justify: false)
  show heading.where(depth: 1): set text(font: "Century Gothic", size: 18pt, weight: 0, fill: colors.resume-blue)

  show heading.where(depth: 2): set text(font: "Century Gothic", size: 12pt, weight: "bold")
  // #show heading: set block(above: 13pt, below: 0em)
  // Page setup (margins, size)

  it
}
