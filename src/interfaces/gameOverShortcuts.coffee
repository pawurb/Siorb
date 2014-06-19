Crafty.c 'GameOverShortcuts',
  enterCode: 13
  shiftCode: 16
  escCode: 27
  init: ->
    @requires 'Recyclable, Keyboard'
    @bind('KeyDown', (keystroke)->
      if keystroke.keyCode == @enterCode || keystroke.keyCode == @shiftCode
        if Game.victory
          @backToMenu()
        else
          Game.runScene.gameplay()
      else if keystroke.keyCode == @escCode
        @backToMenu()
    )
  backToMenu: ->
    setTimeout ->
      window.location.reload()
    , 20 #to make it work on Firefox


