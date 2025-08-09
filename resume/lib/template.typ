#import "style.typ": apply_left-block_style, apply_right-col_style, left-block-style
#import "trads.typ": blocks, titles, tr
#import "config.typ": DARK

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
  let get_img = name => {
    if DARK {
      return image("../img/" + name + "-white.svg")
    } else {
      return image("../img/" + name + ".svg")
    }
  }
  let phone_img = get_img("phone")
  let mail_img = get_img("mail")
  let home_img = get_img("home")
  let github_img = get_img("github")
  [= Contact]
  v(-.7em)
  set image(width: 18pt)
  table(
    stroke: 0pt,
    columns: (23pt, 150pt),
    row-gutter: -1pt,
    column-gutter: 2pt,
    align: (center + horizon, left + horizon),

    phone_img,
    box(baseline: 0pt)[
      (+33
      // Convoluted way to have the flag inline
      #box(baseline: -.3em, inset: (top: -6pt, bottom: -6pt, right: -6pt, left: -4pt))[
        #image("../img/fr.png", fit: "contain", height: 1.1em)
      ]
      ) 6 35 95 57 85
    ],

    mail_img,
    link("mailto:matthieu.bassetSL@gmail.com")[
      matthieu.bassetSL\@gmail.com
    ],

    home_img,
    [
      Hauts-de-France, mobile
    ],

    [#image("../img/linkedin.svg")],
    link("https://www.linkedin.com/in/matthieubasset")[
      Matthieu Basset
    ],

    github_img,
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
