Crafty.c 'GameObserver',
  absoluteScore: 0
  init: ->
    @requires 'Recyclable'
    @bind('Runner:collectedGuarana', @speedUpGuarana)
    @bind('Runner:collectedLeaf', @scorePoint)
    @bind('Runner:collectedMrHot', ->
      @losePoints('hot'))
    @bind('Runner:collectedMrsCoffee', ->
      @losePoints('coffee'))
    @bind('Runner:collectedMushroom', @scorePoint)
    @bind('Runner:collectedMrsCoffee', @speedUpCoffee)
    @bind('Coffee:speedUpEnded', @slowDownPlatforms)
    @bind('Siorb:victory', @handleVictory)
    @bind('Siorb:victoryEnd', @handleVictoryEnd)
    @bind('Siorb:MediumProbabilities', @switchProbabilities)
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

    Game.timeouts.slowDown1 = setTimeout ->
      Game.floatSpeed = Game.defaultFloatSpeed + 1
    , Game.speedUpDuration - 1000

    Game.timeouts.slowDown2 = setTimeout ->
      Game.floatSpeed = Game.defaultFloatSpeed
      if drug == 'guarana' then Crafty.trigger('Guarana:ended') else Crafty.trigger('Coffee:speedUpEnded')
    , Game.speedUpDuration
  slowDownPlatforms: ->
    Game.floatSpeed -= 1 if Game.floatSpeed == Game.defaultFloatSpeed

    clearTimeout(Game.timeouts.slowDown1) if Game.timeouts.slowDown1
    clearTimeout(Game.timeouts.slowDown2) if Game.timeouts.slowDown2

    Game.timeouts.slowDown2 = setTimeout ->
      Game.floatSpeed = Game.defaultFloatSpeed
      Crafty.trigger('Coffee:slowDownEnded')
    , Game.speedUpDuration/2
  scorePoint: (data)->
    Game.score += data.points
    @absoluteScore += data.points
    @setDifficulty()
    Crafty.trigger('ScoreBoard:updatePoints')
    Crafty.trigger('Runner:saysSomething') if (@absoluteScore % 11) == 0
    Crafty.trigger('Runner:saysNice') if (Game.score % 20) == 0 #TODO move to config!
    Crafty.trigger('Siorb:victory') if Game.score >= Game.victoryScore && Game.victory == false
    Crafty.trigger('Siorb:MediumProbabilities') if Game.score == Game.probabilitiesScore
  losePoints: (type) ->
    penalty = if type == 'hot' then Game.hotPenalty else Game.coffeePenalty
    if Game.score >= penalty then Game.score -= penalty else Game.score = 0
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
    Game.leafProbability = Game.victoryLeafProbability
    Game.guaranaProbability = Game.victoryGuaranaProbability
    Game.mushroomProbability = Game.victoryMushroomProbability
    #they will appear no more
    Game.mrHotProbability = Game.victoryMrHotProbability
    Game.mrsCoffeeProbability = Game.victoryMrsCoffeeProbability

    @setDefaultSpeedTo(Game.victoryFloatSpeed)
    Game.runner.attach(Crafty.e('DiscoText'))
  handleVictoryEnd: ->
    Game.leafProbability = Game.mediumLeafProbability
    Game.guaranaProbability = Game.mediumGuaranaProbability
    Game.mrsCoffeeProbability = Game.mediumMrsCoffeeProbability
    Game.mrHotProbability = Game.mediumMrHotProbability
    Game.mushroomProbability = Game.mediumMushroomProbability

    @setDefaultSpeedTo(Game.extremeFloatSpeed)
  switchProbabilities: ->
    Game.leafProbability = Game.mediumLeafProbability
    Game.guaranaProbability = Game.mediumGuaranaProbability
    Game.mrsCoffeeProbability = Game.mediumMrsCoffeeProbability
    Game.mrHotProbability = Game.mediumMrHotProbability
    Game.mushroomProbability = Game.mediumMushroomProbability


