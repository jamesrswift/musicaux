#import "basic-content.typ": basic-content
#import "../symbols.typ": *

// Clefs
// TO DO: Move to separate service that handles tune's key
#let single = basic-content.with(pitch: 3, symbols.bar)
#let dotted = basic-content.with(pitch: 3, symbols.bar.dotted)
#let double = basic-content.with(pitch: 3, symbols.bar.double)
#let double-bold-open = basic-content.with(pitch: 3, symbols.bar.double.bold.reverse)
#let double-bold-close = basic-content.with(pitch: 3, symbols.bar.double.bold)