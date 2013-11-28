Crafty.c 'Leaf',
  init: ->
    @requires '2D, DOM, Color, Collision, spr_leaf'
    @attr
      z: 302
    @move 'e', 50
    @move 'n', 60
    @onHit('spr_runner', ->
      @destroy())
