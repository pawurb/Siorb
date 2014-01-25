Crafty.c 'RunnerKiller',
  deathGrenzenY: 1800
  deathHappened: false
  init: ->
    @requires('Base, Collision')
    @attr
      x: 0
      y: @deathGrenzenY
      h: 200
      w: Game.width
    @onHit('RunnerImage', ->
      unless @deathHappened
        @deathHappened = true
        Crafty("ScoreBoard").destroy()
        Crafty("ManaMeter").destroy()
        Crafty("PsychoVision").destroy()

        setTimeout ->
          Crafty("BackgroundManager").destroy()
        , 1000

        setTimeout ->
          Crafty.scene('GameOver')
        , 2500
    )






