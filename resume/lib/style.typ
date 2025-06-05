#import "trads.typ": tr

/* Variables */
#let blue = rgb(5, 99, 193)

#let page-common = (
  paper: "a4",
)
#let margins-fr = (
  left: 0.3cm,
  bottom: 0.5cm,
  right: 0.3cm,
  top: 0.5cm,
)
#let margins-en = (
  left: 0.2cm,
  bottom: 0.75cm,
  right: 0.2cm,
  top: 0.75cm,
)
#let page-fr = page-common + (margin: margins-fr)
#let page-en = page-common + (margin: margins-en)

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
  show heading.where(depth: 1): set text(font: "Century Gothic", size: 18pt, weight: 0, fill: blue)
  show heading.where(depth: 2): set text(font: "Century Gothic", size: 12pt, weight: "bold")
  // #show heading: set block(above: 13pt, below: 0em)
  // Page setup (margins, size)

  it
}

#let left-grey = rgb(240, 240, 240)
#let left-block-style = (
  fill: left-grey,
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
)

#let left-block-margins = (
  left: left-block-style.inset.left + left-block-style.outset.left,
  right: left-block-style.inset.left
    + left-block-style.outset.left
    + left-block-style.inset.right
    + left-block-style.outset.right,
)
