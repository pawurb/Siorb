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
        Crafty("DiscoText").destroy()

        setTimeout ->
          Crafty("BackgroundManager").destroy()
        , 1000

        setTimeout ->
          clearTimeout(Game.timeouts.speedAnimation) if Game.timeouts.speedAnimation
          clearTimeout(Game.timeouts.slowDown1) if Game.timeouts.slowDown1
          clearTimeout(Game.timeouts.slowDown2) if Game.timeouts.slowDown2
          Game.floatSpeed = Game.defaultFloatSpeed

          Game.runScene.gameOver()
        , 2500
    )

