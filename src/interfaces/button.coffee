Crafty.c 'Button',
  init: ->
    @requires 'Base, Text'
    $(@_element).fadeTo(100, 0.8)
    $(@_element).hover (=>
      $(@_element).stop().fadeTo(200, 1)
    ), =>
      $(@_element).stop().fadeTo(200, 0.8)
