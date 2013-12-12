Crafty.c 'PsychoVision',
  isAnimating: false
  duration: 15000
  init: ->
    @requires 'Base, spr_psycho'
    @bind('Runner:psychoVision', @showVision)
    @attr
      x: 0
      y: 76
      z: 200
    $(@_element).hide()
  showVision: ->
    unless @isAnimating
      $(@_element).stop().fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0)

      @isAnimating = true
      Crafty.trigger('Face:crazy')
      setTimeout =>
        @isAnimating = false
        Crafty.trigger('Face:stopCrazy')
      , @duration




