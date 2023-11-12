#import "symbols.typ": symbols

#let notation(body, ctx: (:), stave: true) = {
  let body = if body != none {body} else { () }

  assert( type(body) in (array,), message: "Invalid notation!")

  for cmd in body {
    assert( type(cmd) in (dictionary, array) and "type" in cmd,
      message: "Expected plot sub-command in notation body, got " + repr(cmd))
  }

  for i in range(body.len()) {
    if "prepare" in body.at(i) {
      body.at(i) = (body.at(i).prepare)(body.at(i), ctx)
    }
  }

  set text(font: "Noto Music", size: 20pt)

  let recursive-render(..body, ctx) = {
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
        scale(y: ((size.height.pt() * 1pt) / 20pt) * 100%, origin: left+horizon, symbols.brace)
      )
    )
  })
}

#import "cmd.typ"
#import "template.typ": score