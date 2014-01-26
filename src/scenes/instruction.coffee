Crafty.scene 'Instruction', ->
  Game.scene = 'Instruction'
  Game.firstInstruction = false
  Crafty.e('SoundButton')
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('InstructionField')

  returnButton = Crafty.e('Button, powrot_button').at(640, 370)

  returnClicked = false
  $(returnButton._element).on('click', ->
    unless returnClicked
      returnClicked = true
      Game.runScene.mainMenu()
  )








