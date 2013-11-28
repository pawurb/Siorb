Crafty.c 'Guarana',
  init: ->
    @requires 'Base, Collision'
    @attr
      w: 30
      h: 50
      z: 302
    @move 'e', 50
    @move 'n', 60
    @color('red')
    @onHit('spr_runner', ->
      Crafty.trigger 'Collected',
        name: 'guarana'
      @destroy())
