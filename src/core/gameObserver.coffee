Crafty.c 'GameObserver',
  init: ->
    @requires 'Recyclable'
    @bind('Runner:collectedGuarana', @speedUpGuarana)
    @bind('Runner:collectedLeaf', @scorePoint)
    @bind('Runner:collectedMrHot', @losePoints)
    @bind('Runner:collectedMrsCoffee', @losePoints)
    @bind('Runner:collectedMrsCoffee', @speedUpCoffee)
    @bind('Coffee:speedUpEnded', @slowDownPlatforms)
  speedUpGuarana: ->
    @speedUpPlatforms('guarana')
  speedUpCoffee: ->
    @speedUpPlatforms('coffee')
  speedUpPlatforms: (drug) ->
    Game.floatSpeed += 3 if Game.floatSpeed <= Game.defaultFloatSpeed

    clearTimeout(Game.timeouts.slowDown1) if Game.timeouts.slowDown1
    clearTimeout(Game.timeouts.slowDown2) if Game.timeouts.slowDown2

    Game.timeouts.slowDown1 = setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed + 1
    , Game.speedUpDuration - 1000

    Game.timeouts.slowDown2 = setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed
      if drug == 'guarana' then Crafty.trigger('Guarana:ended') else Crafty.trigger('Coffee:speedUpEnded')
    , Game.speedUpDuration
  slowDownPlatforms: ->
    Game.floatSpeed -= 1 if Game.floatSpeed == Game.defaultFloatSpeed

    clearTimeout(Game.timeouts.slowDown1) if Game.timeouts.slowDown1
    clearTimeout(Game.timeouts.slowDown2) if Game.timeouts.slowDown2

    Game.timeouts.slowDown2 = setTimeout =>
      Game.floatSpeed = Game.defaultFloatSpeed
      Crafty.trigger('Coffee:slowDownEnded')
    , Game.speedUpDuration/2
  scorePoint: ->
    Game.score += 1
    @setDifficulty()
    Crafty.trigger('ScoreBoard:updatePoints')
  losePoints: ->
    if Game.score >= 2 then Game.score -= 2 else Game.score = 0
    @setDifficulty()
    Crafty.trigger('ScoreBoard:updatePoints')
  setDifficulty: ->
    if Game.score < 12
      Game.platformSizes.current = Game.platformSizes.easy
    else if Game.score < 75
      Game.platformSizes.current = Game.platformSizes.medium
    else
      Game.platformSizes.current = Game.platformSizes.hard
