Crafty.c 'GameOverAd',
  init: ->
    @requires 'ButtonWithLink'
    @attr
      x: 400
      y: 210
    if Math.random() < 0.3
      adNumber = if Math.random() < 0.5 then 1 else 2
      image = "gameOverAd#{adNumber}.png"
      @addLink('http://www.dobreziele.pl', image, 'Dobre Ziele')

