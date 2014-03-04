Crafty.c 'ComicSayings',
  isVisible: false
  init: ->
    @requires 'Base, spr_sayings'
    @attr
      z: 310
    @move('e', 105)
    @move('s', 125)
    # $(@_element).hide()
    @bind('Runner:collectedLeaf', @showSaying)
  showSaying: ->
    unless @isVisible
      @isVisible = true
      $(@_element).stop().fadeIn('fast').delay(3001).fadeOut('fast')
      setTimeout =>
        @isVisible = false
      , 3000


