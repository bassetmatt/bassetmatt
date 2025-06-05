// Povided with the French and English versions of a same piece of content,
// it renders as the one corresponding to the current language (`text.lang`).
//
// All content should be written in `tr` calls to ensure that the whole document can be localized.
// When both versions are the same and to avoid duplication, use the `both` parameter.
#let tr(fr: none, en: none, both: none) = {
  // Either `fr` and `en` are provided, or `both` is provided.
  assert((fr != none and en != none) or (both != none))
  context {
    if both != none {
      both
    } else {
      if text.lang == "fr" {
        fr
      } else if text.lang == "en" {
        en
      } else {
        assert(false, "Unknown language")
      }
    }
  }
}

#let titles = (
  job: tr(
    fr: [
      Matthieu BASSET -- Développeur Python/C/C++/Rust
    ],
    en: [
      Matthieu BASSET -- Python/C/C++/Rust Developer
    ],
  ),
  about_me: tr(fr: "Qui suis-je", en: "About me"),
  skills: tr(fr: "Compétences", en: "Skills"),
  languages: tr(fr: "Langues", en: "Languages"),
  education: tr(fr: "FORMATION", en: "EDUCATION"),
  exp: tr(fr: "EXPERIENCE PROFESSIONNELLE", en: "EXPERIENCE"),
  asso: tr(fr: "ASSOCIATIF", en: "STUDENT ASSOCIATIONS"),
)

