Crafty.scene 'Authors', ->
  Game.scene = 'Authors'
  Game.firstAuthors = false
  Crafty.e('SoundButton')
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('LogoButton')

  Crafty.e('ReturnButton')
  Crafty.e('FBLikeButton').atBottomCorner()

, ->
  Crafty('Recyclable').destroy()








