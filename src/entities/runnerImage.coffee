Crafty.c 'RunnerImage',
  mode: 'normal'
  init: ->
    @requires '2D, DOM, Color, SpriteAnimation, spr_runner'
    @attr
      z: 299
    # @color 'red'
    @move('e', 50)
    @move('s', 148)
    @reel('Runner:Runs', 400, 0, 0, 3)
    @reel('Runner:RunsFaster', 150, 0, 0, 3)
    @animate('Runner:Runs', -1)
    @bind("Runner:jump", @jumpPose)
    @bind('hitGround', ->
      @resumeAnimation()
      @bind("Runner:jump", @jumpPose) if @mode == 'normal')
    @bind('Runner:collectedGuarana', @runFaster)
  jumpPose: ->
    if @mode == 'normal'
      @pauseAnimation()
      @sprite(0,1)
      @unbind("Runner:jump")
  runFaster: ->
    @animate('Runner:RunsFaster', -1)
    @mode = 'fast'

    clearTimeout(Game.timeouts.speedAnimation) if Game.timeouts.speedAnimation
    Game.timeouts.speedAnimation = setTimeout =>
      @mode = 'normal'
      @animate('Runner:Runs', -1)
    , 3000







