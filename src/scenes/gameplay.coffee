Crafty.scene 'Gameplay', ->
  Game.scene = 'Gameplay'
  Game.score = 0
  Crafty.background('')
  Game.setupGlobals()
  Game.generatePlatforms()
,
  ->
    Crafty("*").destroy()




