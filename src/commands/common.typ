#import "basic-content.typ": basic-content
#import "../symbols.typ": *

// Clefs
// TO DO: Move to separate service that handles tune's key
#let trebble = basic-content.with(pitch: 3, symbols.clef)
#let bass = basic-content.with(pitch: 3, symbols.bass)

// Key Signature
// TO DO: Move to separate service that handles tune's key
#let key-signatures = (
 0,  2, -1, 1, -2,  0,
-3, -1, -4, -2, 0, -3)

#let key-signature(pitch: 0) = {
  for i in range(7, pitch+7, step: int(pitch / calc.abs(pitch)) ) {
    basic-content(
      pitch: key-signatures.at(i),
      (if (pitch > 0 ) [#symbols.sharp] else [#symbols.flat])
    )

  }
}