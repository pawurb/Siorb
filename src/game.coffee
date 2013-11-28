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
    @window = document.getElementById('cr-stage')
    @window.style.backgroundPositionY = '900px'
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
    if Math.random() > 0.6
      Crafty.e('Leaf').at(500,0)
    else
      Crafty.e('Guarana').at(500,0)
    setTimeout =>
      @generateCollectables()
    , 2000
  setupGlobals: ->
    Game.runner = Crafty.e 'Runner'
    Game.view = Crafty.viewport
    Crafty.e 'BackgroundManager'
    Crafty.e 'ScoreBoard'
    Crafty.e 'GameObserver'




