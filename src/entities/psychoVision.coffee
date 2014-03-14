Crafty.c 'PsychoVision',
  isAnimating: false
  duration: Game.mushroomDuration
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
      $(@_element).fadeIn(@duration/13).fadeTo(@duration/13, 0.2).fadeTo(@duration/13, 0.1)
      .fadeTo(@duration/13, 0.2).fadeTo(@duration/13, 0.1)
      .fadeTo(@duration/13, 0.2).fadeTo(@duration/13, 0.1)
      .fadeTo(@duration/13, 0.2).fadeTo(@duration/13, 0.1)
      .fadeTo(@duration/13, 0.2).fadeTo(@duration/13, 0.1)
      .fadeTo(@duration/13, 0.2).fadeTo(@duration/13, 0)

      @isAnimating = true
      Crafty.trigger('Face:crazy')
      setTimeout =>
        @isAnimating = false
        Crafty.trigger('Face:stopCrazy')
        Crafty.trigger('Mushroom:ended')
      , @duration

