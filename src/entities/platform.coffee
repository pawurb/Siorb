window.Siorb.Models.Platform = Backbone.Model.extend
  defaults: ->
    height: 15
    width: Utils.rand(20, 30) * 5
    speed: 3
    floatLeft: true
    z: 200
  initialize: (x, y) ->
    entity = Crafty.e "Base, Solid"
    entity
    .attr
      h: @get 'height'
      w: @get 'width'
      z: @get 'z'
    .color('rgb(0,255,255)')
    .at(x, y)
    .bind('EnterFrame', =>
      @set('floatLeft', false) if entity.x < -20
      @set('floatLeft', true) if entity.x > Game.get('width') - entity._w
      if @get 'floatLeft'
        entity.move('w', @get('speed'))
      else
        entity.move('e', @get('speed')))
    @set 'entity', entity
