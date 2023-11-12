#import "/src/lib.typ": *
#set text(font: "New Computer Modern", size: 20pt)

#show: score.with(
  title: [Dance in D Major],
  subtitle: [Op 8 No. 3 Mov. 1--3],
  author: [Richard Cai]
)

#aligned(

  // First
  { 
    cmd.time.tempo("Adagio", bpm: 60)
    cmd.bars.double-bold-open()
    cmd.common.trebble()
    cmd.common.key-signature(pitch: -4)
    cmd.space(1fr)
    cmd.time.signature("4", "4")
  },

  { 
    cmd.bars.double-bold-open()
    cmd.common.bass()
    cmd.common.key-signature(pitch:2)
    cmd.space(1fr)
    cmd.time.signature("4", "4")
  },

  {
    cmd.space(0.3em)
    cmd.bars.single()
    cmd.space(0.3em)
  }, 
  
  {
    cmd.space(0.3em)
    cmd.bars.single()
    cmd.space(0.3em)
  }, 

)