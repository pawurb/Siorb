Crafty.c 'Floatable',
  floatLeft: true
  init: ->
    @bind('EnterFrame', @float)
  float: ->
    @move('w', Game.floatSpeed)



