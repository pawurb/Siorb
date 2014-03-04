Crafty.c 'ComicSayings',
  isVisible: false
  delay: 2000
  phrasesCount: 7
  init: ->
    @requires 'Base, spr_sayings'
    @attr
      z: 310
    @move('e', 105)
    @move('s', 125)
    $(@_element).hide()
    @bind('Runner:saysSomething', @showSaying)
    @sprite(0,3)
  showSaying: ->
    @sprite(0, Utils.rand(0, @phrasesCount - 1))
    unless @isVisible
      @isVisible = true
      $(@_element).stop().fadeIn('fast').delay(@delay).fadeOut('fast')
      setTimeout =>
        @isVisible = false
      , @delay


