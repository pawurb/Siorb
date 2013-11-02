window.Siorb.Models.Runner = Backbone.Model.extend
  defaults:
    width: 82
    height: 90
    speed: 5
    jumpSpeed: 12
  initialize: ->
    entity = Crafty.e "Base, Twoway, Gravity, spr_runner"
    entity
    .attr
      x: 50
      y: 50
      w: @get 'width'
      h: @get 'height'
      z: 300
    .twoway(@get('speed'), @get('jumpSpeed'))
    .gravity('Solid')
    .gravityConst(0.7)
    window.dupa = -> entity
    @set 'entity', entity
