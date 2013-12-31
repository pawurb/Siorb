window.Siorb = {}
window.Game =
  floatSpeed: 5
  defaultFloatSpeed: 5
  score: 0
  width : 800
  height : 420
  window: null
  start: ->
    Crafty.init @width, @height
    Crafty.load Siorb.Assets.mainMenuList(), =>
      Siorb.Assets.loadMainMenu()
      Crafty.scene("Gameplay")
  generatePlatforms: ->
    levels = [0, 0, 0, 1, 1, 2, 2, 3, 4, 5]

    for i in [0..10]
      level = levels[Utils.rand(0, levels.length)]
      yInterval = @height - @height/5 * level - 20
      xPos = @width/5 * i
      Crafty.e('Platform').at(xPos, yInterval)
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




