Crafty.c 'Platform',
  sizes: [100, 100, 100, 150]
  init: ->
    @requires('Base, Solid, Floatable')
    @attr
      h: 20
      w: @sizes[Utils.rand(0, @sizes.length)]
      z: 200
    @bind('EnterFrame', @resetPosition)
  resetPosition: ->
    if @x < -200
      higher = [-168, -84]
      lower = [84, 168]
      yOffset = if @y > 3000
        higher[Utils.rand(0,1)]
      else if @y < 1500
        lower[Utils.rand(0,1)]
      else
        [higher, lower][Utils.rand(0,1)][Utils.rand(0,1)]

      x = Utils.rand( @width + 200, @width + 400)
      y = -500
      @at(Game.width, @y + yOffset)
      @generateCollectable(@x + 30, @y - 50) if Math.random() > 0.7
  generateCollectable: (x, y) ->
    random = Math.random()
    xOffset = Utils.rand(20, 30)

    if random < 0.9
      Crafty.e('Leaf').at(x + xOffset, y)
    else if random < 0.97
      Crafty.e('Guarana').at(x + xOffset, y + 20)
    else
      Crafty.e('Mushroom').at(x + xOffset, y + 6)





