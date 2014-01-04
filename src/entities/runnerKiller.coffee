Crafty.c 'RunnerKiller',
  deathGrenzenY: 5800
  init: ->
    @requires('Base, Collision')
    @attr
      x: 0
      y: @deathGrenzenY
      h: 80
      w: Game.width
    @onHit('RunnerImage', ->
      Game.runScene.mainMenu())






