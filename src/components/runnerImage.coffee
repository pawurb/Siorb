Crafty.c 'RunnerImage',
  init: ->
    @requires '2D, DOM, Color, SpriteAnimation, spr_runner'
    @attr
      z: 299
    # @color 'red'
    @move('e', 50)
    @move('s', 155)
    @reel('RunnerRuns', 500, 0, 0, 3)
    @animate('RunnerRuns', -1)


