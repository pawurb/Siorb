Crafty.c 'AudioManager',
  mode: 'normal'
  startGameplayMusic: ->
    setTimeout ->
      Crafty.audio.play('gameplay', -1, Game.volume)
    , 1000
  startMenuMusic: ->
    Crafty.audio.play('mainMenu', -1, Game.volume)
  setInitialMute: ->
    unless localStorage.getItem('muted')
      localStorage.setItem('muted', false)
    if Game.muted then Crafty.audio.mute() else Crafty.audio.unmute()
  init: ->
    @requires('Persist')
    @setInitialMute()
    @bind('SceneChange', (data)->

      # music playing logic goes here
      if data.oldScene == null and data.newScene == 'MainMenu'
        @startMenuMusic()

      else if data.oldScene == 'MainMenu' and data.newScene == 'Gameplay'
        Crafty.audio.stop('mainMenu')
        @startGameplayMusic()

      else if data.oldScene == 'Gameplay' and data.newScene == 'GameOver'
        Crafty.audio.stop()
        Crafty.audio.play('gameOver', 1, 0.7)

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
        Crafty.audio.play('guaranaBeat', 1, Game.volume)
    )

    @bind('Runner:collectedMrsCoffee', ->
      unless @mode == 'mushroom'
        @mode = 'coffee'
        Crafty.audio.stop('guaranaBeat')
        Crafty.audio.unpause('gameplay')
    )

    @bind('Runner:collectedMushroom', ->
      unless @mode == 'mushroom'
        @mode = 'mushroom'
        Crafty.audio.pause('gameplay')
        Crafty.audio.stop('guaranaBeat')
        Crafty.audio.play('mushroomBeat', 1, Game.volume)
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


