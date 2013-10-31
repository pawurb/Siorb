window.Siorb = {}
window.Siorb.Model = {}

window.Siorb.Model.Game = Backbone.Model.extend
  defaults:
    width : 800
    height : 450
  initialize: ->
    Crafty.init @get('width'), @get('height')
    Crafty.load ["assets/background.jpg"], ->
      Crafty.background("url('assets/background.jpg')")
    console.log 'game initialized'


