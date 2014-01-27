Crafty.c 'Button',
  saturation: 0.8
  init: ->
    @requires 'Base, Text'
    $(@_element).fadeTo(100, @saturation)
    $(@_element).hover (=>
      $(@_element).stop().fadeTo(200, 1)
    ), =>
      $(@_element).stop().fadeTo(200, @saturation)
