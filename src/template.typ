
#let score(
  title: [A Ballad in Typst Time],
  subtitle: [Op 1 No. 1 Mov. 1--3],
  author: [],
  body
) = {

  set text(size: 20pt)
  set align(center)

  [
    #set text(font: "New Computer Modern", size: 20pt)
    #title
    #linebreak()
  ]

  [
    #set text(font: "New Computer Modern", size: 12pt)
    #subtitle
  ]

  [
    #set text(font: "New Computer Modern", size: 12pt)
    #align(right, text(size: 12pt, author))
  ]

  [
    #set align(center)
    #v(1em)
    #body
  ]

}