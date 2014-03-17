Crafty.c 'ScoreBoard',
  init: ->
    @requires '2D, DOM, Text'
    @attr
      x: Game.width - 69
      y: Game.view.y + Game.runner.y
      w: 400
      z: 301
    @textFont
      type: 'italic'
      size: "20px"
      family: 'Arial'
    @text("#{Game.score}")
    @bind('ScoreBoard:updatePoints', @updateScoreBoard)
    @bind("Runner:jump", (data) ->
      #always display in the same screen place
      @y = Game.runner.y + Game.view.y + data.y - 215)

  updateScoreBoard: ->
    @text("#{Game.score}")
