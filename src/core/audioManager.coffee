Crafty.c 'AudioManager',
  mute: true
  scene: null
  mode: 'normal'
  init: ->
    @requires('Persist')
    if @mute then Crafty.audio.mute() else Crafty.audio.unmute()

    @bind('SceneChange', (data)->
      # {oldScene: null , newScene: 'MainMenu'}

      # music playing logic goes here
      if data.oldScene == null and data.newScene == 'MainMenu'
        @scene = 'MainMenu'

        setTimeout -> # give some time for sounds to load
          Crafty.audio.play('mainMenu', -1, 0.5)
        , 2000

      else if data.oldScene == 'MainMenu' and data.newScene == 'Gameplay'
        @scene = 'Gameplay'

        Crafty.audio.stop('mainMenu')
        setTimeout -> # give some time for sounds to load
          Crafty.audio.play('gameplay', -1, 0.5)
        , 4000

      else if data.oldScene == 'Gameplay' and data.newScene == 'GameOver'
        @scene = 'GameOver'
        Crafty.audio.stop('gameplay')

      else if data.oldScene == 'GameOver' and data.newScene == 'Gameplay'
        @scene = 'Gameplay'

      else if data.oldScene == 'GameOver' and data.newScene == 'MainMenu'
        @scene = 'MainMenu'

    )

    @bind('Runner:collectedGuarana', ->

      console.log 'guaranabum'

    )

    @bind('Runner:collectedMushroom', ->

      console.log 'shroomy shroom'

    )

