window.Siorb.Models.Runner = Backbone.Model.extend
  defaults:
    width: 82
    height: 20
    speed: 5
    jumpSpeed: 12
  initialize: ->
    entity = Crafty.e "Base, Twoway, Gravity"
    entity
    .attr
      x: 50
      y: 50
      w: @get 'width'
      h: @get 'height'
      z: 300
    .attach(Crafty.e 'RunnerImage' )
    .twoway(@get('speed'), @get('jumpSpeed'))
    .gravity('Solid')
    .gravityConst(0.7)
    .color('black')
    window.dupa = -> entity
    @set 'entity', entity
