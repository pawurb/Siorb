Crafty.c 'ManaMeter',
  init: ->
    @requires 'Base, spr_mana'
    @attr
      x: Game.width - 100
      y: Game.view.y + Game.runner.y
      w: 75
      h: 75
      z: 300
      alpha: 0.6
    @bind('ScoreBoard:updatePoints', @updateYerbaLevel)
    @bind("Runner:jump", (data) ->
      #always display in the same screen place
      @y = Game.runner.y + Game.view.y + data.y - 250)

  updateYerbaLevel: ->
    manaLevel = if Game.score < 100
      parseInt(Game.score / 10)
    else
      10
    @sprite(0, manaLevel)


