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
  faceNormal: ->
    @sprite(0, 0) unless @mode == 'crazy'
  faceFasterGuarana: ->
    @sprite(0, 3) unless @mode == 'crazy'
  faceFasterCoffee: ->
    @sprite(0, 5) unless @mode == 'crazy'
  faceSlowerCoffee: ->
    @sprite(0, 4) unless @mode == 'crazy'
  faceCrazy: ->
    @mode = 'crazy'
    @sprite(0, 1)
  faceStopCrazy: ->
    @mode = 'normal'
    @sprite(0, 0)
  faceFalling: ->
    @sprite(0, 2) unless @mode == 'crazy'


