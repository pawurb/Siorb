window.Siorb.Models.Leaf = Backbone.Model.extend
  defaults: ->
    height: 30
    width: 30
    z: 200
  initialize: (x, y) ->
    model = @
    entity = Crafty.e "Base, Solid, Collision"
    entity
    .attr
      h: @get 'height'
      w: @get 'width'
      z: @get 'z'
    .color('rgb(0,255,0)')
    .at(x, y)
    .onHit('spr_runner', ->
      entity.destroy())
    @set 'entity', entity
