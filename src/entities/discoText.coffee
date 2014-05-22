Crafty.c 'DiscoText',
  delay: 2000
  init: ->
    @requires 'Base, SpriteAnimation, spr_disco_text'
    @attr
      x: 210
      y: Game.runner.y + 50
      z: 310
    @reel('DiscoText:Blinks', 500, [[0,0], [0,1]])
    @animate('DiscoText:Blinks', -1)
    setTimeout =>
      @destroy()
    , 10000



