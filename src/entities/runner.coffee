window.Siorb.Models.Runner = Backbone.Model.extend
  defaults:
    width: 50
    height: 50
    speed: 5
  initialize: ->
    entity = Crafty.e "Base, Fourway, Mouse, Gravity"

    entity
    .attr
      x: 50
      y: 50
      w: @get 'width'
      h: @get 'height'
      z: 300
    .fourway(@get 'speed')
    .color('rgb(0,0,0)')
    .gravity()
    @set 'entity', entity
