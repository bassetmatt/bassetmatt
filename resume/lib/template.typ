#import "style.typ": apply_left-block_style, apply_right-col_style, left-block-style
#import "trads.typ": blocks, titles, tr

#let right-col = [
  #show: apply_right-col_style

  // School Degrees
  = #titles.education
  #{
    blocks.education.poly
    blocks.education.supaero
    blocks.education.SL
  }

  // Professionnal experience
  = #titles.exp
  #{
    blocks.experience.BETA
    blocks.experience.Rech_Supaero
    blocks.experience.Interim
  }

  // School clubs
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
      // Convoluted way to have the flag inline
      #box(baseline: -.3em, inset: (-6pt))[
        #image("../img/fr.png", fit: "contain", height: 1.1em)
      ]
      ) 6 35 95 57 85
    ],

    [#image("../img/mail.png")],
    link("mailto:matthieu.bassetSL@gmail.com")[
      matthieu.bassetSL\@gmail.com
    ],

    [#image("../img/house.png")],
    [
      Hauts-de-France, mobile
    ],

    [#image("../img/linkedin.svg", width: 24pt)],
    link("https://www.linkedin.com/in/matthieubasset")[
      Matthieu Basset
    ],

    [#image("../img/github.svg")],
    link("https://github.com/bassetmatt")[
      bassetmatt
    ],
  )
}

#let languages = {
  set image(width: 15pt)
  v(-.7em)
  table(
    stroke: 0pt,
    columns: (20pt, auto),
    row-gutter: 0pt,
    column-gutter: 1pt,
    align: (center + horizon, left + horizon),
    [#image("../img/fr.png")], tr(fr: [Français : Natif], en: [French: Native]),

    [#image("../img/gb.png")], tr(fr: [Anglais : Courant (C1)], en: [English: Fluent (C1)]),

    [#image("../img/jp.png")], tr(fr: [Japonais : Débutant], en: [Japanese: Beginner (Hobby)]),
  )
}


#let left-block = {
  block(..left-block-style.block)[
    #show: apply_left-block_style
    // Presentation
    #set text(size: 11pt)
    = #titles.about_me
    #par(leading: 0.65em)[
      #blocks.about_me
    ]


    // Contact
    #contact

    // Skills
    = #titles.skills
    #par(leading: 0.65em)[
      #blocks.skills
    ]

    // Languages
    = #titles.languages
    #languages

    // Hobbies
    #blocks.hobbies_etc

    // Overflowing the grey zone
    #v(150pt)
  ]
}


#let resume = {
  {
    set align(center)
    set text(size: 20pt)
    text(font: "Verdana")[
      #titles.job
    ]
  }
  v(10pt)

  grid(
    columns: (3fr, 5.3fr),
    gutter: 8pt,
    left-block,
    // Right Column
    right-col,
  )
}
