Crafty.c 'Base',
  init: ->
    @requires '2D, DOM, Color, Recyclable'
    @
  at: (x, y) ->
    @attr
      x: x
      y: y
    @
