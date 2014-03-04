Crafty.c 'ComicCloud',
  isVisible: false
  delay: 2000
  init: ->
    @requires 'Base, spr_cloud'
    @attr
      z: 310
    @move('e', 100)
    @move('s', 100)
    $(@_element).hide()
    @bind('Runner:saysSomething', @showCloud)
  showCloud: ->
    unless @isVisible
      @isVisible = true
      $(@_element).stop().fadeIn('fast').delay(@delay).fadeOut('fast')
      setTimeout =>
        @isVisible = false
      , @delay


