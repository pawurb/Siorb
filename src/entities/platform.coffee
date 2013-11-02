window.Siorb.Models.Platform = Backbone.Model.extend
  defaults:
    width:  50
    height: 15
  initialize: (x, y) ->
    entity = Crafty.e "Base, Solid"
    entity
    .attr
      w: Utils.rand(30, 50) * 5
      h: @get 'height'
      z: 200
    .color('rgb(0,255,255)')
    .at(x, y)
    @set 'entity', entity
