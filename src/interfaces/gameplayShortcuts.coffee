Crafty.c 'GameplayShortcuts',
  spaceCode: 32
  init: ->
    @requires 'Recyclable, Keyboard, Mouse'
    @bind('KeyDown', (keystroke) ->
      if keystroke.keyCode == @spaceCode
        @makeRunnerJump()
      true
    )

    $('#game').on("click", (data) =>
      Crafty.trigger('Runner:jumpEffect')
      @makeRunnerJump()
    )

  makeRunnerJump: ->
    keystrokeData =
      key: 38
    Crafty.trigger("KeyDown", keystrokeData)


