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
    @bind("Runner:jumpEffect", @playJumpEffect)
  playJumpEffect: ->
    if Game.runner._multijumpsLeft >=0
      Crafty.audio.play('jumpSound', 1, Game.volume*0.5)
  setLeafCollectEffect: ->
    @bind('Runner:collectedLeaf', ->
      Crafty.audio.play('leafSound', 1, Game.volume*0.5))
  setMrHotCollectEffect: ->
    @bind('Runner:collectedMrHot', ->
      Crafty.audio.stop('burnSound')
      Crafty.audio.play('burnSound', 1, Game.volume))
  setMrsCoffeeCollectEffects: ->
    @bind('Runner:collectedMrsCoffee', ->
      Crafty.audio.play('coffeeStartSound', 1, Game.volume))
    @bind('Coffee:speedUpEnded', ->
      Crafty.audio.play('coffeeEndSound', 1, Game.volume))

  init: ->
    @requires('Persist')
    @setInitialMute()
    @setJumpEffect()
    @setLeafCollectEffect()
    @setMrHotCollectEffect()
    @setMrsCoffeeCollectEffects()
    @bind('SceneChange', (data)->

      # music playing logic goes here
      if data.oldScene == null and data.newScene == 'MainMenu'
        @startMenuMusic()

      else if data.oldScene == 'MainMenu' and data.newScene == 'Gameplay'
        Crafty.audio.stop('mainMenu')
        Crafty.audio.play('gameplay', -1, Game.volume)

      else if data.oldScene == 'Gameplay' and data.newScene == 'GameOver'
        Crafty.audio.stop()
        Crafty.audio.play('gameOver', 1, 0.7)

      else if data.oldScene == 'GameOver' and data.newScene == 'Gameplay'
        Crafty.audio.stop('gameOver')
        Crafty.audio.play('gameplay', -1, Game.volume)
        Crafty.audio.play('gameplay', -1, Game.volume)

    )

    @bind('Runner:collectedGuarana', ->
      unless @mode == 'mushroom'
        @mode = 'guarana'
        Crafty.audio.pause('gameplay')
        Crafty.audio.stop('guaranaBeat')
        Crafty.audio.play('guaranaBeat', 1, Game.volume*1.1)
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
