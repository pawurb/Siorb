Crafty.scene 'Gameplay', ->
  generatePlatforms = ->
    Game.platformSizes.current = Game.platformSizes.easy

    platformArrangements = [ #playable initial arrangements
      [1,0,1,2,0,0,3,4,1,2,3],
      [5,1,0,2,0,5,3,0,3,5,4],
      [0,1,2,4,0,5,0,2,3,0,1],
      [0,2,1,2,0,4,1,3,2,5,4]
    ]
    randomArrangement = platformArrangements[Utils.rand(0, platformArrangements.length)]

    for i in [0..10]
      level = randomArrangement[i]
      yPos = 200 + (Game.height - Game.height/5 * level - 20)
      xPos = Game.width/5 * i
      Crafty.e('Platform').at(xPos, yPos).setLevel(Game.colorLevel)
  setDefaults = ->
    Game.victory = false
    Game.mode = 'easy'
    Game.floatSpeed = Game.initialFloatSpeed
    Game.defaultFloatSpeed = Game.initialFloatSpeed

    Game.leafProbability = Game.easyLeafProbability
    Game.guaranaProbability = Game.easyGuaranaProbability
    Game.mrsCoffeeProbability = Game.easyMrsCoffeeProbability
    Game.mrHotProbability = Game.easyMrHotProbability
    Game.mushroomProbability = Game.easyMushroomProbability

  setDefaults()
  Crafty.trigger('Game:gameplayStarted')
  $('#sharingModal-btn').remove() #for backend
  Game.gameplayStarted = (new Date).getTime()

  Game.scene = 'Gameplay'
  Game.score = 0
  Crafty.background('')
  Game.window = document.getElementById('game')
  $('#game').focus()
  Game.window.style.backgroundPositionY = '0px'
  Game.runner = Crafty.e 'Runner'
  Game.view = Crafty.viewport
  generatePlatforms()
  Crafty.e 'BackgroundManager'
  shortcutManager = Crafty.e('GameplayShortcuts')
  Game.runner.attach(Crafty.e('ScoreBoard'))
  Game.runner.attach(Crafty.e('ManaMeter'))
  Crafty.e 'GameObserver'
  Crafty.e 'RunnerKiller'
  Crafty.pause()

  setTimeout ->
    Crafty.pause()
    Crafty.trigger('Runner:saysSomething')
  , 1000
, ->
  $("#game").unbind("click")
  Crafty('Recyclable').destroy()
