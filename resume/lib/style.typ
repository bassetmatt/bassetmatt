#import "trads.typ": tr
#import "config.typ": DARK

/* Colors */
#let colors = (
  resume-blue: rgb(5, 99, 193),
  left-grey: rgb(240, 240, 240),
  left-grey-alpha: rgb(240, 240, 240, 20),
  transparent: rgb(0, 0, 0, 0),
)

/* Page Setup */
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

#let page-fr = (margin: margins-fr)
#let page-en = (margin: margins-en)

/* Globl document style*/
#let apply_style(doc) = {
  /* Formatting */
  set text(
    size: 10.5pt,
    font: "Century Gothic",
    // font: "Segoe UI",
    // White text for dark mode
    fill: if DARK { white } else { black },
  )

  // Link format (underlined)
  show link: lk => underline(offset: 1pt, lk)
  // Disabled blue links,, too flashy
  // show link: set text(fill: colors.resume-blue)

  set par(
    leading: 0.55em,
    spacing: 0.55em,
    justify: false,
  )

  // Headings
  show heading.where(depth: 1): set text(
    font: "Century Gothic",
    size: 18pt,
    weight: 0,
    fill: colors.resume-blue,
  )

  show heading.where(depth: 2): set text(
    font: "Century Gothic",
    size: 12pt,
    weight: "bold",
  )

  // Page setup for dark mode (transparent background)
  // Also managed in the left-block fill color
  set page(
    paper: "a4",
    fill: if DARK { colors.transparent } else { white },
  )

  doc
}

/* Left block specific style*/
#let left-block-style = (
  block: (
    fill: if DARK { colors.left-grey-alpha } else { colors.left-grey },
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
    fr: (above: .7em, below: .7em),
    en: (above: .7em, below: .6em),
  ),
)

// Total margins for left block, useful variables for line definition
#let left-block-margins = (
  left: left-block-style.block.inset.left + left-block-style.block.outset.left,
  right: left-block-style.block.inset.right + left-block-style.block.outset.right,
)

/* Left Block application function */
#let apply_left-block_style(doc) = {
  show heading.where(level: 1): head => context {
    // Measuring content to adapt the line position
    let s = measure(head.body)
    // Spacing around headings can change with language to reflect
    // different height in documents
    let style = if text.lang == "fr" {
      left-block-style.h1.fr
    } else {
      left-block-style.h1.en
    }
    block(..style)[
      // Blue line after heading body
      #grid(
        columns: (auto, 1fr),
        gutter: 2pt, // Spacing between line start and text
        head,
        line(
          // Automatically adapt with margin changes
          length: 100% + left-block-margins.right,
          start: (
            0%,
            // Setup to be aligned with the bar in the letter 'e'
            0% + 0.62 * s.height,
          ),
          stroke: (thickness: 0.75pt, paint: colors.resume-blue),
        ),
      )
    ]
  }
  doc
}

/* Right column specific style */
#let right-col-params = (
  h1: (
    // Just like for left-block, spacing can change with language to reflect
    // different height in documents
    fr: (above: 1.2em, below: .85em),
    en: (above: 1.2em, below: .85em),
  ),
)

#let apply_right-col_style(doc) = {
  show heading.where(level: 1): head => context {
    // Measuring content to adapt the line position
    let s = measure(head.body)
    let style = if text.lang == "fr" {
      right-col-params.h1.fr
    } else {
      right-col-params.h1.en
    }
    block(..style)[
      // Blue line after heading body
      #grid(
        columns: (auto, 1fr),
        gutter: 2pt, // Spacing between line start and text
        head,
        line(
          // Obviously overdimensionned, not very concerning
          length: 110%,
          start: (
            0%,
            // Setup to be aligned with the bar in the letter 'E'
            0% + 0.485 * s.height,
          ),
          stroke: (thickness: 0.75pt, paint: colors.resume-blue),
        ),
      )
    ]
  }
  set par(justify: true)
  doc
}
