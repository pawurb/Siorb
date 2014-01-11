Crafty.scene 'Gameplay', ->
  Crafty.audio.stop()
  Game.scene = 'Gameplay'
  Game.score = 0
  Crafty.audio.stop()
  Crafty.background('')
  Game.setupGlobals()
  Game.generatePlatforms()
,
  ->
    Crafty("*").destroy()




