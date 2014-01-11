Crafty.c 'PixelScoreBoard',
  init: ->
    @requires 'Base'
    @attr
      w: 200
      h: 50
      z: 301
    @
  printScore: ->
    score = if Game.scene == 'GameOver'
      Game.score
    else if Game.scene == 'MainMenu'
      localStorage.getItem('highScore')
    else
      0

    _.each score.toString().split(''), (point, index) =>
      point = parseInt(point)
      Crafty.e('PixelPoint').print(point).at(@x + (12 * index), @y)
  displayAt: (x, y) ->
    @at(x, y)
    @printScore()







