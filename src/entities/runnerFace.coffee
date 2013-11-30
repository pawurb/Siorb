Crafty.c 'RunnerFace',
  init: ->
    @requires 'Base, SpriteAnimation, spr_face'
    @attr
      z: 299
    @move('e', 48)
    @move('s', 150)
    @reel('Face:normal', 400, 0, 0, 3)
    @animate('Face:normal', -1)
    @reel('Face:faster', 200, 0, 1, 3)
    @bind('Face:faster', @faceFaster)
    @bind('Face:normal', @faceNormal)
  faceNormal: ->
    @animate('Face:normal', -1))
  faceFaster: ->
    @animate('Face:faster', -1))






