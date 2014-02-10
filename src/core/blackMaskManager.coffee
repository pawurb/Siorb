Crafty.c 'BlackMaskManager',
  fadeInMask: ->
    Crafty.e('BlackMask').isInvisible().show()
  fadeOutMask: ->
    Crafty.e('BlackMask').isVisible().hide()
  init: ->
    @requires('Persist')
    @bind('SceneChange', (data)->

      # mask showing logic, not always work with scene schange event and have to trigger custom ones
      if data.oldScene == null and data.newScene == 'MainMenu'
        @fadeOutMask()
      else if data.oldScene == 'GameOver' and data.newScene == 'MainMenu'
        @fadeOutMask()
    )
    @bind('Game:gameOverStarted', ->
      @fadeOutMask()
    )

    @bind('Game:gameplayStarted', ->
      @fadeOutMask()
    )
