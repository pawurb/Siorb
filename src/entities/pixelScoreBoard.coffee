Crafty.c 'PixelScoreBoard',
  init: ->
    @requires 'Base'
    @attr
      x: 200
      y: 200
      w: 400
      h: 100
      z: 301
    @color('red')
    @printScore()
  printScore: ->
    _.each Game.score.toString().split(''), (point, index) =>
      Crafty.e('PixelPoint').print(parseInt(point)).at(@x + (12 * index), @y)






