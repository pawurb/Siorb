Crafty.scene 'GameOver', ->
  Game.scene = 'GameOver'
  Crafty.background "url('#{Game.host}/images/gameOverBg.png')"
  Crafty.viewport.y = 0
  Crafty.trigger('Game:gameOverStarted')

  if Game.score > parseInt(localStorage.getItem('highScore'))
    localStorage.setItem('highScore', Game.score)

  # score panels
  offset = 24
  Crafty.e('PixelScoreBoard').displayAt(offset + 80, Game.height - offset*3, 'current')
  Crafty.e('Base, punkty_button').at(offset, Game.height - offset*3)

  Crafty.e('Base, rekord_button').at(offset, Game.height - offset*2)
  Crafty.e('PixelScoreBoard').displayAt(offset + 140, Game.height - offset*2, 'top')


  replayButton = Crafty.e('Button, jeszcze_button')
  replayButton.at(Game.width - offset - 147, Game.height - offset*2)

  $(replayButton._element).on('click', ->
    setTimeout ->
      Game.runScene.gameplay()
    , 200
  )

  menu_button = Crafty.e('Button, menu_button')
  menu_button.at(Game.width - offset - 147, Game.height - offset * 3)

  $(menu_button._element).on('click', ->
    setTimeout ->
      Game.runScene.mainMenu()
    , 200
  )

  Crafty.e('GameOverAd')

, ->
  Crafty('Base').destroy()



