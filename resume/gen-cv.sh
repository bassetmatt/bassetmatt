echo "#let DARK = true" > lib/config.typ
typst c CV-EN.typ CV-EN-dark.svg
echo "#let DARK = false" > lib/config.typ
typst c CV-EN.typ CV-EN-light.svg
typst c CV-EN.typ CV-EN.pdf
typst c CV-FR.typ CV-FR.pdf

typst c theme-dnd/CV-EN.typ theme-dnd/CV-EN.pdf --root .
typst c theme-dnd/CV-EN.typ theme-dnd/CV-EN.svg --root .
typst c theme-dnd/CV-FR.typ theme-dnd/CV-FR.pdf --root .
