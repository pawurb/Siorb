Crafty.scene 'Instruction', ->
  Game.scene = 'Instruction'
  Game.firstInstruction = false
  Crafty.e('SoundButton')
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('InstructionField').load()






