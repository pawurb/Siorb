Crafty.c 'GameOverAd',
  init: ->
    @requires '2D, DOM'
    @attr
      x: 400
      y: 210
  addLink: ->
    if Math.random() < 0.5
      adNumber = if Math.random() < 0.5 then 1 else 2
      image = "gameOverAd#{adNumber}.png"
      link = "<a href='http://www.dobreziele.pl' target='_blank'><img src='assets/images/#{image}'</img></a>"
      $(@_element).append(link)
      $('a').hover ->
        $('a').stop().fadeTo(200, 0.5)
      , ->
        $('a').stop().fadeTo(200, 1)

