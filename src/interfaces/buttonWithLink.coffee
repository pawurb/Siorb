Crafty.c 'ButtonWithLink',
  init: ->
    @requires '2D, DOM'
  addLink: (url, image, title) ->
    html = "<a href=#{url} target='_blank'><img src='assets/images/#{image}' title='#{title}'</img></a>"

    $(@_element).append(html)
    link = $(@_element).children()[0]
    $(link).stop().fadeTo(0, 0.9)
    $(link).hover ->
      $(link).stop().fadeTo(200, 1)
    , ->
      $(link).stop().fadeTo(200, 0.9)
    @
  at: (x, y) ->
    @attr
      x: x
      y: y
    @


