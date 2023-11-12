#import "basic-content.typ": basic-content, basic-text-above, space
#import "../symbols.typ": *

#let common = basic-content.with(pitch: 3, symbols.time.common)
#let cut = basic-content.with(pitch: 3, symbols.time.cut)

#let signature(top, bottom) = {
  let sized = text.with(size: 0.7em, weight: "bold", font:"Bravura")
  space(0.25em)
  basic-content(pitch: -1.4, width: 0em, sized(top))
  basic-content(pitch: 2.5, width: 0em, sized(bottom))
  space(0.25em)
}

#let tempo( content, bpm: 120, font: "Bravura" ) = {
  basic-content(
    dy: -2.8em,
    place( box(text(font: font, size: 12pt)[*#content*#h(0.4em);( 𝅘𝅥𝅮 = #bpm )], width: 100em) )
  )
}