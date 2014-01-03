window.Siorb = {}
window.Game =
  host: "http://localhost:8000/assets"
  floatSpeed: 5
  defaultFloatSpeed: 5
  score: 0
  width : 800
  height : 420
  window: null
  start: ->
    Crafty.init @width, @height
    @runScene.mainMenu()
  generatePlatforms: ->
    platformArrangements = [
      [1,5,2,4,1,0,2,5,2,0],
      [1,0,1,2,0,0,3,4,1,2],
      [5,1,0,2,0,5,3,0,3,5],
      [0,1,2,4,0,5,0,2,3,0],
      [0,2,1,2,0,4,1,3,2,5,4]
    ]


    for i in [0..10]
      level = platformArrangements[Utils.rand(0, platformArrangements.length)][i]
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





