#import "symbols.typ": symbols

#let recursive-render(..body, ctx) = {

  let body = if body != none {body} else { () }

  /*for cmd in body.pos() {
    assert( type(cmd) in (dictionary, array) and "type" in cmd,
      message: "Expected plot sub-command in notation body, got " + repr(cmd))
  }*/

  for i in range(body.pos().len()) {
    if "prepare" in body.pos().at(i) {
      body.pos().at(i) = (body.pos().at(i).prepare)(body.pos().at(i), ctx)
    }
  }

  for cmd in body.pos(){

    let content = none

    // Sub commands
    if ( "recurse" in cmd ){
      content = recursive-render(..cmd.recurse, ctx)
    } else if "draw" in cmd {
      content = (cmd.draw)(cmd, ctx)
    }

    if ( content != none ){
      style( (styles) => {
        let size = measure(content, styles)
        let ctx = (..ctx, size: size)
        if "sized-pre-draw" in cmd {recursive-render(..(cmd.sized-pre-draw)(cmd, ctx), ctx)}
        content

        if "sized-post-draw" in cmd {recursive-render(..(cmd.sized-post-draw)(cmd, ctx), ctx)}
        if "post-draw" in cmd {(cmd.post-draw)(cmd, ctx)}
      })
    }
  }
}

#let notation(body, ctx: (:), stave: true) = {
  assert( type(body) in (array,), message: "Invalid notation!")
  set text(font: "Noto Music", size: 20pt)

  block(
    if (stave){ text(tracking: -0.1em)[𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚] }
    +place(recursive-render(..body, ctx))
  )

}

#let group(content) = {
  style( (styles) => {
    let size = measure(content, styles)
    content
    place(
      move(
        dy: -size.height / 2, dx: -0.2em,
        scale(
          y: ((size.height.pt() * 1pt) / 20pt) * 100%, 
          x: ((size.height.pt() * 1pt) / 20pt) * 25%, 
          origin: left+horizon, symbols.brace
        )
      )
    )
  })
}

#let aligned(staves: 2, v-space: 1em, ctx: (:), ..content) = {

  assert( calc.rem(content.pos().len(), staves) == 0 )
  set text(font: "Noto Music", size: 20pt)

  style( styles => {

    let render = ([],) * staves

    set text(font: "Noto Music", size: 20pt)

    for segment in range(0, content.pos().len() - 1, step: staves) {

      let inner-render = ([],) * staves

      for inner-segment in range(0, staves) {
        inner-render.at(inner-segment) += recursive-render(..content.pos().at(
          segment + inner-segment
         ), ctx)
      }

      // Measure segments
      let width = calc.max( ..inner-render.map(it=>{return measure(it, styles).width}))

      for inner-segment in range(0, staves) {
        render.at(inner-segment) += box( width: width, inner-render.at(inner-segment) )
      }
    }

    group(
      render.map(
        (it) => {
          block(
            text(tracking: -0.1em)[𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚] + place(it)
          )
        }
      ).join(v(v-space))
    )

    //v(v-space)

  })

}

#import "cmd.typ"
#import "template.typ": score