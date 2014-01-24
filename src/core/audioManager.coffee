Crafty.c 'AudioManager',
  mute: true
  init: ->
    @requires('Persist')
    if @mute then Crafty.audio.mute() else Crafty.audio.unmute()
    @bind("Game:initialized", ->
    setTimeout -> # give some time for sounds to load
      Crafty.audio.play('mainMenu', -1, 0.5)
    , 1000

    )

    @bind("Game:gameplay", ->
      Crafty.audio.stop()
      setTimeout -> # give some time for sounds to load
        Crafty.audio.play('gameplay', -1, 0.5)
      , 1000

    )
    @bind("SceneChange", (data)->
      #music playing logic goes hereeee
      # {oldScene: , newScene: 'duap'}
      console.log data
    )

