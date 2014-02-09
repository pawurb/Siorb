Crafty.c 'LogoButton',
  init: ->
    @requires 'ButtonWithLink'
    @attr
      x: 160
      y: 330
    @addLink('http://www.dobreziele.pl', 'zieleLogo.png', 'Dobre Ziele')

