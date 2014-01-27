Crafty.c 'ButtonWithLink',
  init: ->
    @requires '2D, DOM'
  addLinkHtml: (html) ->
    $(@_element).append(html)
    $('a').stop().fadeTo(200, 0.8)
    $('a').hover ->
      $('a').stop().fadeTo(200, 1)
    , ->
      $('a').stop().fadeTo(200, 0.8)

