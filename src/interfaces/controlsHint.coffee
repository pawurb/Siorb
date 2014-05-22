Crafty.c 'ControlsHint',
  displayTime: 4
  init: ->
    @requires 'Base, spr_hints'
    @attr
      alpha: 0.7
      z: 312
    @move('e', 250)
    @move('s', 400)

    setTimeout =>
      $(@_element).fadeOut('slow')
      setTimeout =>
        @destroy()
      , 2000
    , @displayTime * 1000
