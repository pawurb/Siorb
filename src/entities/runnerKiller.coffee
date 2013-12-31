Crafty.c 'RunnerKiller',
  init: ->
    @requires('Base, Collision, Solid')
    @color('red')
    @attr
      x: 0
      y: 5800
      h: 5
      w: Game.width
    @onHit('RunnerImage', ->
      window.location.reload())






