Crafty.c 'GameObserver',
  init: ->
    @bind('Runner:collectedGuarana', @speedUpFloating)
    @bind('Runner:collectedLeaf', @scorePoint)
  speedUpFloating: ->
    Game.floatSpeed += 3 if Game.floatSpeed == Game.defaultFloatSpeed

    setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed + 1.5
    , 3000

    setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed
    , 4000
  scorePoint: ->
    Game.score += 1
    Crafty.trigger('ScoreBoard:scorePoint')





