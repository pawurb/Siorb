window.Siorb = {}
window.Siorb.Models = {}

window.Siorb.Models.Game = Backbone.Model.extend
  defaults:
    width : 800
    height : 450
  initialize: ->
    Crafty.init @get('width'), @get('height')
    Crafty.load ["assets/background.jpg"], ->
      Crafty.background("url('assets/background.jpg')")
    console.log 'game initialized'
    window.Runner = new Siorb.Models.Runner()
    new Siorb.Models.Platform(20, 30)
    new Siorb.Models.Platform(40, 30)
    new Siorb.Models.Platform(60, 30)


