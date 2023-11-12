#import "/src/lib.typ": *
#set text(font: "New Computer Modern", size: 20pt)

#show: score.with(
  title: [Dance in D Major],
  subtitle: [Op 8 No. 3 Mov. 1--3],
  author: [Richard Cai]
)

#group({


  notation(
    {
    cmd.bars.double-bold-open()
    cmd.common.trebble()
    cmd.common.key-signature(pitch: -4)

    cmd.time.signature("4", "4")

    cmd.space(0.3em)
    cmd.bars.single()
    cmd.space(0.3em)

    cmd.basic-text(size: 20pt)[#symbols.pedal]

    cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
    cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
    cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
    cmd.basic-content(pitch: 3)[#symbols.note.crotchet]

    cmd.space(0.3em)
    cmd.bars.single()
    cmd.space(0.3em)

    cmd.env.crescendo(
      {
      cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
      cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
      cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
      cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
      cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
    })

    cmd.space(0.3em)
    cmd.bars.single()
    cmd.space(0.3em)

    cmd.basic-text(size: 20pt)[#symbols.pedal.release]

    cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
    cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
    cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
    cmd.basic-content(pitch: 3)[#symbols.note.crotchet]

    cmd.space(1fr)
    cmd.basic-content(pitch: 3)[#symbols.bar.double.bold]
  })

  v(1em)

  notation(
    {
    cmd.bars.double-bold-open()
    cmd.common.bass()
    cmd.common.key-signature(pitch: -4)

    cmd.space(0.3em)

    cmd.bars.single()
    cmd.space(0.3em)

    cmd.env.tie(
      angle: 30deg, dy: -2.2em, dx: 0.12em,
      {
      cmd.basic-content(pitch: 1)[#symbols.note.crotchet]
      cmd.basic-content(pitch: 2)[#symbols.note.crotchet]
      cmd.basic-content(pitch: 3)[#symbols.note.crotchet]
      cmd.basic-content(pitch: 4)[#symbols.note.crotchet]
    })

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

})