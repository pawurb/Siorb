window.Siorb = {}
window.Game =
  floatSpeed: 3
  defaultFloatSpeed: 3
  score: 0
  width : 800
  height : 420
  window: null
  start: ->
    Crafty.init @width, @height
    @window = document.getElementById('cr-stage')
    @window.style.backgroundPositionY = '600px'
    Crafty.load Siorb.Assets.list(), =>
      Siorb.Assets.load()
      Game.runner = Crafty.e 'Runner'
      Game.view = Crafty.viewport
      window.platforms = []
      Crafty.e 'BackgroundManager'
      Crafty.e 'ScoreBoard'
      for i in [0..7]
        yInterval = @height - @height/5 * i - 20
        xPos = @width/5 * i
        platforms.push Crafty.e('Platform').at(xPos, yInterval)
      setInterval =>
        if Math.random() > 0.6
          Crafty.e('Leaf').at(500,0)
        else
          Crafty.e('Guarana').at(500,0)
      , 1000



