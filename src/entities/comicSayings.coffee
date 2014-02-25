Crafty.c 'ComicSayings',
  isVisible: false
  init: ->
    @requires 'Base, spr_sayings'
    @attr
      z: 310
    @move('e', 150)
    @move('s', 120)
    # $(@_element).hide()
    @bind('Runner:collectedLeaf', @showSaying)
  showSaying: ->
    unless @isVisible
      @isVisible = true
      $(@_element).stop().fadeIn('fast').delay(3000).fadeOut('fast')
      setTimeout =>
        @isVisible = false
      , 3000


