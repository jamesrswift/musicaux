
#let _draw( this, ctx ) = {
  box(width: this.width, move(dx: this.dx, dy: this.dy, this.content))
}

#let basic-content(content, dx: 0pt, dy: 0pt, width: auto, pitch: none) = {
  if ( pitch != none ){ dy = dy -1.09em + pitch * 0.125em}
  return ((
    type: "basic-content",
    draw: _draw,

    // Privates
    content: content,
    dx: dx,
    dy: dy,
    width: width
  ),)
}

#let basic-text( dy: -0.4em, font: "New Computer Modern", size: 12pt, weight: "bold", ..args ) = {
  return basic-content(
    dy: dy,
    place( text(font: font, size: size, weight: weight, ..args) )
  )
}

#let basic-text-above = basic-text.with(dy: -2.6em)

#let space(distance) = {
  ((
    type: "horizontal-space",
    draw: (self, ctx)=> h(distance)
  ),)
}

#let basic-bezier(dx: 0pt, dy: 0pt, ..args) = {
  return  basic-content(
    dx: dx, dy: dy,
    place( path(.. args) )
  )
}

#let basic-bezier(dx: 0pt, dy: 0pt, ..args) = {
  return  basic-content(
    dx: dx, dy: dy,
    place( path(.. args) )
  )
}

#let stretch-symbol(dx: 0em, dy: -0.4em, ..args) = {
  return basic-content(
    dx: dx, dy: dy,
    place(scale(..args))
  )
}
