Crafty.scene 'Gameplay', ->
  Crafty.audio.stop()
  Game.scene = 'Gameplay'
  Game.score = 0
  Crafty.audio.stop()
  Crafty.background('')
  Game.window = document.getElementById('cr-stage')
  Game.window.style.backgroundPositionY = '0px'
  Game.runner = Crafty.e 'Runner'
  Game.view = Crafty.viewport
  Game.generatePlatforms()
  Crafty.e 'BackgroundManager'
  Crafty.e 'ScoreBoard'
  Crafty.e 'ManaMeter'
  Crafty.e 'GameObserver'
  Crafty.e 'RunnerKiller'
,
  ->
    Crafty("*").destroy()




