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
      alpha: 0
    $(@_element).css('display', "none")

  showVision: ->
    #manually adjusting css to prevent flickering
    unless @isAnimating
      $(@_element).css('opacity', '0.01').css('display', 'block').fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0.1)
      .fadeTo(@duration/12, 0.2).fadeTo(@duration/12, 0)
      setTimeout =>
        $(@_element).css('display', 'none')
      , Game.mushroomDuration



      @isAnimating = true
      Crafty.trigger('Face:crazy')
      setTimeout =>
        @isAnimating = false
        Crafty.trigger('Face:stopCrazy')
        Crafty.trigger('Mushroom:ended')
      , @duration

