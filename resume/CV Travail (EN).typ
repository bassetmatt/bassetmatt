#import "lib/config.typ": DARK
#import "lib/style.typ": apply_style, page-en
#import "lib/template.typ": resume

#set text(lang: "en", fill: if DARK { white } else { black })
#set page(..page-en, fill: if DARK { rgb(0, 0, 0, 0) } else { white })

#show: apply_style

#resume
