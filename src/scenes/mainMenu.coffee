Crafty.scene 'MainMenu', ->
  Game.scene = 'MainMenu'
  Game.firstMainMenu = false
  Crafty.viewport.y = 0
  firstYCoord = 200
  buttonOffset = 60

  # what you see
  startButton = Crafty.e('Button, start_button').at(485, firstYCoord)
  instructionButton = Crafty.e('Button, instrukcja_button').at(492, firstYCoord + buttonOffset)
  authorsButton = Crafty.e('Button, tworcy_button').at(526, firstYCoord + buttonOffset*2)
  Crafty.e('Base, rekord_button').at(Game.width - 210, Game.height - 30)

  Crafty.e('Base, leaves_image').at(429, 90)
  Crafty.e('RunnerImage').at(544, 90)
  Crafty.e('RunnerFace').at(544, 90)
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"

  Crafty.e('PixelScoreBoard').displayAt(740, 390, 'top')

  Crafty.e('SoundButton')
  Crafty.e('LogoButton')

  unless Game.firstMainMenu
    # works only on first run
    Crafty.e('FBLikeButton')

    #ask only users with some points to share who did not share
    if localStorage.getItem('highScore') > 50 and !(localStorage.getItem('sharedOnFB') == 'true')
      $('.share-image').delay(2000).fadeIn('slow')


  # navigation
  jQuery ->
    startClicked = false
    $(startButton._element).on('click', ->
      unless startClicked
        startButton.sprite(0,1)
        startClicked = true
        Game.runScene.gameplay()
    )

    instructionClicked = false
    $(instructionButton._element).on('click', ->
      unless instructionClicked
        instructionClicked = true
        Game.runScene.instruction()
    )

    authorsClicked = false
    $(authorsButton._element).on('click', ->
      unless authorsClicked
        authorsClicked = true
        Game.runScene.authors()
    )

, ->
  Crafty('Recyclable').destroy()
