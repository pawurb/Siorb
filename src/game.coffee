window.Siorb = {}
window.Game =
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
        Crafty.e('Leaf').at(500,0)
      , 1000



