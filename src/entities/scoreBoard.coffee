Crafty.c 'ScoreBoard',
  init: ->
    @requires '2D, DOM, Text'
    @attr
      x: Game.width - 100
      y: view.y + runner.y
      w: 400
    @textFont
      type: 'italic'
      size: "20px"
      family: 'Arial'
    @text("Score: #{Game.score}")
    @bind('ScoreBoard:scorePoint', @updateScoreBoard)
    @bind("Runner:jump", (data) ->
      #center viewport on the runner
      @y = runner.y + view.y + data.y - 250)

  updateScoreBoard: ->
    @text("Score: #{Game.score}")



