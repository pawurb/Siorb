Crafty.c 'Runner',
  speedValue: 0
  jumpValue: 8
  backgroundX: 0
  gravityValue: 0.6
  init: ->
    @requires 'Base, Twoway, Gravity'
    @attr
      z: 299
    @attr
      x: 50
      y: Game.height/2
      w: 82
      h: 20
      z: 300
    @attach(Crafty.e 'RunnerImage' )
    @twoway(@speedValue, @jumpValue)
    @gravity('Solid')
    @gravityConst(@gravityValue)
    # @color('black')
    @bind("Move", ->
      if @_gy != 0 #if the runner changed his vertical position
        window.location.reload() if view.y < -1700 #game over if is too low
        Crafty.trigger "Runner:jump", #send data to backgroundAnimator
          gy: @_gy
          up: @_up
          jumpSpeed: @_jumpSpeed
          x: @x
          y: @y)
    @multijumps(2, @jumpValue, true)
    @bind('Collected', @handleCollected)
  at: (x, y) ->
    @attr
      x: x
      y: y
  handleCollected: (data) ->
    if data.name == 'guarana'
      Crafty.trigger('Platform:speedUp')
    else if data.name =='leaf'
      return

