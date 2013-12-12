Crafty.scene 'MainMenu', ->
  Crafty.background "url('assets/images/mainMenuBg.png')"

  firstYCoord = 200
  buttonOffset = 60

  Crafty.e('Button, start_button').at(545, firstYCoord)
  Crafty.e('Button, instrukcja_button').at(492, firstYCoord + buttonOffset)
  Crafty.e('Button, tworcy_button').at(526, firstYCoord + buttonOffset*2)
  Crafty.e('Base, leaves_image').at(429, 90)
  Crafty.e('RunnerImage').at(544, 90)
  Crafty.e('RunnerFace').at(544, 90)


  # setTimeout ->
  #   Crafty.load Siorb.Assets.gameplayList(), =>
  #     Siorb.Assets.loadGameplay()
  #     Crafty.scene("Gameplay")
  # , 2000
