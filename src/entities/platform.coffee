Crafty.c 'Platform',
  sizes: [100, 100, 100, 150]
  init: ->
    @requires('Base, Solid, Floatable')
    @attr
      h: 15
      w: @sizes[Utils.rand(0, @sizes.length)]
      z: 200
    @bind('EnterFrame', @resetPosition)
  resetPosition: ->
    if @x < -200
      # logic responsible for platforms arrangement
      higher = [-168, -84]
      lower = [84, 168]
      random = [-84, 84]
      yOffset = if @y > 1300
        higher[Utils.rand(0,2)]
      else if @y < 1000
        lower[Utils.rand(0,2)]
      else
        random[Utils.rand(0,2)]

      x = Utils.rand( @width + 200, @width + 400)
      @at(Game.width, @y + yOffset)
      @generateCollectable(@x + 30, @y - 50) if Math.random() > 0.65
  generateCollectable: (x, y) ->
    random = Math.random()
    xOffset = Utils.rand(20, 30)

    if random < Game.leafProbability
      # Crafty.e('Leaf').at(x + xOffset, y)
      # Crafty.e('MrsCoffee').at(x + xOffset, y)
      Crafty.e('MrHot').at(x + xOffset, y + 2)
    else if random < Game.guaranaProbability
      # Crafty.e('Guarana').at(x + xOffset, y + 20)
      1==1
    else
      1==1
      # Crafty.e('Mushroom').at(x + xOffset, y + 6)





