window.Siorb = {}
window.Game =
  width : 800
  height : 420
  window: null
  start: ->
    Crafty.init @width, @height
    @window = document.getElementById('cr-stage')
    Crafty.load Siorb.Assets.list(), =>
      Siorb.Assets.load()
      window.runner = Crafty.e 'Runner'
      window.view = Crafty.viewport
      Crafty.e 'BackgroundManager'
      for i in [0..7]
        yInterval = @height - @height/5 * i - 20
        xPos = @width/5 * i
        Crafty.e('Platform').at(xPos, yInterval)


