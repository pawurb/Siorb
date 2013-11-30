window.Siorb = {}
window.Game =
  floatSpeed: 4
  defaultFloatSpeed: 4
  score: 0
  width : 800
  height : 420
  window: null
  start: ->
    Crafty.init @width, @height
    Crafty.load Siorb.Assets.list(), =>
      Siorb.Assets.load()
      @setupGlobals()
      @generatePlatforms()
      @generateCollectables()
  generatePlatforms: ->
    levels = [0, 0, 0, 1, 1, 2, 2, 3, 4, 5]

    for i in [0..10]
      level = levels[Utils.rand(0, levels.length)]
      yInterval = @height - @height/5 * level - 20
      xPos = @width/5 * i
      Crafty.e('Platform').at(xPos, yInterval)
  generateCollectables: ->
    x = Utils.rand( @width + 200, @width + 400)
    y = -500

    random = Math.random()

    if random < 0.6
      Crafty.e('Leaf').at(x,y)
    else if random < 0.9
      Crafty.e('Guarana').at(x,y)
    else
      Crafty.e('Mushroom').at(x,y)
    setTimeout =>
      @generateCollectables()
    , 1000
  setupGlobals: ->
    @window = document.getElementById('cr-stage')
    @window.style.backgroundPositionY = '850px'
    Game.runner = Crafty.e 'Runner'
    Game.view = Crafty.viewport
    Crafty.e 'BackgroundManager'
    Crafty.e 'ScoreBoard'
    Crafty.e 'GameObserver'
  timeouts:
    slowDown1: null
    slowDown2: null
    speedAnimation: null




