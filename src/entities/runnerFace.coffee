Crafty.c 'RunnerFace',
  mode: 'normal'
  init: ->
    @requires 'Base, SpriteAnimation, spr_face'
    @attr
      z: 299
    @move('e', 48)
    @move('s', 148)
    @bind('Face:faster', @faceFaster)
    @bind('Face:normal', @faceNormal)
    @bind('Face:crazy', @faceCrazy)
    @bind('Face:stopCrazy', @faceStopCrazy)
    @bind('Face:falling', @faceFalling)
  faceNormal: ->
    @sprite(0, 0) unless @mode == 'crazy'
  faceFaster: ->
    @sprite(0, 0) unless @mode == 'crazy' #missing graphics
  faceCrazy: ->
    @mode = 'crazy'
    @sprite(0, 1)
  faceStopCrazy: ->
    @mode = 'normal'
    @sprite(0, 0)
  faceFalling: ->
    @sprite(0, 2) unless @mode == 'crazy'


