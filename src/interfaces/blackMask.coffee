Crafty.c 'BlackMask',
  init: ->
    @requires('Base')
    @color('black')
    @attr(
      x: Crafty.viewport.x
      y: Crafty.viewport.y
      w: Game.width
      h: Game.height
      z: 358)
  isVisible: ->
    @attr
      alpha: 1
    @
  isInvisible: ->
    $(@_element).hide()
    @
  show: ->
    setTimeout =>
      $(@_element).fadeIn('slow')
    , 500
  hide: ->
    setTimeout =>
      $(@_element).fadeOut('slow')
    , 500

