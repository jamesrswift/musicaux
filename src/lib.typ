#import "symbols.typ": symbols

#let notation(body, ctx: (:)) = {
  let body = if body != none {body} else { () }

  assert( type(body) in (array,), message: "Invalid notation!")

  for cmd in body {
    assert( type(cmd) == dictionary and "type" in cmd,
      message: "Expected plot sub-command in notation body, got " + repr(cmd))
  }

  for i in range(body.len()) {
    if "prepare" in body.at(i) {
      body.at(i) = (body.at(i).prepare)(body.at(i), ctx)
    }
  }

  set text(font: "Noto Music", size: 20pt)

  block(
    text(tracking: -0.1em)[𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚𝄚] +
    place( for cmd in body {
      if "draw" in cmd {(cmd.draw)(cmd, ctx)}
    } )
  )

}

#import "cmd.typ"
#import "template.typ": score