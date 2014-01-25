Crafty.c 'Button',
  init: ->
    @requires 'Base, Text'
    $(@_element).hover (=>
      $(@_element).stop().fadeTo(200, 0.5)
    ), =>
      $(@_element).stop().fadeTo(200, 1)
