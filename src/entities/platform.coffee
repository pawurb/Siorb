window.Siorb.Models.Platform = Backbone.Model.extend
  defaults: ->
    height: 10
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
    # .bind('EnterFrame', =>
    #   @set('floatLeft', false) if entity.x < -10
    #   @set('floatLeft', true) if entity.x > Game.get('width') - entity._w
    #   if @get 'floatLeft'
    #     entity.move('w', @get('speed'))
    #   else
    #     entity.y = Utils.rand 100, Game.get('height')
    #     entity.move('e', Game.get('width')))
    @set 'entity', entity