#let blocks = (
  about_me: tr(
    fr: [
      Jeune diplômé de 24 ans, je suis passionné par les sciences depuis toujours, surtout les mathématiques et la programmation.\
      Je sais m'adapter à tous les contextes et apprendre rapidement. Je m'intègre toujours efficacement au sein d'équipes dans les projets communs auxquels j'ai participé.
    ],
    en: [
      Young 24 years old graduate, I have been passionate about science as long as I can remember, specifically about maths and programming.\
      I get used to any situation and learn quickly. I always integrate effectively within teams in the joint projects in which I have participated.
    ],
  ),
  skills: tr(
    fr: [
      Avancé : Python, C, C++, Rust, git\
      Bonnes connaissances : Java, Shell, Qt, C\#, typst/LaTeX, SDL, OpenGL\
      Connaissances : HTML/CSS, JavaScript\
      Utilisation quotidienne de Linux depuis plus de trois ans (Archlinux), confortable avec Windows/Mac.
    ],
    en: [
      Advanced: Python, C, C++, Rust, git\
      Fair: Java, Shell, Qt, C\#, typst/LaTeX, SDL, OpenGL \
      Basic Knowledge: HTML/CSS, JavaScript\
      Daily use of Linux for more than three years, comfortable with Windows/Mac.
    ],
  ),
  hobbies_etc: tr(
    fr: [
      = Centres d'intérêts
      - Sports :
        - Escalade
        - Badminton
        - Ultimate
      - Intéressé par la culture japonaise

      = Divers
      - Permis B
      - Bac S Spé Maths mention TB\
    ],
    en: [
      = Hobbies
      - Sports:
        - Climbing/Bouldering
        - Badminton
        - Ultimate
      - Interested in Japanese culture

      = Miscellaneous
      - Driving License
      - Bac S with distinction (french high school diploma)
    ],
  ),
  education: (
    poly: tr(
      fr: [
        == Polytechnique Montréal -- Maîtrise génie informatique et logiciel
        _2022--2025_\
        #par()[
          Double diplôme dans le cadre de mes études d'ingénieur.
          Renforcement de mes compétences en informatique et programmation, notamment via les cours d'introduction à l'intelligence artificielle, infographie, fouille de données, applications multimédias, application de l'intelligence artificielle aux jeux vidéos.
        ]
      ],
      en: [
        == Polytechnique Montréal -- Master's Degree (M.Ing.) in Software Engineering
        _2022--2025_\
        #par()[
          Dual degree as part of my engineering studies.
          Strengthened my computer science and programming skills, particularly through introductory courses in artificial intelligence, computer graphics, data mining, multimedia applications, and the application of artificial intelligence to video games.
        ]
      ],
    ),
    supaero: tr(
      fr: [
        == ISAE Supaero (Toulouse) -- Ingénieur généraliste diplômé (MSc)
        _2020--2025_\
        #par()[
          Diplôme d'ingénieur, projets en Java/C, mathématiques appliquées.
          Cours électifs d'informatiques : Langages fonctionnels, théorie de l'information, algorithmes évolutionnaires, optimisation, méthodes de Monte-Carlo.
          Connaissances en aéronautique, aérospatial.
        ]
      ],
      en: [
        == ISAE Supaero (Toulouse) -- Engineering Degree (MSc)
        _2020--2025_\
        #par()[
          Engineering degree, Java/C projects, applied mathematics.
          Elective computer science courses: Functional languages, information theory, evolutionary algorithms, optimization, Monte Carlo methods.
          Knowledge of aeronautics and aerospace.
        ]
      ],
    ),
    SL: tr(
      fr: [
        == Lycée Saint-Louis (Paris) -- Classe Préparatoires aux grandes écoles
        _2018--2020_\
        #par()[ CPGE, MPSI-PSI\* ]
      ],
      en: [
        == Lycée Saint-Louis (Paris) -- Classe Préparatoires aux grandes écoles
        _2018--2020_\
        #par()[ MPSI-PSI\*. Intensive theoretical courses in mathematics and phycics.]
      ],
    ),
  ),
  experience: (
    BETA: tr(
      fr: [
        == BETA Technologies -- Stage de fin de maîtrise
        _Septembre--Décembre 2024_\
        #par()[
          Développement d'applications en Python via le framework Qt. Conception d'algorithmes.
        ]
      ],
      en: [
        == BETA Technologies -- End of studies internship
        _September--December 2024_\
        #par()[
          Development of applications in Python using the Qt framework. Design of algorithms.
        ]
      ],
    ),
    Rech_Supaero: tr(
      fr: [
        == Laboratoires ISAE-SUPAERO -- Stage de recherche
        _Mai--Juillet 2022_\
        #par()[
          Travail sur le développement de chiffrement pour un nano-satellite, réalisation d'une interface de communication pour un banc de test en python.
        ]
      ],
      en: [
        == Laboratoires ISAE-SUPAERO -- Research Internship
        _May-July 2022_\
        Work on developing encryption for a nanosatellite, creating a communication interface for a test bench in Python.
      ],
    ),
    Interim: tr(
      fr: [
        == Agence intérim Actual Arras -- Stage découverte entreprise
        _Juillet 2021 -- 4 semaines_\
        #par()[
          Inscription d'intérimaires. Gestion des demandes des entreprises et intérimaires.
        ]
      ],
      en: [
        == Actual Arras (Temporary employment agency) -- Company discovery internship
        _July 2021 -- 4 weeks_\
        #par()[
          Temporary worker registration. Management of requests from companies and temporary workers.
        ]
      ],
    ),
  ),
  asso: (
    Oronos: tr(
      fr: [
        == Oronos Polytechnique -- Membre du club (Section avionique)
        _2023--2024_\
        #par()[
          Écriture de drivers pour des cartes de capteurs en Rust (adaptation de code C++).
        ]
      ],
      en: [
        == Oronos Polytechnique -- Club member (Avionics Team)
        _2023--2024_\
        #par()[
          Writing drivers for sensor cards in Rust (adaptation of C++ code).
        ]
      ],
    ),
    SCSC: tr(
      fr: [
        == Supaero Computer Science Club -- Membre du club
        _2021--2022_\
        #par()[
          Introduction à Linux, début de conception d'un jeu de combat en C++.
        ]
      ],
      en: [
        == Supaero Computer Science Club -- Club member
        _2021--2022_\
        #par()[
          Introduction to Linux, started to design a fighting game in C++.
        ]
      ],
    ),
    Scube: tr(
      fr: [
        == Supaero Space Section -- Chef de pôle (Projet Æther)
        _2020--2022_\
        #par()[
          Responsable du pôle trajectoire du projet, gestion de l'équipe.
          Conception/Programmation de code embarqué en C pour une fusée amateur.
        ]
      ],
      en: [
        == Supaero Space Section -- Team Manager (Project Æther)
        _2020--2022_\
        #par()[
          Project trajectory manager, team management.
          Design/programming of embedded code in C for an amateur rocket.
        ]
      ],
    ),
  ),
)
