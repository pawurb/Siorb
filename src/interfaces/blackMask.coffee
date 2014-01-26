Crafty.c 'BlackMask',
  init: ->
    @requires('Base')
    @color('black')
    @attr(
      x: 0
      y: Crafty.viewport.y
      w: Game.width + 200
      h: Game.height + 200
      z: 358)
    setTimeout =>
      @destroy()
    , 2000
  isVisible: ->
    @attr
      alpha: 1
    @
  isInvisible: ->
    @attr
      alpha: 0
    @
  show: ->
    setTimeout =>
      $(@_element).fadeIn('slow')
    , 300
  hide: ->
    setTimeout =>
      $(@_element).fadeOut('slow')
    , 300

