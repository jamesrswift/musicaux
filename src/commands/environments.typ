#import "basic-content.typ": stretch-symbol
#import "../symbols.typ": *


// Renders a symbol preceding an environment, scaled to the width of that
// environment
#let environment(
  body,
  ..args
) = {
  return (
    (
      type: "dynamic-symbol",
      recurse: body,
      positional: args.pos(),
      ..args.named()
    ),
  )
}

#let dynamic-stretch-symbol(
  body,
  content: none,

  // Move
  dx: 0pt, dy: 0pt,

  // scale
  sx: 1, sy: 1,

  // rotate
  angle: 0rad,
  origin: left+horizon
) = {
  if ( content == none ) {return body}

  return environment(
    body,
    sized-pre-draw: (self, ctx) => {
      stretch-symbol( 
        content,
        dx: dx, dy: dy,
        sx: (ctx.size.width.cm() * sx) * 100%,
        sy: (ctx.size.height.cm() * sy) * 100%,
        angle: angle,
        origin: origin,
      )
    }
  )
}

#let crescendo = dynamic-stretch-symbol.with(
  content: symbols.crescendo,
  dx: 0em, dy: -0.35em,
  sx: 1.35,
  origin: left+horizon
)

#let decrescendo = crescendo.with(content: symbols.decrescendo)

#let tie-proto(
  body,
  content: none,

  // Move
  dx: 0pt, dy: 0pt,

  // scale
  sx: 1, sy: 1,

  // rotate
  //angle: 0rad,
  drop: 0pt,
  origin: left+horizon
) = {
  //if ( content == none ) {return body}


 return environment(
    body,
    sized-pre-draw: (self, ctx) => {

      let length = calc.sqrt(
        calc.pow(drop / 1pt, 2) + 
        calc.pow( (ctx.size.width.cm() ) * sx, 2)
      )

      let angle = calc.atan(
        drop / (1pt * ctx.size.width.pt())
      )

      stretch-symbol( 
        content,
        dx: dx, dy: dy,
        sx: (ctx.size.width.cm() * sx) * 100%,
        sy: (ctx.size.height.cm() * sy) * 100%,
        angle: angle,
        origin: origin,
      )
    }
  )
}

#let tie = tie-proto.with(
  content: symbols.tie,
  dx: 0.2em, dy: -2.2em,
  sx: 1.35,
  drop: 10pt,
  origin: left+horizon
)
