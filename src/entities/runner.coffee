window.Siorb.Models.Runner = Backbone.Model.extend
  defaults:
    width: 40
    height: 40
    speed: 5
    jumpSpeed: 8
  initialize: ->
    entity = Crafty.e "Base, Twoway, Mouse, Gravity"
    entity
    .attr
      x: 50
      y: 50
      w: @get 'width'
      h: @get 'height'
      z: 300
    .twoway(@get('speed'), @get('jumpSpeed'))
    .gravity('Solid')
    .gravityConst(0.3)
    .color('rgb(0,0,0)')
    @set 'entity', entity
