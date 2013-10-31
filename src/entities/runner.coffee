window.Siorb.Models.Runner = window.Siorb.Models.BaseEntity.extend(
  defaults:
    width: 50
    height: 50
    speed: 5
  initialize: ->
    model = @
    entity = Crafty.e "2D, DOM, Color, Fourway, Mouse"

    entity
    .attr
      x: 50
      y: 50
      w: @get 'width'
      h: @get 'height'
      z: 300
    .fourway(@get 'speed')
    .color('rgb(0,0,0)')
    .bind "Click", ->
      console.log 'runner clicked'

    model.set 'entity', entity
)