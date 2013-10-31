window.Siorb.Models.Runner = Backbone.Model.extend
  defaults:
    width: 50
    height: 50
    speed: 5
    jumpSpeed: 8
  initialize: ->
    entity = Crafty.e "Base, Twoway, Mouse, Gravity, Collision"

    entity
    .attr
      x: 50
      y: 50
      w: @get 'width'
      h: @get 'height'
      z: 300
    .twoway(@get('speed'), @get('jumpSpeed'))
    .gravity()
    .gravityConst(0.3)
    .color('rgb(0,0,0)')
    .onHit('Solid', ->
      if (entity.hit('Solid')[0].obj._y + 8) > (entity.y + entity.h)
        entity.stopFalling()
        entity.gravityConst(0)
    , ->
      entity.gravityConst(0.3))
    .bind('NewDirection', (e)->
      console.log e)
    @set 'entity', entity
