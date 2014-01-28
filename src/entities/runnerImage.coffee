Crafty.c 'RunnerImage',
  mode: 'normal'
  init: ->
    @requires 'Base, SpriteAnimation, spr_runner'
    @attr
      z: 299
    @move('e', 25)
    @move('s', 148)
    @reel('Runner:Runs', 300, 0, 0, 3)
    @reel('Runner:RunsFaster', 150, 0, 0, 3)
    @animate('Runner:Runs', -1)
    @bind('hitGround', @groundHitPose)
    @bind('Runner:collectedGuarana', @runFasterGuarana)
    @bind('Runner:collectedMrsCoffee', @runFasterCoffee)
  groundHitPose: ->
    @resumeAnimation()
    @bind('Runner:falling', @fallingPose)
    if @mode == 'normal'
      @bind("Runner:jump", @jumpPose)
      Crafty.trigger('Face:normal')
      @animate('Runner:Runs', -1)
  fallingPose: ->
    @unbind('Runner:falling')
    @animate('Runner:RunsFaster', -1)
  jumpPose: ->
    if @mode == 'normal'
      @pauseAnimation()
      @sprite(0, 1)
      @unbind("Runner:jump")
  runFasterGuarana: ->
    Crafty.trigger('Face:fasterGuarana')
    @runFasterAnimation()

  runFasterCoffee: ->
    Crafty.trigger('Face:fasterCoffee')
    @runFasterAnimation()

  runFasterAnimation: ->
    @animate('Runner:RunsFaster', -1)
    @mode = 'fast'

    clearTimeout(Game.timeouts.speedAnimation) if Game.timeouts.speedAnimation
    Game.timeouts.speedAnimation = setTimeout =>
      @mode = 'normal'
      Crafty.trigger('Face:normal')
      @animate('Runner:Runs', -1)
    , Game.guaranaDuration








