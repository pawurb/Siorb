Crafty.c 'SoundButton',
  init: ->
    @requires('Button, sound_button')
    @at(5, 5)
    @chooseSprite()

    $(@_element).on('click', =>
      Crafty.audio.toggleMute()
      @chooseSprite()
      if localStorage.getItem('muted') == 'false'
        localStorage.setItem('muted', true)
      else
        localStorage.setItem('muted', false)
    )
  chooseSprite: ->
    spriteNumber = if Crafty.audio.muted then 0 else 1
    @sprite(spriteNumber, 0)
