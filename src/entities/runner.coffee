Crafty.c 'Runner',
  speedValue: 0
  jumpValue: 10
  backgroundX: 0
  gravityValue: 0.60
  scaredFaceVelocity: 40
  init: ->
    @requires 'Base, Twoway, Gravity'
    @attr
      x: 50
      y: Game.height/2
      w: 50
      h: 10
      z: 300
    @attach(Crafty.e 'RunnerBlush' )
    @attach(Crafty.e 'RunnerImage')
    @attach(Crafty.e 'RunnerFace')
    @attach(Crafty.e 'PsychoVision' )
    @attach(Crafty.e 'ComicCloud' )
    @attach(Crafty.e 'ComicSayings' )
    @twoway(@speedValue, @jumpValue)
    @gravity('Solid')
    @gravityConst(@gravityValue)
    # @color('black')
    @bind("Move", @runnerDidMove)
    @multijumps(2, @jumpValue/2, true)
    @bind('Collected', @handleCollected)
    @bind('Guarana:ended', ->
      @gravityConst(@gravityValue)
    )
    @bind('Runner:collectedMrsCoffee', ->
      @gravityConst(@gravityValue)
    )

  runnerDidMove: ->
    if @_gy != 0 #if the runner changed his vertical position

      Crafty.trigger('Face:falling') if @_gy > @scaredFaceVelocity
      Crafty.trigger 'Runner:falling' if @_gy > 20
      Crafty.trigger 'Runner:jump', #send data to backgroundAnimator
        gy: @_gy
        up: @_up
        jumpSpeed: @_jumpSpeed
        x: @x
        y: @y

  at: (x, y) ->
    @attr
      x: x
      y: y
  handleCollected: (data) ->
    if data.name == 'guarana'
      Crafty.trigger('Runner:collectedGuarana')
      @gravityConst(@gravityValue - 0.2)
    else if data.name == 'leaf'
      Crafty.trigger('Runner:collectedLeaf', {points: 1})
    else if data.name == 'mushroom'
      Crafty.trigger('Runner:collectedMushroom', {points: 1})
      Crafty.trigger('Runner:psychoVision')
    else if data.name == 'mrsCoffee'
      Crafty.trigger('Runner:collectedMrsCoffee')
    else if data.name == 'mrHot'
      Crafty.trigger('Runner:collectedMrHot')
