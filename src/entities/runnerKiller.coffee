Crafty.c 'RunnerKiller',
  deathGrenzenY: 5800
  init: ->
    @requires('Base, Collision, Solid')
    @color('red')
    @attr
      x: 0
      y: @deathGrenzenY
      h: 5
      w: Game.width
    @onHit('RunnerImage', ->
      window.location.reload())






