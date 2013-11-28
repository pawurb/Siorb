Crafty.c 'Collectable',
  init: ->
    @requires 'Base, Collision, Gravity, Floatable'
    @attr
      z: 301
    @gravity()
    @onHit('Platform', (e) ->
      @antigravity())
    @onHit('RunnerImage', ->
      Crafty.trigger('Collected'
        name: @name)
      @destroy())









