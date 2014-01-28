Crafty.c 'GameObserver',
  init: ->
    @bind('Runner:collectedGuarana', @speedUpFloating)
    @bind('Runner:collectedLeaf', @scorePoint)
    @bind('Runner:collectedMrHot', @losePoints)
  speedUpFloating: ->
    Game.floatSpeed += 3 if Game.floatSpeed == Game.defaultFloatSpeed

    clearTimeout(Game.timeouts.slowDown1) if Game.timeouts.slowDown1
    clearTimeout(Game.timeouts.slowDown2) if Game.timeouts.slowDown2

    Game.timeouts.slowDown1 = setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed + 1
    , Game.guaranaDuration - 1000

    Game.timeouts.slowDown2 = setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed
      Crafty.trigger('Guarana:ended')
    , Game.guaranaDuration
  scorePoint: ->
    Game.score += 1
    Crafty.trigger('ScoreBoard:updatePoints')
  losePoints: ->
    if Game.score > 5 then Game.score -= 5 else Game.score = 0
    Crafty.trigger('ScoreBoard:updatePoints')





