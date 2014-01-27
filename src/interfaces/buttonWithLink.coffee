Crafty.c 'ButtonWithLink',
saturation: 0.8
  init: ->
    @requires '2D, DOM'
  addLinkHtml: (html) ->
    $(@_element).append(html)
    $('a').stop().fadeTo(200, @saturation)
    $('a').hover ->
      $('a').stop().fadeTo(200, 1)
    , ->
      $('a').stop().fadeTo(200, @saturation)

