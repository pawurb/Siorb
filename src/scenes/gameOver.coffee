Crafty.scene 'GameOver', ->
  Game.scene = 'GameOver'
  Crafty.background "url('#{Game.host}/images/gameOverBg.png')"
  Crafty.viewport.y = 0
  Crafty.trigger('Game:gameOverStarted')
  Crafty.e('GameOverShortcuts')

  if Game.score > parseInt(localStorage.getItem('highScore'))
    localStorage.setItem('highScore', Game.score)

  playDuration = parseInt(((new Date).getTime() - Game.gameplayStarted) / 1000)
  Game.submitStatistic(Game.score, playDuration)
  Game.submitScore(Game.score)

  # score panels
  offset = 24
  Crafty.e('PixelScoreBoard').displayAt(offset + 205, Game.height - offset*3, 'current')
  Crafty.e('Base, gOpunkty_button').at(offset, Game.height - offset*3)

  Crafty.e('Base, gOrekord_button').at(offset, Game.height - offset*2)
  Crafty.e('PixelScoreBoard').displayAt(offset + 144, Game.height - offset*2, 'top')


  buttonsOffset = 235
  replayButton = Crafty.e('Button, jeszcze_button')
  replayButton.at(Game.width - offset - buttonsOffset, Game.height - offset * 3)

  $(replayButton._element).on('click', ->
    if Game.victory
      window.location.reload()
    else
      Game.runScene.gameplay()
  )

  menu_button = Crafty.e('Button, menu_button')
  menu_button.at(Game.width - offset - buttonsOffset, Game.height - offset*2)

  $(menu_button._element).on('click', ->
    window.location.reload()
  )

  Crafty.e('GameOverAd')

, ->
  Crafty('Recyclable').destroy()
