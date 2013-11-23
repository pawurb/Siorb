Crafty.c 'RunnerImage',
  init: ->
    @requires '2D, DOM, Color, SpriteAnimation, spr_runner'
    @attr
      z: 299
    # @color 'red'
    @move('e', 50)
    @move('s', 155)
    @reel('Runner:Runs', 400, 0, 0, 3)
    @animate('Runner:Runs', -1)
    @bind("Runner:jump", @jumpPose)
    @bind('hitGround', ->
      @resumeAnimation()
      @bind("Runner:jump", @jumpPose))
  jumpPose: ->
    @pauseAnimation()
    @sprite(3,2)
    @unbind("Runner:jump")





