Crafty.c 'ReturnButton',
  clicked: false
  init: ->
    @requires('Button, powrot_button')
    @at(750, 365)

    $(@._element).on('click', =>
      unless @clicked
        @clicked = true
        Game.runScene.mainMenu()
    )



