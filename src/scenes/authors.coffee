Crafty.scene 'Authors', ->
  Game.scene = 'Authors'
  Crafty.e('SoundButton')
  Crafty.background "url('#{Game.host}/images/mainMenuBg.png')"
  Crafty.e('LogoButton')

  Crafty.e('ReturnButton')

  # authors data
  topY = 120
  yOffset = 60
  textX = 330

  Crafty.e('Base, aut_boss_text').at(textX, topY)
  Crafty.e('ButtonWithLink').addLink('http://www.dobreziele.pl', 'autBossLogo.png', 'Dobre Ziele')
  .at(textX + 140, topY - 20)

  Crafty.e('Base, aut_pablo_text').at(textX, topY + yOffset)
  Crafty.e('ButtonWithLink').addLink('http://www.github.com/pawurb', 'autPabloLogo.png', 'GitHub')
  .at(textX + 220, topY + 40)

  Crafty.e('Base, aut_cebula_text').at(textX, topY + yOffset * 2)
  Crafty.e('ButtonWithLink').addLink('http://cebulaa.daportfolio.com/' , 'autCebulaLogo.png', 'Portfolio')
  .at(textX + 150, topY + 75)

  Crafty.e('Base, aut_music_text').at(textX, topY + yOffset * 3)
  Crafty.e('ButtonWithLink').addLink('https://soundcloud.com/' , 'autHarryLogo.png', 'SoundCloud')
  .at(textX + 200, topY + 160)

, ->
  Crafty('Recyclable').destroy()
