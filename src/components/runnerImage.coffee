Crafty.c 'RunnerImage',
  init: ->
    @requires '2D, DOM, Color, spr_runner'
    @attr
      z: 299
    @color 'red'
    @move 'e', 50
    @move 'n', 20
