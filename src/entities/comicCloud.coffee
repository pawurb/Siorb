Crafty.c 'ComicCloud',
  isVisible: false
  init: ->
    @requires 'Base, spr_cloud'
    @attr
      z: 310
    @move('e', 100)
    @move('s', 100)
    # $(@_element).hide()
    @bind('Runner:collectedLeaf', @showCloud)
  showCloud: ->
    unless @isVisible
      @isVisible = true
      $(@_element).stop().fadeIn('fast').delay(3000).fadeOut('fast')
      setTimeout =>
        @isVisible = false
      , 3000


