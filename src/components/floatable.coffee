Crafty.c 'Floatable',
  floatLeft: true
  defaultSpeed: Game.defaultFloatSpeed
  speed: Game.floatSpeed
  init: ->
    @bind('EnterFrame', @float)
    @bind('Platform:speedUp', @speedUp)
  float: ->
    @move('w', @speed)
  speedUp: ->
    @speed += 2 if @speed == @defaultSpeed
    setTimeout =>
      @speed = @defaultSpeed
    , 4000



