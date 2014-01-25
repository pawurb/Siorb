Crafty.c 'AudioManager',
  mute: true
  scene: null
  mode: 'normal'
  delay: 2000
  startGameplayMusic: ->
    setTimeout =>
      Crafty.audio.play('gameplay', -1, 0.5)
    , @delay
  startMenuMusic: ->
    setTimeout =>
      Crafty.audio.play('mainMenu', -1, 0.5)
    , @delay
  init: ->
    @requires('Persist')
    if @mute then Crafty.audio.mute() else Crafty.audio.unmute()

    @bind('SceneChange', (data)->

      # music playing logic goes here
      if data.oldScene == null and data.newScene == 'MainMenu'
        @scene = 'MainMenu'
        @startMenuMusic()

      else if data.oldScene == 'MainMenu' and data.newScene == 'Gameplay'
        @scene = 'Gameplay'

        Crafty.audio.stop('mainMenu')
        @startGameplayMusic()

      else if data.oldScene == 'Gameplay' and data.newScene == 'GameOver'
        @scene = 'GameOver'
        Crafty.audio.stop()

      else if data.oldScene == 'GameOver' and data.newScene == 'Gameplay'
        @scene = 'Gameplay'
        @startGameplayMusic()

      else if data.oldScene == 'GameOver' and data.newScene == 'MainMenu'
        @scene = 'MainMenu'
        @startMenuMusic()

    )

    @bind('Runner:collectedGuarana', ->
      if @mode == 'normal'
        @mode = 'guarana'
        Crafty.audio.pause('gameplay')
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


