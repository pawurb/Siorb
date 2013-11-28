Crafty.c 'ScoreBoard',
  init: ->
    @requires '2D, DOM, Text'
    @attr
      x: Game.width - 100
      y: Game.view.y + Game.runner.y
      w: 400
    @textFont
      type: 'italic'
      size: "20px"
      family: 'Arial'
    @text("Score: #{Game.score}")
    @bind('ScoreBoard:scorePoint', @updateScoreBoard)
    @bind("Runner:jump", (data) ->
      #center viewport on the runner
      @y = Game.runner.y + Game.view.y + data.y - 250)

  updateScoreBoard: ->
    @text("Score: #{Game.score}")



