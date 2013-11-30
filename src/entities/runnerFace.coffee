Crafty.c 'RunnerFace',
  init: ->
    @requires 'Base, SpriteAnimation, spr_face'
    @attr
      z: 299
    @move('e', 48)
    @move('s', 150)
    @reel('Runner:Runs', 400, 0, 0, 3)
    @animate('Runner:Runs', -1)






