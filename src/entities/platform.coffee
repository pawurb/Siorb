Crafty.c 'Platform',
  sizes: [100, 100, 100, 150]
  init: ->
    @requires('Base, Solid, Floatable')
    @attr
      h: 12
      w: @sizes[Utils.rand(0, @sizes.length)]
      z: 200
    @bind('EnterFrame', @resetPosition)
  resetPosition: ->
    higher = -84
    lower = 84
    yOffset = if @y > 0
      lower
    else if @y < 1000
      higher
    else
      [higher, lower][Utils.rand(0,1)]

    @at(Game.width, @y + yOffset) if @x < -200





