Crafty.c 'GameObserver',
  absoluteScore: 0
  init: ->
    @requires 'Recyclable'
    @bind('Runner:collectedGuarana', @speedUpGuarana)
    @bind('Runner:collectedLeaf', @scorePoint)
    @bind('Runner:collectedMrHot', @losePoints)
    @bind('Runner:collectedMrsCoffee', @losePoints)
    @bind('Runner:collectedMushroom', @scorePoint)
    @bind('Runner:collectedMrsCoffee', @speedUpCoffee)
    @bind('Coffee:speedUpEnded', @slowDownPlatforms)
    @bind('Siorb:victory', @handleVictory)
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
  scorePoint: (data)->
    Game.score += data.points
    @absoluteScore += 1
    @setDifficulty()
    Crafty.trigger('ScoreBoard:updatePoints')
    Crafty.trigger('Runner:saysSomething') if (@absoluteScore % 10) == 0
    Crafty.trigger('Siorb:victory') if Game.score > 5 && Game.victory == false
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
  handleVictory: ->
    console.log 'dup dup'
    Crafty.e('DiscoText')
    Game.victory = true
    Game.leafProbability = 0.60
    Game.guaranaProbability = 0.70
    Game.mushroomProbability = 1.01
    Game.floatSpeed = 8
    Game.defaultFloatSpeed = 8

