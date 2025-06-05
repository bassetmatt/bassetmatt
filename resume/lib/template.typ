#import "style.typ": left-block-style, left-block-margins, colors, right-col-style
#import "trads.typ": titles, blocks, tr

#let right-col = [
  #show heading.where(level: 1): it => context {
    let s = measure(it.body)
    let style = if text.lang == "fr" {
      right-col-style.h1.fr
    } else {
      right-col-style.h1.en
    }
    block(..style)[
      #grid(
        columns: (auto, 1fr),
        gutter: 2pt,
        it,
        line(
          length: 110%,
          start: (
            0%,
            0% + 0.485 * s.height,
          ),
          stroke: (thickness: 0.75pt, paint: colors.resume-blue),
        ),
      )
    ]
  }
  #set par(justify: true)

  = #titles.education
  // #line(length: 100%)
  // #show heading.where(level: 2): set text(size: 12pt)
  #{
    blocks.education.poly
    blocks.education.supaero
    blocks.education.SL
  }

  = #titles.exp
  // #show heading.where(level: 2): set text(size: 12pt)
  #{
    blocks.experience.BETA
    blocks.experience.Rech_Supaero
    blocks.experience.Interim
  }

  = #titles.asso
  #{
    blocks.asso.Oronos
    blocks.asso.SCSC
    blocks.asso.Scube
  }
]

#let contact = {
  [= Contact]
  v(-.7em)
  set image(width: 21pt)
  table(
    stroke: 0pt,
    columns: (23pt, 150pt),
    row-gutter: -1pt,
    column-gutter: 2pt,
    align: (center + horizon, left + horizon),
    [#image("../img/phone.png")],
    box(baseline: 0pt)[
      (+33
      #box(baseline: -.3em, inset: (-6pt))[
        #image("../img/fr.png", fit: "contain", height: 1.1em)
      ]
      ) 6 35 95 57 85
    ],

    [#image("../img/mail.png")], link("mailto:matthieu.bassetSL@gmail.com")[matthieu.bassetSL\@gmail.com],
    [#image("../img/house.png")], [Hauts-de-France, mobile],
    [#image("../img/linkedin.svg", width: 24pt)],
    [#link("https://www.linkedin.com/in/matthieubasset")[Matthieu Basset]],

    [#image("../img/github.svg")], [#link("https://github.com/bassetmatt")[bassetmatt]],
  )
}

#let languages = {
  set image(width: 15pt)
  v(-.7em)
  table(
    stroke: 0pt,
    columns: (20pt, 180pt),
    row-gutter: 0pt,
    column-gutter: 1pt,
    align: (center + horizon, left + horizon),
    [#image("../img/fr.png")], tr(fr: [Français : Natif], en: [French: Native]),
    [#image("../img/gb.png")], tr(fr: [Anglais : Courant (C1)], en: [English: Fluent (C1)]),
    [#image("../img/jp.png")], tr(fr: [Japonais : Débutant], en: [Japanese: Beginner (Hobby)]),
  )
}

#let left-line = {
  line(
    length: 100% + left-block-margins.left + left-block-margins.right,
    start: (0% - left-block-margins.left, 0%),
    stroke: (thickness: 0.5pt),
  )
}


#let left-block = {
  block(..left-block-style.block)[
    #show heading.where(level: 1): it => context {
      let s = measure(it.body)
      let style = if text.lang == "fr" {
        left-block-style.h1.fr
      } else {
        left-block-style.h1.en
      }
      block(..style)[
        #grid(
          columns: (auto, 1fr),
          gutter: 2pt,
          it,
          line(
            length: 100% + left-block-margins.right,
            start: (
              0%,
              0% + 0.62 * s.height,
            ),
            stroke: (thickness: 0.75pt, paint: colors.resume-blue),
          ),
        )
      ]
    }
    // Presentation
    #set text(size: 11pt)
    = #titles.about_me
    #par(spacing: 1.5em, leading: 0.65em)[
      #blocks.about_me
    ]

    // #left-line

    // Contact
    #contact
    // #left-line

    // Skills
    = #titles.skills
    #par(leading: 0.65em)[
      #blocks.skills
    ]

    // Languages
    = #titles.languages
    #languages

    // #left-line
    // Hobbies
    #blocks.hobbies_etc

    #v(150pt)
  ]
}

#let title-block = {
  set align(center)
  set text(size: 20pt)
  text(font: "Verdana")[
    #titles.job
  ]
}

#let resume = {
  title-block
  v(10pt)

  grid(
    columns: (3fr, 5.3fr),
    gutter: 8pt,
    left-block,
    // Right Column
    right-col,
  )
}

#let resume-dark-mode = {
  title-block
  v(10pt)

  grid(
    columns: (3fr, 5.3fr),
    gutter: 8pt,
    left-block,
    // Right Column
    right-col,
  )
}
