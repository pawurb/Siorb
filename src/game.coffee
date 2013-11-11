window.Siorb = {}
window.Siorb.Models = {}

window.Game =
  width : 800
  height : 420
  start: ->
    Crafty.init @width, @height
    Crafty.load Siorb.Assets.list(), =>
      Siorb.Assets.load()
      window.Runner = Crafty.e 'Runner'
      for i in [0..7]
        yInterval = @height - @height/5 * i - 20
        xPos = @width/5 * i
        Crafty.e('Platform').at(xPos, yInterval)


