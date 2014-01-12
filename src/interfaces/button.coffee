Crafty.c 'Button',
  init: ->
    @requires 'Base, Text'
    $(@_element).hover (=>
      @attr
        alpha: 0.5
    ), =>
      @attr
        alpha: 1
