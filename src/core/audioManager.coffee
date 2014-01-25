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

      @mode = 'guarana'
      console.log 'guaranabum'

    )

    @bind('Runner:collectedMushroom', ->
      @mode = 'mushroom'

      console.log 'shroomy shroom'

    )

    @bind('Guarana:ended', ->
      console.log 'guarana end'
      Crafty.audio.stop('guaranaBeat')
      Crafty.audio.unpause('gameplay')
    )
    @bind('Mushroom:ended', ->
      console.log 'shroom finish'
      Crafty.audio.stop('mushroomBeat')
      Crafty.audio.unpause('gameplay')
    )


