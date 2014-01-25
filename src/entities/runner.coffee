Crafty.c 'Runner',
  speedValue: 0
  jumpValue: 10
  backgroundX: 0
  gravityValue: 0.60
  scaredFaceVelocity: 40
  init: ->
    @requires 'Base, Twoway, Gravity'
    @attr
      z: 299
    @attr
      x: 50
      y: Game.height/2
      w: 50
      h: 10
      z: 300
    @attach(Crafty.e 'RunnerImage')
    @attach(Crafty.e 'RunnerFace')
    @attach(Crafty.e 'PsychoVision' )
    @twoway(@speedValue, @jumpValue)
    @gravity('Solid')
    @gravityConst(@gravityValue)
    # @color('black')
    @bind("Move", ->
      if @_gy != 0 #if the runner changed his vertical position

        Crafty.trigger('Face:falling') if @_gy > @scaredFaceVelocity
        Crafty.trigger 'Runner:falling' if @_gy > 20
        Crafty.trigger 'Runner:jump', #send data to backgroundAnimator
          gy: @_gy
          up: @_up
          jumpSpeed: @_jumpSpeed
          x: @x
          y: @y)
    @multijumps(2, @jumpValue/2, true)
    @bind('Collected', @handleCollected)
  at: (x, y) ->
    @attr
      x: x
      y: y
  handleCollected: (data) ->
    if data.name == 'guarana'
      Crafty.trigger('Runner:collectedGuarana')
      Crafty.audio.pause('gameplay')
      Crafty.audio.stop('guaranaBeat')
      Crafty.audio.stop('mushroomBeat')
      Crafty.audio.play('guaranaBeat', 1, 0.5)
      @gravityConst(@gravityValue - 0.2)
      setTimeout =>
        @gravityConst(@gravityValue)
      , 2000
    else if data.name == 'leaf'
      Crafty.trigger('Runner:collectedLeaf')
    else if data.name == 'mushroom'
      Crafty.trigger('Runner:collectedMushroom')
      Crafty.audio.pause('gameplay')
      Crafty.audio.stop('mushroomBeat')
      Crafty.audio.stop('guranaBeat')
      Crafty.audio.play('mushroomBeat', 1, 0.5)
      Crafty.trigger('Runner:psychoVision')
