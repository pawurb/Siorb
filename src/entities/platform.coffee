Crafty.c 'Platform',
  sizes: [100, 100, 200]
  init: ->
    @requires('Base, Solid, Floatable')
    @attr
      h: 12
      w: @sizes[Utils.rand(0, @sizes.length)]
      z: 200
    @bind('EnterFrame', @resetPosition)
  resetPosition: ->
    @at(window.Game.width, @y) if @x < -200





