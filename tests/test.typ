#import "/src/lib.typ": *
#set text(font: "New Computer Modern", size: 20pt)

#show: score.with(
  title: [Dance in D Major],
  subtitle: [Op 8 No. 3 Mov. 1--3],
  author: [Richard Cai]
)

#notation({
  cmd.bars.double-bold-open()
  cmd.common.trebble()
  cmd.common.key-signature(pitch: -4)

  cmd.stretch-symbol(
    origin: left + horizon,
    x:(6em/1em)*100%
  )[#symbols.crescendo]

  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 3)[#symbols.note.crotchet]

  cmd.space(0.3em)
  cmd.bars.single()
  cmd.space(0.3em)

  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 3)[#symbols.note.crotchet]

  cmd.space(0.3em)
  cmd.bars.single()
  cmd.space(0.3em)

  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
  cmd.basic-content(pitch: 3)[#symbols.note.crotchet]

  cmd.space(1fr)
  cmd.basic-content(pitch: 3)[#symbols.bar.double.bold]
})
