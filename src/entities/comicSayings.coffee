Crafty.c 'ComicSayings',
  isVisible: false
  delay: 2000
  phrasesCount: 14
  init: ->
    @requires 'Base, spr_sayings'
    @attr
      z: 310
    @move('e', 105)
    @move('s', 119)
    $(@_element).hide()
    @bind('Runner:saysSomething', @showSaying)
  showSaying: ->
    @sprite(0, Utils.rand(0, @phrasesCount))
    unless @isVisible
      @isVisible = true
      $(@_element).stop().fadeIn('fast').delay(@delay).fadeOut('fast')
      setTimeout =>
        @isVisible = false
      , @delay


