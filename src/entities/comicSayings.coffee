Crafty.c 'ComicSayings',
  firstTime: true
  isVisible: false
  delay: 3000
  phrasesCount: 13
  init: ->
    @requires 'Base, spr_sayings'
    @attr
      z: 310
    @move('e', 105)
    @move('s', 119)
    $(@_element).hide()
    @bind('Runner:saysSomething', @showSaying)
  showSaying: ->
    spriteNum = if @firstTime
      @firstTime = false
      0
    else
      Utils.rand(1, @phrasesCount)
    @sprite(0, spriteNum)
    unless @isVisible
      @isVisible = true
      $(@_element).stop().fadeIn('fast').delay(@delay).fadeOut('fast')
      setTimeout =>
        @isVisible = false
      , @delay


