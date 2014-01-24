Crafty.c 'BackgroundManager',
  init: ->
    console.log 'hallo audio'

    @bind("Game:started", ->
      console.log 'started'
      )

