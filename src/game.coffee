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
    for i in [0..7]
      yInterval = @height - @height/5 * i - 20
      xPos = @width/5 * i
      Crafty.e('Platform').at(xPos, yInterval)
  generateCollectables: ->
    x = Utils.rand( @width * 0.75, @width + 400)
    y = -500

    if Math.random() > 0.6
      Crafty.e('Leaf').at(x,y)
    else
      Crafty.e('Guarana').at(x,y)
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




