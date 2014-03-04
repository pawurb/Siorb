Crafty.c 'GameplayShortcuts',
  spaceCode: 32
  init: ->
    @requires 'Recyclable, Keyboard, Mouse'
    @bind('KeyDown', (keystroke) ->
      if keystroke.keyCode == @spaceCode
        @makeRunnerJump()
    )

    $('#cr-stage').on("click", (data) =>
      @makeRunnerJump()
      Crafty.trigger('Runner:jumpEffect')
    )

  makeRunnerJump: ->
    keystrokeData =
      key: 38
    Crafty.trigger("KeyDown", keystrokeData)


