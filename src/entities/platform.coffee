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
    if @x < -200
      higher = -84
      lower = 84
      yOffset = if @y > 0
        lower
      else if @y < 1000
        higher
      else
        [higher, lower][Utils.rand(0,1)]

      x = Utils.rand( @width + 200, @width + 400)
      y = -500
      @at(Game.width, @y + yOffset)
      @generateCollectable(@x + 30, @y - 50) if Math.random() > 0.5
  generateCollectable: (x, y) ->
    random = Math.random()
    xOffset = Utils.rand(20, 30)

    if random < 0.6
      Crafty.e('Leaf').at(x + xOffset, y)
    else if random < 0.9
      Crafty.e('Guarana').at(x + xOffset, y + 30)
    else
      Crafty.e('Mushroom').at(x + xOffset, y + 30)





