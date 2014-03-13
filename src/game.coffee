window.Game =
  host: "http://#{window.location.host}/assets"
  floatSpeed: 4
  defaultFloatSpeed: 4
  score: 0
  width : 800
  height : 420
  window: null
  scene: null
  assets: null
  firstMainMenu: true
  firstGameplay: true
  firstInstruction: true
  firstAuthors: true
  speedUpDuration: 7300
  mushroomDuration: 13600
  leafProbability: 0.79
  guaranaProbability: 0.85
  mrsCoffeeProbability: 0.91
  mrHotProbability: 0.97
  mushroomProbability: 1.01
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
    Crafty.init @width, @height
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
  submitScore: ->
    highscore = parseInt(localStorage.getItem('highScore'))
    $.ajax
      url: "/user?score=#{highscore}"
      type: 'PUT'
  gameplayStarted: null



