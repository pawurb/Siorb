Crafty.c 'Leaf',
  init: ->
    @requires '2D, DOM, Color, Collision, spr_leaf'
    @attr
      w: 30
      h: 30
      z: 299
    @move 'e', 50
    @move 'n', 30
    @color('rgb(0,255,0)')
    @onHit('spr_runner', ->
      @destroy())
