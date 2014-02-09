Crafty.c 'PixelScoreBoard',
  init: ->
    @requires 'Base'
    @attr
      w: 200
      h: 50
      z: 301
    @
  printScore: (scoreType) ->
    score = if scoreType == 'current'
      Game.score
    else if scoreType == 'top'
      localStorage.getItem('highScore')
    else
      0

    _.each score.toString().split(''), (point, index) =>
      point = parseInt(point)
      pixelPoint = Crafty.e('PixelPoint').print(point).at(@x + (12 * index), @y)
      pixelPoint.attr({alpha: 0.5}) if Game.scene == 'GameOver'
  displayAt: (x, y, type) ->
    @at(x, y)
    @printScore(type)







