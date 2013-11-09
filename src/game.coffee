window.Siorb = {}
window.Siorb.Models = {}

window.Siorb.Models.Game = Backbone.Model.extend
  defaults:
    width : 800
    height : 250
  initialize: ->
    Crafty.init @get('width'), @get('height')
    Crafty.load Siorb.Assets.list(), =>
      Siorb.Assets.load()
      window.Runner = new Siorb.Models.Runner()
      window.Pool = new Siorb.Models.PlatformsPool()
      for i in [0..7]
        yInterval = @get('height') - @get('height')/5 * i - 20
        xPos = @get('width')/5 * i
        Pool.add(new Siorb.Models.Platform(xPos, yInterval))
      window.Leaf = new Siorb.Models.Leaf(10,10)


