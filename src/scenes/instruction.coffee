Crafty.scene 'Instruction', ->
  Game.scene = 'Instruction'
  Game.firstInstruction = false
  Crafty.e('SoundButton')
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('InstructionField')
  Crafty.e('LogoButton')

  Crafty.e('ReturnButton')
  Crafty.e('FBLikeButton').atBottomCorner()

, ->
  Crafty('Recyclable').destroy()
