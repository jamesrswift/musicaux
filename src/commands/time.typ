#import "basic-content.typ": basic-content, space
#import "../symbols.typ": *

#let common = basic-content.with(pitch: 3, symbols.time.common)
#let cut = basic-content.with(pitch: 3, symbols.time.cut)

#let signature(top, bottom) = {
  let sized = text.with(size: 0.75em, weight: "bold", font:"Bravura")
  space(0.25em)
  basic-content(pitch: -1.15, width: 0em, sized(top))
  basic-content(pitch: 2.7, width: 0em, sized(bottom))
  space(0.25em)
}

#let tempo( ) = {

}