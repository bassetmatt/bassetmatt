echo "#let DARK = true" > lib/config.typ
typst c CV-EN.typ CV-EN-dark.svg
echo "#let DARK = false" > lib/config.typ
typst c CV-EN.typ CV-EN-light.svg
