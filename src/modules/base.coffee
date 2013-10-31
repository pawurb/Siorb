Crafty.c 'Base',
  init: ->
    @requires '2D, DOM, Color'
    @
  at: (x, y) ->
    @attr
      x: x * 10
      y: y * 10