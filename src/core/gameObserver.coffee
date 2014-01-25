Crafty.c 'GameObserver',
  init: ->
    @bind('Runner:collectedGuarana', @speedUpFloating)
    @bind('Runner:collectedLeaf', @scorePoint)
  speedUpFloating: ->
    Game.floatSpeed += 3 if Game.floatSpeed == Game.defaultFloatSpeed

    clearTimeout(Game.timeouts.slowDown1) if Game.timeouts.slowDown1
    clearTimeout(Game.timeouts.slowDown2) if Game.timeouts.slowDown2

    Game.timeouts.slowDown1 = setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed + 1
    , 3000

    Game.timeouts.slowDown2 = setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed
      Crafty.trigger('Guarana:ended')
    , 4000
  scorePoint: ->
    Game.score += 1
    Crafty.trigger('ScoreBoard:scorePoint')





