Crafty.c 'Runner',
  speedValue: 1
  jumpValue: 12
  backgroundX: 0
  doubleJump: false
  init: ->
    @requires 'Base, Twoway, Gravity'
    @attr
      z: 299
    @color 'red'
    @attr
      x: 50
      y: Game.height/2
      w: 82
      h: 20
      z: 300
    @attach(Crafty.e 'RunnerImage' )
    @twoway(@speedValue, @jumpValue)
    @gravity('Solid')
    @gravityConst(0.7)
    @color('black')
    @bind("Move", ->
      if @_gy != 0 #if the runner changed his vertical position
        window.location.reload() if view.y < -1700 #game over if is too low
        Crafty.trigger "Runner:jump", #send data to backgroundAnimator
          gy: @_gy
          up: @_up
          jumpSpeed: @_jumpSpeed
          x: @x
          y: @y)
    @bind("KeyDown", (e) ->
      if (e.key == Crafty.keys.UP_ARROW || e.key == Crafty.keys.W || e.key == Crafty.keys.Z) && @doubleJump
        console.log 'tuta'
        @doubleJump = false
        @_gy -= @jumpValue
      else
        @doubleJump = true
      )
  at: (x, y) ->
    @attr
      x: x
      y: y

