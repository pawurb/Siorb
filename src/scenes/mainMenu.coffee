Crafty.scene 'MainMenu', ->
  Game.scene = 'MainMenu'
  Game.firstMainMenu = false
  Crafty.viewport.y = 0
  firstYCoord = 200
  buttonOffset = 60

  # what you see
  startButton = Crafty.e('Button, start_button').at(545, firstYCoord)
  instructionButton = Crafty.e('Button, instrukcja_button').at(492, firstYCoord + buttonOffset)
  Crafty.e('Button, tworcy_button').at(526, firstYCoord + buttonOffset*2)
  Crafty.e('Button, rekord_button').at(Game.width - 210, Game.height - 30)

  Crafty.e('Base, leaves_image').at(429, 90)
  Crafty.e('RunnerImage').at(544, 90)
  Crafty.e('RunnerFace').at(544, 90)
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('PixelScoreBoard').displayAt(740, 390)
  Crafty.e('SoundButton')
  Crafty.e('LogoButton')

  startClicked = false

  Game.runScene.gameplay() # for now

  jQuery ->
    $(startButton._element).on('click', ->
      unless startClicked
        startClicked = true
        Game.runScene.gameplay()
    )

    instructionClicked = false
    $(instructionButton._element).on('click', ->
      unless instructionClicked
        instructionClicked = true
        Game.runScene.instruction()
    )




