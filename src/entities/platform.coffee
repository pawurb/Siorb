Crafty.c 'Platform',
  floatLeft: true
  defaultSpeed: 3
  speedValue: 3
  sizes: [100, 100, 200]
  init: ->
    @requires('Base, Solid')
    @attr
      h: 12
      w: @sizes[Utils.rand(0, @sizes.length)]
      z: 200
    @attachCollectable()
    # @color('rgb(0,255,255)')
    @bind('EnterFrame', @float)
    @bind('Platform:speedUp', @speedUp)
  float: ->
    @floatLeft = false if @x < -@w
    @floatLeft = true if @x > 500
    if @floatLeft
      @move('w', @speedValue)
    else
      @move('e', (window.Game.width + @w))
  at: (x, y) ->
    @attr
      x: x
      y: y
  attachCollectable: ->
    if Math.random() > 0.8
      @attach(Crafty.e 'Leaf')
    else
      @attach(Crafty.e 'Guarana')
  speedUp: ->
    @speedValue += 2 if @speedValue == @defaultSpeed
    setTimeout =>
      @speedValue = @defaultSpeed
    , 4000





