# Typst Resume !
## File generation
- For PDFs, I use the VSCode extension tinymist, but `typst c CV-[FR/EN].typ out.pdf` works too
- For SVGs, I use the command line only `typst c CV-EN.typ CV-EN-dark.svg` (same for light mode)

The SVG use the light/dark mode switch featured in `lib/config.typ` (small file to be easily overwritable by an `echo` commmand)

## Code files decriptions
- `CV-[FR|EN].typ`: Just the file used for generation
- `lib/`
  - `config.typ`: File containing only the dark mode switch
  - `style.typ`: All styling elements
  - `template.typ`: Layout elements, using style elements
  - `trads.typ`: Main text contents, used in template, they exist in both French and English to easily generate my resume in both languages.

## Theme
A themed version of my resume is available in the `theme-dnd` folder!
