Crafty.c 'SoundButton',
  init: ->
    @requires('Button, sound_button')
    @at(20, 10)
    @chooseSprite()

    $(@_element).on('click', =>
      Crafty.audio.toggleMute()
      @chooseSprite()
    )
  chooseSprite: ->
    spriteNumber = if Crafty.audio.muted then 0 else 1
    @sprite(spriteNumber, 0)

