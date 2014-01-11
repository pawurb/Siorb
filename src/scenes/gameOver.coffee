Crafty.scene 'GameOver', ->
  Game.scene = 'GameOver'
  Crafty.viewport.y = 0
  Crafty.background('rgb(0,0,0)')
  if Game.score > parseInt(localStorage.getItem('highScore'))
    localStorage.setItem('highScore', Game.score)

  Crafty.e('PixelScoreBoard').displayAt(Game.width/2, Game.height/2)


  setTimeout(->
    Crafty.scene('MainMenu')
  , 1000)
,
  ->
    Crafty.audio.stop()
    Crafty("*").destroy()




