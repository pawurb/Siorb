Crafty.c 'NiceText',
  lifetime: 3000
  init: ->
    @requires 'Base, SpriteAnimation, spr_nice_text'
    @attr
      x: 310
      y: Game.runner.y + 50
      z: 310
    @reel('NiceText:Blinks', 500, [[0,0], [0,1]])
    @animate('NiceText:Blinks', -1)
    setTimeout =>
      @destroy()
    , @lifetime



