window.Siorb.Models.Platform = Backbone.Model.extend
  defaults:
    width:  50
    height: 10
  initialize: (x, y) ->
    entity = Crafty.e "Base"
    console.log 'działa'
    entity
    .attr
      w: Utils.rand(10, 30) * 5
      h: @get 'height'
      z: 300
    .color('rgb(0,255,255)')
    .at(x, y)
    @set 'entity', entity
