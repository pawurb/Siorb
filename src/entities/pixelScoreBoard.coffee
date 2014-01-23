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
      Utils.encode(Game.score)
    else if Game.scene == 'MainMenu'
      localStorage.getItem('highScore')
    else
      0

    _.each Utils.decode(score).toString().split(''), (point, index) =>
      point = parseInt(point)
      pixelPoint = Crafty.e('PixelPoint').print(point).at(@x + (12 * index), @y)
      pixelPoint.attr({alpha: 0.5}) if Game.scene == 'GameOver'
  displayAt: (x, y) ->
    @at(x, y)
    @printScore()







