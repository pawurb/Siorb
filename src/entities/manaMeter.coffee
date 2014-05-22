Crafty.c 'ManaMeter',
  init: ->
    @requires 'Base, spr_mana'
    @attr
      x: 700
      y: 100
      w: 75
      h: 75
      z: 300
      alpha: 0.6
    @bind('ScoreBoard:updatePoints', @updateYerbaLevel)

  updateYerbaLevel: ->
    manaLevel = if Game.score < 100
      parseInt(Game.score / 10)
    else
      10
    @sprite(0, manaLevel)


