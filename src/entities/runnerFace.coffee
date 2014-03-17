Crafty.c 'RunnerFace',
  mode: 'normal'
  init: ->
    @requires 'Base, SpriteAnimation, spr_face'
    @attr
      z: 299
    @move('e', 23)
    @move('s', 148)
    @bind('Face:fasterGuarana', @faceFasterGuarana)
    @bind('Face:fasterCoffee', @faceFasterCoffee)
    @bind('Face:slowerCoffee', @faceSlowerCoffee)
    @bind('Face:normal', @faceNormal)
    @bind('Face:crazy', @faceCrazy)
    @bind('Face:stopCrazy', @faceStopCrazy)
    @bind('Face:falling', @faceFalling)
    @bind('Siorb:victory', @handleVictoryFace)
  faceNormal: ->
    @sprite(0, 0)
  faceFasterGuarana: ->
    @sprite(0, 3)
  faceFasterCoffee: ->
    @sprite(0, 5)
  faceSlowerCoffee: ->
    @sprite(0, 4)
  faceFalling: ->
    @sprite(0, 2)
  faceCrazy: ->
    @unbind('Face:normal', @faceNormal)
    @unbind('Face:fasterGuarana', @faceFasterGuarana)
    @unbind('Face:fasterCoffee', @faceFasterCoffee)
    @unbind('Face:slowerCoffee', @faceSlowerCoffee)

    unless @mode == 'victory'
      @mode = 'crazy'
      @sprite(0, 1)
  faceStopCrazy: ->
    @bind('Face:normal', @faceNormal)
    @bind('Face:fasterGuarana', @faceFasterGuarana)
    @bind('Face:fasterCoffee', @faceFasterCoffee)
    @bind('Face:slowerCoffee', @faceSlowerCoffee)

    @mode = 'normal'
    @sprite(0, 0)
  handleVictoryFace: ->
    @unbind('Face:normal', @faceNormal)
    @unbind('Face:fasterGuarana', @faceFasterGuarana)
    @unbind('Face:fasterCoffee', @faceFasterCoffee)
    @unbind('Face:slowerCoffee', @faceSlowerCoffee)
    @unbind('Face:crazy', @faceCrazy)
    @unbind('Face:stopCrazy', @faceStopCrazy)
    @mode = 'victory'
    @sprite(0, 3)
