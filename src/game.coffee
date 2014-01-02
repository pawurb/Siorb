window.Siorb = {}
window.Game =
  host: "https://s3-eu-west-1.amazonaws.com/siorb/assets"
  floatSpeed: 5
  defaultFloatSpeed: 5
  score: 0
  width : 800
  height : 420
  window: null
  start: ->
    Crafty.init @width, @height
    @runScene.gameplay()
  generatePlatforms: ->
    levels = [0, 0, 0, 1, 1, 2, 2, 3, 4, 5]


    for i in [0..10]
      level = levels[Utils.rand(0, levels.length)]
      console.log level
      yPos = 800 + (@height - @height/5 * level - 20)
      xPos = @width/5 * i
      Crafty.e('Platform').at(xPos, yPos)
  setupGlobals: ->
    @window = document.getElementById('cr-stage')
    @window.style.backgroundPositionY = '850px'
    Game.runner = Crafty.e 'Runner'
    Game.view = Crafty.viewport
    Crafty.e 'BackgroundManager'
    Crafty.e 'ScoreBoard'
    Crafty.e 'GameObserver'
    Crafty.e 'RunnerKiller'

  timeouts:
    slowDown1: null
    slowDown2: null
    speedAnimation: null
  runScene:
    mainMenu: ->
      Crafty.load Siorb.Assets.mainMenuList(), =>
        Siorb.Assets.loadMainMenu()
        Crafty.scene("MainMenu")
    gameplay: ->
      Crafty.load Siorb.Assets.gameplayList(), =>
        Siorb.Assets.loadGameplay()
        Crafty.scene("Gameplay")





