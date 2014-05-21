Crafty.c 'DiscoText',
  delay: 2000
  init: ->
    @requires 'Base, SpriteAnimation, spr_disco_text'
    @attr
      x: Game.width/2 - 200
      y: Game.view.y + Game.runner.y
      z: 310
    @reel('DiscoText:Blinks', 500, [[0,0], [0,1]])
    @bind("Runner:jump", (data) ->
      #always display in the same screen place
      @y = Game.runner.y + Game.view.y + data.y - 100)
    #change to attach ??
    @animate('DiscoText:Blinks', -1)

    setTimeout =>
      @destroy()
    , 10000



