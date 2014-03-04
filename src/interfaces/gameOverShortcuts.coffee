Crafty.c 'GameOverShortcuts',
  enterCode: 13
  escCode: 27
  init: ->
    @requires 'Recyclable, Keyboard'
    @bind('KeyDown', (keystroke)->
      if keystroke.keyCode == @enterCode
        Game.runScene.gameplay()
      else if keystroke.keyCode == @escCode
        Game.runScene.mainMenu()
    )


