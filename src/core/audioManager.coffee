Crafty.c 'AudioManager',
  mute: true
  mode: 'normal'
  startGameplayMusic: ->
    Crafty.audio.play('gameplay', -1, 0.5)
  startMenuMusic: ->
    Crafty.audio.play('mainMenu', -1, 0.5)
  init: ->
    @requires('Persist')
    if @mute then Crafty.audio.mute() else Crafty.audio.unmute()

    @bind('SceneChange', (data)->

      # music playing logic goes here
      if data.oldScene == null and data.newScene == 'MainMenu'
        @startMenuMusic()

      else if data.oldScene == 'MainMenu' and data.newScene == 'Gameplay'
        Crafty.audio.stop('mainMenu')
        @startGameplayMusic()

      else if data.oldScene == 'Gameplay' and data.newScene == 'GameOver'
        Crafty.audio.stop()

      else if data.oldScene == 'GameOver' and data.newScene == 'Gameplay'
        @startGameplayMusic()

      else if data.oldScene == 'GameOver' and data.newScene == 'MainMenu'
        @startMenuMusic()
    )

    @bind('Runner:collectedGuarana', ->
      unless @mode == 'mushroom'
        @mode = 'guarana'
        Crafty.audio.pause('gameplay')
        Crafty.audio.stop('guaranaBeat')
        Crafty.audio.play('guaranaBeat', 1, 0.5)
    )

    @bind('Runner:collectedMushroom', ->
      unless @mode == 'mushroom'
        @mode = 'mushroom'
        Crafty.audio.pause('gameplay')
        Crafty.audio.stop('guaranaBeat')
        Crafty.audio.play('mushroomBeat', 1, 0.5)
    )

    @bind('Guarana:ended', ->
      unless @mode == 'mushroom'
        @mode = 'normal'
        Crafty.audio.stop('guaranaBeat')
        Crafty.audio.unpause('gameplay')
    )
    @bind('Mushroom:ended', ->
      @mode = 'normal'
      Crafty.audio.stop('mushroomBeat')
      Crafty.audio.unpause('gameplay')
    )


