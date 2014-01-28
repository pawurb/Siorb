Crafty.c 'ButtonWithLink',
  init: ->
    @requires '2D, DOM'
  addLinkHtml: (html) ->
    $(@_element).append(html)
    link = $(@_element).children()[0]
    $(link).stop().fadeTo(0, 0.8)
    $(link).hover ->
      $(link).stop().fadeTo(200, 1)
    , ->
      $(link).stop().fadeTo(200, 0.8)

