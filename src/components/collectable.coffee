Crafty.c 'Collectable',
  init: ->
    @requires 'Base, Collision, Floatable'
    @attr
      z: 301
    @onHit('RunnerImage', ->
      Crafty.trigger('Collected'
        name: @name)
      @destroy())
    setTimeout =>
      @destroy()
    , 4000









