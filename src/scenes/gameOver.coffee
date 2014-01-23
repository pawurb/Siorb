Crafty.scene 'GameOver', ->
  Game.scene = 'GameOver'

  Crafty.background "url('#{Game.host}/images/gameOverBg.png')"
  Crafty.viewport.y = 0

  if Game.score > parseInt(localStorage.getItem('highScore'))
    localStorage.setItem('highScore', Utils.encode(Game.score))

  offset = 24
  Crafty.e('Button, punkty_button').at(offset, Game.height - offset*2)
  Crafty.e('PixelScoreBoard').displayAt(offset + 80, Game.height - offset*2)

  replayButton = Crafty.e('Button, jeszcze_button')
  replayButton.at(Game.width - offset - 147, Game.height - offset*2)

  $(replayButton._element).on('click', ->
    setTimeout ->
      Crafty.scene('Gameplay')
    , 200
  )

  menu_button = Crafty.e('Button, menu_button')
  menu_button.at(Game.width - offset - 147, Game.height - offset * 3)

  $(menu_button._element).on('click', ->
    setTimeout ->
      Crafty.scene('MainMenu')
    , 200
  )
,
  ->
    Crafty.audio.stop()
    Crafty("*").destroy()




