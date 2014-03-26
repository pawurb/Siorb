Crafty.c 'Platform',
  sizesSize: null
  init: ->
    @requires('Base, Solid, Floatable')
    @sizesSize = Game.platformSizes.current.length
    @attr
      h: 15
      w: Game.platformSizes.current[Utils.rand(0, @sizesSize)]
      z: 200
    @bind('EnterFrame', @resetPosition)
    # @color('red')
  resetPosition: ->
    if @x < -250
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

      @attr
        w: Game.platformSizes.current[Utils.rand(0, @sizesSize)]

      x = Utils.rand( @width + 200, @width + 400)
      @at(Game.width, @y + yOffset)
      @generateCollectable(@x + 30, @y - 50) if Math.random() > 0.55
  generateCollectable: (x, y) ->
    random = Math.random()
    xOffset = Utils.rand(20, 30)

    if random < Game.leafProbability
      Crafty.e('Leaf').at(x + xOffset, y)
    else if random < Game.guaranaProbability
      Crafty.e('Guarana').at(x + xOffset, y + 20)
    else if random < Game.mrsCoffeeProbability
      Crafty.e('MrsCoffee').at(x + xOffset, y)
    else if random < Game.mrHotProbability
      Crafty.e('MrHot').at(x + xOffset, y)
    else
      Crafty.e('Mushroom').at(x + xOffset, y + 6)

