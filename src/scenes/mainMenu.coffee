Crafty.scene 'MainMenu', ->
  Game.scene = 'MainMenu'
  Crafty.viewport.y = 0
  firstYCoord = 200
  buttonOffset = 60

  startButton = Crafty.e('Button, start_button').at(545, firstYCoord)
  Crafty.e('Button, instrukcja_button').at(492, firstYCoord + buttonOffset)
  Crafty.e('Button, tworcy_button').at(526, firstYCoord + buttonOffset*2)
  Crafty.e('Base, leaves_image').at(429, 90)
  Crafty.e('RunnerImage').at(544, 90)
  Crafty.e('RunnerFace').at(544, 90)
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('PixelScoreBoard').displayAt(740, 390)



  $(startButton._element).on('click', ->
    setTimeout ->
      Game.runScene.gameplay()
    , 200
  )
,
  ->
    Crafty("*").destroy()


