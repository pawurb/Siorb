Crafty.c 'GameOverShortcuts',
  enterCode: 13
  shiftCode: 16
  escCode: 27
  init: ->
    @requires 'Recyclable, Keyboard'
    @bind('KeyDown', (keystroke)->
      if keystroke.keyCode == @enterCode || keystroke.keyCode == @shiftCode
        if Game.victory
          window.location.reload()
        else
          Game.runScene.gameplay()
      else if keystroke.keyCode == @escCode
        window.location.reload()
    )


