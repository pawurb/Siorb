Crafty.c 'GameOverAd',
  init: ->
    @requires 'ButtonWithLink'
    @attr
      x: 400
      y: 210
    if Math.random() < 0.5
      adNumber = if Math.random() < 0.5 then 1 else 2
      image = "gameOverAd#{adNumber}.png"
      link = "<a href='http://www.dobreziele.pl' target='_blank'><img src='assets/images/#{image}'</img></a>"
      @addLinkHtml(link)

