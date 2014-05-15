Game =
  host: "http://#{window.location.host}/assets"
  initialFloatSpeed: 4
  mediumFloatSpeed: 5
  victoryFloatSpeed: 6
  extremeFloatSpeed: 7
  mode: 'easy'
  mediumScore: 5
  hardScore: 80
  victoryScore: 100
  probabilitiesScore: 25
  hotPenalty: 5
  coffeePenalty: 3
  score: 0
  width: 800
  height: 420
  window: null
  scene: null
  assets: null
  firstMainMenu: true
  speedUpDuration: 7300
  speedUpValue: 2
  mushroomDuration: 13600

  easyLeafProbability: 0.81
  easyGuaranaProbability: 0.88
  easyMrsCoffeeProbability: 0.92
  easyMrHotProbability: 0.96
  easyMushroomProbability: 1.01

  mediumLeafProbability: 0.77
  mediumGuaranaProbability: 0.84
  mediumMrsCoffeeProbability: 0.92
  mediumMrHotProbability: 0.97
  mediumMushroomProbability: 1.01

  victoryLeafProbability: 0.60
  victoryGuaranaProbability: 0.66
  victoryMrsCoffeeProbability: 0
  victoryMrHotProbability: 0
  victoryMushroomProbability: 1.01

  victory: false
  muted: (if localStorage.getItem('muted') == 'true' then true else false)
  sharedOnFb: (if localStorage.getItem('sharedOnFB') == 'true' then true else false)
  volume: 0.5
  timeouts:
    slowDown1: null
    slowDown2: null
    speedAnimation: null
  platformSizes:
    current: null
    easy: [150, 150, 200, 250, 250]
    medium: [100, 100, 150, 150, 200]
    hard: [75, 100, 100, 150, 150]
  start: ->
    Crafty.init @width, @height, "game"
    @setBindings()
    Crafty.e('AudioManager')
    Crafty.e('BlackMaskManager')

    unless localStorage.getItem('highScore')
      localStorage.setItem('highScore', 0)
    Crafty.trigger('Game:initialized')
    @runScene.mainMenu()
  runScene:
    mainMenu: ->
      Crafty.assets = []
      Crafty.load Game.assets.mainMenuList(), ->
        Game.assets.loadMainMenu()
        Crafty.scene("MainMenu")
    gameplay: ->
      Crafty.assets = []
      Crafty.load Game.assets.gameplayList(), ->
        Game.assets.loadGameplay()
        Crafty.scene("Gameplay")
    gameOver: ->
      Crafty.scene('GameOver')
    instruction: ->
      Crafty.load Game.assets.instructionList(), ->
        Game.assets.loadInstruction()
        Crafty.scene("Instruction")
    authors: ->
      Crafty.load Game.assets.authorsList(), ->
        Game.assets.loadAuthors()
        Crafty.scene("Authors")
  setBindings: ->
    $(document).bind "keyup", (e) ->
      Crafty.pause() if e.keyCode == 80
  submitStatistic: (score, duration) ->
    $.ajax
      url: "/statistics?statistic[score]=#{score}&statistic[duration]=#{duration}"
      type: 'POST'

  submitScore: (score)->
    #variable 'gon' is provided by the backend
    if (typeof(gon) != 'undefined') and gon.userLoggedIn
      scoreParam = btoa(parseInt(score))
      $.ajax
        url: "/user?user[noturbusiness]=#{scoreParam}"
        type: 'PUT'
  gameplayStarted: null

window.GameInterface = {}
startFunction = Game.start
window.GameInterface.start = startFunction.bind(Game)



