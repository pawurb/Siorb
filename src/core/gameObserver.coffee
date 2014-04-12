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
    @bind('Siorb:victoryEnd', @handleVictoryEnd)
  setDefaultSpeedTo: (newSpeed) ->
    Game.floatSpeed = newSpeed if Game.floatSpeed < newSpeed
    Game.defaultFloatSpeed = newSpeed
  speedUpGuarana: ->
    @speedUpPlatforms('guarana')
  speedUpCoffee: ->
    @speedUpPlatforms('coffee')
  speedUpPlatforms: (drug) ->
    Game.floatSpeed += Game.speedUpValue if Game.floatSpeed <= Game.defaultFloatSpeed

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
    @absoluteScore += data.points
    @setDifficulty()
    Crafty.trigger('ScoreBoard:updatePoints')
    Crafty.trigger('Runner:saysSomething') if (@absoluteScore % 10) == 0
    Crafty.trigger('Siorb:victory') if Game.score >= Game.victoryScore && Game.victory == false
  losePoints: ->
    if Game.score >= Game.scorePenalty then Game.score -= Game.scorePenalty else Game.score = 0
    @setDifficulty()
    Crafty.trigger('ScoreBoard:updatePoints')
  setDifficulty: ->
    if Game.score < Game.mediumScore
      Game.platformSizes.current = Game.platformSizes.easy
    else if Game.score < Game.hardScore && Game.mode == 'easy'
      Game.mode = 'medium'
      @setDefaultSpeedTo(Game.mediumFloatSpeed)

      Game.platformSizes.current = Game.platformSizes.medium
    else if Game.mode == 'medium' && Game.score >= Game.hardScore
      Game.mode = 'hard'
      Game.platformSizes.current = Game.platformSizes.hard
  handleVictory: ->
    Game.victory = true
    Game.leafProbability = 0.60
    Game.guaranaProbability = 0.66
    Game.mushroomProbability = 1.01
    #they will appear no more
    Game.mrHotProbability = 0
    Game.mrsCoffeeProbability = 0

    @setDefaultSpeedTo(Game.victoryFloatSpeed)
    Crafty.e('DiscoText')
  handleVictoryEnd: ->
    Game.leafProbability = Game.defaultLeafProbability
    Game.guaranaProbability = Game.defaultGuaranaProbability
    Game.mrsCoffeeProbability = Game.defaultMrsCoffeeProbability
    Game.mrHotProbability = Game.defaultMrHotProbability
    Game.mushroomProbability = Game.defaultMushroomProbability

    @setDefaultSpeedTo(Game.extremeFloatSpeed)


