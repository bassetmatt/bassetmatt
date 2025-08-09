#import "/lib/trads.typ": tr

/* Colors */
#let colors = (
  heading-red: rgb("#741f0f"),
  title: gradient.linear(
    rgb("#724037"),
    rgb("#975545"),
    angle: 90deg,
  ),
  title-stroke: rgb("#878d8b"),
  yellow-line: rgb("#c5ac7b"),
)

#let yellow-line(length: 100%) = place(
  line(
    length: length,
    start: (0%, .3em),
    stroke: (thickness: 0.75pt, paint: colors.yellow-line),
  ),
)

/* Page Setup */
#let margins-fr = (
  left: .8cm,
  bottom: 1.1cm,
  right: .8cm,
  top: 1.1cm,
)
#let margins-en = (
  left: .8cm,
  bottom: 1.1cm,
  right: .8cm,
  top: 1.1cm,
)

#let page-fr = (margin: margins-fr)
#let page-en = (margin: margins-en)

/* Globl document style*/
#let apply_style(doc) = {
  /* Formatting */
  set text(
    size: 10.5pt,
    font: "TT Jenevers Trl",
  )

  // Link format (underlined)
  show link: lk => underline(offset: 2pt, lk, stroke: .4pt)

  set par(
    leading: 0.55em,
    spacing: 0.55em,
    justify: false,
  )

  // Headings
  show heading.where(depth: 1): set text(
    font: "MrsEavesSmallCaps",
    size: 18pt,
    weight: 300,
    fill: colors.heading-red,
  )

  show heading.where(depth: 2): set text(
    font: "TT Jenevers Trl",
    size: 11pt,
    weight: "bold",
  )

  // Page setup for dark mode (transparent background)
  // Also managed in the left-block fill color
  set page(
    paper: "a4",
    background: image("/theme-dnd/res/PHB_BG_H.jpg", height: 100%, width: 100%),
  )

  doc
}


/* Right column specific style */
#let right-col-params = (
  h1: (
    // Just like for left-block, spacing can change with language to reflect
    // different height in documents
    fr: (above: 1.3em, below: .9em),
    en: (above: 1.3em, below: .9em),
  ),
)

#let apply_right-col_style(doc) = {
  show heading.where(level: 1): head => {
    // Measuring content to adapt the line position
    let style = if text.lang == "fr" {
      right-col-params.h1.fr
    } else {
      right-col-params.h1.en
    }
    block(..style)[
      // Blue line after heading body
      #head
      #yellow-line(length: 110%)
    ]
  }
  set par(justify: true)
  doc
}


/* Left block specific style*/
#let left-block-style = (
  block: (
    // fill: colors.left-grey.transparentize(50%),
    // Various margins to avoid text to be to close to the gray area limit
    inset: (
      left: 2pt,
      right: 3pt,
      top: 1pt,
      bottom: 0pt,
    ),
    // Expanding gray area around base definition
    // Bottom and left are very large, it may be possible to set it up to
    // perfectly match the page border, I may do it someday
    outset: (
      left: 5cm,
      right: 0pt,
      top: 6pt,
      bottom: 5cm,
    ),
  ),
  h1: (
    fr: (above: .8em, below: .7em),
    en: (above: .8em, below: .7em),
  ),
)

#let left-block-margins = (
  left: left-block-style.block.inset.left + left-block-style.block.outset.left,
  right: left-block-style.block.inset.right + left-block-style.block.outset.right,
)

/* Left Block application function */
#let apply_left-block_style(doc) = {
  show heading.where(level: 1): head => {
    // Spacing around headings can change with language to reflect
    // different height in documents
    let style = if text.lang == "fr" {
      left-block-style.h1.fr
    } else {
      left-block-style.h1.en
    }
    block(..style)[
      // Blue line after heading body
      #head
      #yellow-line()
    ]
  }
  doc
}
