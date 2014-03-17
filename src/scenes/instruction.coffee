Crafty.scene 'Instruction', ->
  Game.scene = 'Instruction'
  Crafty.e('SoundButton')
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('InstructionField')
  Crafty.e('LogoButton')

  Crafty.e('ReturnButton')

, ->
  Crafty('Recyclable').destroy()
