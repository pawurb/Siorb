Crafty.scene 'MainMenu', ->
  Crafty.background "url('assets/images/mainMenuBg.png')"

  setTimeout ->

    Crafty.load Siorb.Assets.gameplayList(), =>
      Siorb.Assets.loadGameplay()
      Crafty.scene("Gameplay")
  , 2000
