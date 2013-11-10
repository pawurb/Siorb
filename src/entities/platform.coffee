Crafty.c 'Platform',
  floatLeft: true
  speedValue: 2
  init: ->
    @requires('Base, Solid')
    @attr
      h: 10
      w: Utils.rand(20,40) * 5
      z: 200
    @attach(Crafty.e 'Leaf')
    @color('rgb(0,255,255)')
    @bind('EnterFrame', @float)
  float: ->
    @floatLeft = false if @x < -@w
    @floatLeft = true if @x > 500
    if @floatLeft
      @move('w', @speedValue)
    else
      @move('e', (Game.get('width') + @w))
  at: (x, y) ->
    @attr
      x: x
      y: y


