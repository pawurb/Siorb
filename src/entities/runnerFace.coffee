Crafty.c 'RunnerFace',
  mode: 'normal'
  init: ->
    @requires 'Base, SpriteAnimation, spr_face'
    @attr
      z: 299
    @move('e', 48)
    @move('s', 148)
    @reel('Face:normal', 400, 0, 0, 3)
    @reel('Face:faster', 200, 0, 1, 3)
    @reel('Face:crazy', 200, 0, 2, 3)
    @animate('Face:normal', -1)
    @bind('Face:faster', @faceFaster)
    @bind('Face:normal', @faceNormal)
    @bind('Face:crazy', @faceCrazy)
    @bind('Face:stopCrazy', @faceStopCrazy)
    @bind('Face:falling', @faceFalling)
  faceNormal: ->
    @animate('Face:normal', -1) unless @mode == 'crazy'
  faceFaster: ->
    @animate('Face:faster', -1) unless @mode == 'crazy'
  faceCrazy: ->
    @mode = 'crazy'
    @animate('Face:crazy', -1)
  faceStopCrazy: ->
    @mode = 'normal'
    @animate('Face:normal', -1)
  faceFalling: ->
    return #missing graphics


