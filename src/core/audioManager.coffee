Crafty.c 'AudioManager',
  mode: 'normal'
  canPlayJump: true
  startMenuMusic: ->
    Crafty.audio.play('mainMenu', -1, Game.volume)
    false
  setInitialMute: ->
    unless localStorage.getItem('muted')
      localStorage.setItem('muted', false)
    if Game.muted then Crafty.audio.mute() else Crafty.audio.unmute()
  setJumpEffect: ->
    $(document).bind('keydown', (e) =>
      if (e.keyCode == 38 || e.keyCode == 32) and @canPlayJump
        @playJumpEffect()
        @canPlayJump = false
    )
    $(document).bind('keyup', (e) =>
      @canPlayJump = true
    )
  playJumpEffect: ->
    if Game.runner && Game.runner._multijumpsLeft >= 0
      Crafty.audio.play('jumpSound', 1, Game.volume*0.5)
  playLeafEffect: ->
    Crafty.audio.play('leafSound', 1, Game.volume*0.5)
  playBurnEffect: ->
    Crafty.audio.stop('burnSound')
    Crafty.audio.play('burnSound', 1, Game.volume)
  playCoffeeStartEffect: ->
    Crafty.audio.play('coffeeStartSound', 1, Game.volume)
    unless @mode == 'mushroom'
      @mode = 'coffee'
      Crafty.audio.stop('guaranaBeat')
      Crafty.audio.unpause('gameplay')
  playCoffeeEndEffect: ->
    Crafty.audio.play('coffeeEndSound', 1, Game.volume)
  playMushroomStartEffect: ->
    if @mode == 'mushroom' || @mode == 'victory'
      Crafty.audio.play('mushroomCollect')
    else
      @mode = 'mushroom'
      Crafty.audio.pause('gameplay')
      Crafty.audio.stop('guaranaBeat')
      Crafty.audio.play('mushroomBeat', 1, Game.volume)

  playMushroomEndEffect: ->
    @mode = 'normal'
    Crafty.audio.stop('mushroomBeat')
    Crafty.audio.unpause('gameplay')

  playGuaranaStartEffect: ->
    if @mode == 'mushroom' || @mode == 'victory'
      Crafty.audio.play('guaranaCollect', 1, Game.volume*1.1)
    else
      @mode = 'guarana'
      Crafty.audio.pause('gameplay')
      Crafty.audio.stop('guaranaBeat')
      Crafty.audio.play('guaranaBeat', 1, Game.volume*1.1)

  playGuaranaEndEffect: ->
    unless @mode == 'mushroom'
      @mode = 'normal'
      Crafty.audio.stop('guaranaBeat')
      Crafty.audio.unpause('gameplay')

  init: ->
    @requires('Persist')
    @setInitialMute()
    @setJumpEffect()

    @bind('Runner:collectedLeaf', @playLeafEffect)
    @bind('Runner:collectedMrHot', @playBurnEffect)
    @bind('Runner:collectedMrsCoffee', @playCoffeeStartEffect)
    @bind('Coffee:speedUpEnded', @playCoffeeEndEffect)
    @mode = 'normal'

    @bind('SceneChange', (data) ->

      if data.newScene == 'Gameplay'
        @unbind('Runner:collectedMushroom', @playMushroomStartEffect)
        @unbind('Runner:collectedGuarana', @playGuaranaStartEffect)
        @unbind('Guarana:ended', @playGuaranaEndEffect)
        @unbind('Mushroom:ended', @playMushroomEndEffect)

        @bind("Runner:jumpEffect", @playJumpEffect)
        @bind('Runner:collectedGuarana', @playGuaranaStartEffect)
        @bind('Guarana:ended', @playGuaranaEndEffect)
        @bind('Runner:collectedMushroom', @playMushroomStartEffect)
        @bind('Mushroom:ended', @playMushroomEndEffect)

        @mode = 'normal'

      # music playing logic goes here
      if data.oldScene == null and data.newScene == 'MainMenu'
        @startMenuMusic()

      else if data.oldScene == 'MainMenu' and data.newScene == 'Gameplay'

        Crafty.audio.stop('mainMenu')
        Crafty.audio.play('gameplay', -1, Game.volume)

      else if data.oldScene == 'Gameplay' and data.newScene == 'GameOver'
        @unbind("Runner:jumpEffect", @playJumpEffect)
        Crafty.audio.stop('gameplay')
        Crafty.audio.stop('mushroomBeat')
        Crafty.audio.stop('guaranaBeat')
        Crafty.audio.stop('victoryBeat')
        Crafty.audio.play('gameOver', 1, 0.7)

      else if data.oldScene == 'GameOver' and data.newScene == 'Gameplay'
        Crafty.audio.stop('gameOver')
        Crafty.audio.play('gameplay', -1, Game.volume)
        Crafty.audio.play('gameplay', -1, Game.volume)
    )

    @bind('Siorb:victory', ->
      # @unbind('Runner:collectedMushroom')
      # @unbind('Runner:collectedGuarana')
      @mode = 'victory'

      @unbind('Guarana:ended', @playGuaranaEndEffect)
      @unbind('Mushroom:ended', @playMushroomEndEffect)
      Crafty.audio.stop()
      Crafty.audio.play('victoryBeat', -1, Game.volume)
    )
