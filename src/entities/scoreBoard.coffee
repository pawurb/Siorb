Crafty.c 'ScoreBoard',
  init: ->
    @requires '2D, DOM, Text'
    @attr
      x: 737
      y: 135
      w: 400
      z: 301
    @textFont
      type: 'italic'
      size: "20px"
      family: 'Arial'
    @text("#{Game.score}")
    @bind('ScoreBoard:updatePoints', @updateScoreBoard)

  updateScoreBoard: ->
    @text("#{Game.score}")
