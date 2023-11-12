#import "basic-content.typ": stretch-symbol
#import "../symbols.typ": *


#let dynamic-symbol(symb: symbols.crescendo, angle: 0rad, origin: left+horizon, ..args, body) = {
  return ((
    type: "recursive-environment",
    recurse: body,
    sized-pre-draw: (self, ctx) => {
      stretch-symbol(
        origin: origin,
        x: ( (ctx.size.width.cm() * 1.385cm) / 1cm ) * 100%,
        ..args,
        rotate(angle, origin: origin, symb)
      )
    }
  ),)
}

#let crescendo = dynamic-symbol.with(symb: symbols.crescendo)
#let decrescendo = dynamic-symbol.with(symb: symbols.decrescendo)
#let tie = dynamic-symbol.with(symb: symbols.tie)