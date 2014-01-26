Crafty.c 'BlackMaskManager',
  fadeInMask: ->
    Crafty.e('BlackMask').isInvisible().show()
  fadeOutMask: ->
    Crafty.e('BlackMask').isVisible().hide()
  init: ->
    @requires('Persist')
    @bind('SceneChange', (data)->

      # mask showing logic
      if data.oldScene == null and data.newScene == 'MainMenu'
        @fadeOutMask()
      else if data.oldScene == 'MainMenu' and data.newScene == 'Gameplay'
        @fadeOutMask()
      else if data.oldScene == 'GameOver' and data.newScene == 'Gameplay'
        @fadeOutMask()
      else if data.oldScene == 'GameOver' and data.newScene == 'MainMenu'
        @fadeOutMask()
    )
    @bind('GameOver:started', ->
      @fadeOutMask()
    )



