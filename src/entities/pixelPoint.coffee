Crafty.c 'PixelPoint',
  init: ->
    @requires 'Base, spr_digits'
    @attr
      w: 12
      h: 16
      z: 301
  print: (value) ->
    @sprite(0, value)
    @



