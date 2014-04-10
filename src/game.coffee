window.Game =
  host: "http://#{window.location.host}/assets"
  initialFloatSpeed: 4
  mediumFloatSpeed: 5
  victoryFloatSpeed: 6
  extremeFloatSpeed: 7
  mode: 'easy'
  mediumScore: 5
  hardScore: 80
  victoryScore: 100
  scorePenalty: 5
  score: 0
  width : 800
  height : 420
  window: null
  scene: null
  assets: null
  firstMainMenu: true
  speedUpDuration: 7300
  speedUpValue: 2
  mushroomDuration: 13600
  defaultLeafProbability: 0.77
  defaultGuaranaProbability: 0.84
  defaultMrsCoffeeProbability: 0.92
  defaultMrHotProbability: 0.97
  defaultMushroomProbability: 1.01
  victory: false
  muted: (if localStorage.getItem('muted') == 'true' then true else false)
  volume: 0.5
  timeouts:
    slowDown1: null
    slowDown2: null
    speedAnimation: null
  platformSizes:
    current: null
    easy: [150, 150, 200, 200, 250]
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
      Crafty.load Game.assets.mainMenuList(), =>
        Game.assets.loadMainMenu()
        Crafty.scene("MainMenu")
    gameplay: ->
      Crafty.assets = []
      Crafty.load Game.assets.gameplayList(), =>
        Game.assets.loadGameplay()
        Crafty.scene("Gameplay")
    gameOver: ->
      Crafty.scene('GameOver')
    instruction: ->
      Crafty.load Game.assets.instructionList(), =>
        Game.assets.loadInstruction()
        Crafty.scene("Instruction")
    authors: ->
      Crafty.load Game.assets.authorsList(), =>
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
    #variable provided by the backend
    if (typeof(gon) != 'undefined') and gon.userLoggedIn
      scoreParam = btoa(parseInt(score))
      $.ajax
        url: "/user?user[noturbusiness]=#{scoreParam}"
        type: 'PUT'
  gameplayStarted: null



