Crafty.scene 'GameOver', ->
  Crafty.viewport.y = 0
  Crafty.background('rgb(0,0,0)')
  Crafty.load Siorb.Assets.gameOverList(), =>
    Siorb.Assets.loadGameOver()
    Crafty.e('Button, spr_digits').at(545, 200)

    # setTimeout(->
    #   Crafty.scene('Gameplay')
    # , 1000)
,
  ->
    Crafty("*").destroy()




