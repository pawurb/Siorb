window.Siorb.Models.Platform = Backbone.Model.extend
  defaults: ->
    height: 10
    width: Utils.rand(20, 30) * 5
    speed: 2
    floatLeft: true
    z: 200
  initialize: (x, y) ->
    float = =>
      entity = @get 'entity'
      @set('floatLeft', false) if entity.x < -10
      @set('floatLeft', true) if entity.x > Game.get('width') - entity._w
      if @get 'floatLeft'
        entity.move('w', @get('speed'))
      else
        entity.y = Utils.rand 100, Game.get('height')
        entity.move('e', Game.get('width'))
        entity.attach(Crafty.e 'Leaf')
    entity = Crafty.e "Base, Solid"

    entity
    .attr
      h: @get 'height'
      w: @get 'width'
      z: @get 'z'
    .attach(Crafty.e 'Leaf')
    .color('rgb(0,255,255)')
    .at(x, y)
    .bind('EnterFrame', float)
    @set 'entity', entity


