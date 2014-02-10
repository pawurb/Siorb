Crafty.c 'RunnerBlush',
  init: ->
    @requires 'Base, spr_blush'
    @attr
      z: 310
    @move('e', 25)
    @move('s', 148)
    @bind('Runner:collectedMrHot', @showBlush)
    $(@_element).hide()
  showBlush: ->
    $(@_element).stop().fadeIn('slow').delay(3000).fadeOut('slow')

