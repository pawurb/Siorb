Crafty.c 'Collectable',
  init: ->
    @requires 'Base, Collision, Gravity, Floatable'
    @attr
      z: 301
    @gravity()
    @gravityConst(0.1)
    @onHit('Platform', (e) ->
      @antigravity())
    @onHit('RunnerImage', ->
      Crafty.trigger('Collected'
        name: @name)
      @destroy())
    setTimeout =>
      @destroy()
    , 7000









