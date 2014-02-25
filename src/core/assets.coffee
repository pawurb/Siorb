Game.assets =
  imagesPath: "#{Game.host}/images/"
  soundsPath: "#{Game.host}/sounds/"
  gameplayImages:
    [
      "gameplayBg.jpg"
      "psychoVisionBg.jpg"
      "runner.png"
      "face.png"
      "guarana.png"
      "mushroom.png"
      "leaf.png"
      "manaMeter.png"
      "mrsCoffee.png"
      "mrHot.png"
      "blush.png"

      # Game Over assets
      "tworcyT.png"
      "jeszczeRazT.png"
      "menuT.png"
      "gameOverBg.png"
    ]
  mainMenuImages:
    [
     "mainMenuBg.png"
     "mainMenuLeaves.png"
     "instrukcjaT.png"
     "tworcyT.png"
     "startT.png"
     "rekordT.png"
     "runner.png"
     "face.png"
     "digits.png"
     "sound.png"
     "powrotButton.png"
    ]
  instructionImages:
    [
      "arrowL.png"
      "arrowR.png"
    ]
  authorsImages:
    [
      "autCebulaText.png"
      "autBossText.png"
      "autPabloText.png"
      "autMusicText.png"
    ]
  mainMenuSounds:
    [
      "mainMenu.mp3"
    ]
  gameplaySounds: [
    "gameplay.ogg"
    "gameplay.mp3"
    "gameOver.mp3"
    "gameOver.ogg"
    "mushroomBeat.ogg"
    "mushroomBeat.mp3"
    "guaranaBeat.ogg"
    "guaranaBeat.mp3"
    "jumpSound.ogg"
    "jumpSound.mp3"
    "leafSound.ogg"
    "leafSound.mp3"
    "burnSound.ogg"
    "burnSound.mp3"
    "coffeeEndSound.ogg"
    "coffeeEndSound.mp3"
    "coffeeStartSound.ogg"
    "coffeeStartSound.mp3"
  ]

  loadGameplay: -> # also include assets for gameOver scene
    Crafty.audio.add
      gameplay: ["#{@soundsPath}gameplay.ogg", "#{@soundsPath}gameplay.mp3"]
      gameOver: ["#{@soundsPath}gameOver.ogg", "#{@soundsPath}gameOver.mp3"]
      mushroomBeat: ["#{@soundsPath}mushroomBeat.ogg", "#{@soundsPath}mushroomBeat.mp3"]
      guaranaBeat: ["#{@soundsPath}guaranaBeat.ogg", "#{@soundsPath}guaranaBeat.mp3"]
      jumpSound: ["#{@soundsPath}jumpSound.ogg", "#{@soundsPath}jumpSound.mp3"]
      leafSound: ["#{@soundsPath}leafSound.ogg", "#{@soundsPath}leafSound.mp3"]
      burnSound: ["#{@soundsPath}burnSound.ogg", "#{@soundsPath}burnSound.mp3"]
      coffeeStartSound: ["#{@soundsPath}coffeeStartSound.ogg", "#{@soundsPath}coffeeStartSound.mp3"]
      coffeeEndSound: ["#{@soundsPath}coffeeEndSound.ogg", "#{@soundsPath}coffeeEndSound.mp3"]



    Crafty.sprite 800, 420, "#{@imagesPath}psychoVisionBg.jpg",
      spr_psycho: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}runner.png",
      spr_runner: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}face.png",
      spr_face: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}blush.png",
      spr_blush: [0, 0]
    Crafty.sprite 47, 56, "#{@imagesPath}leaf.png",
      spr_leaf: [0, 0]
    Crafty.sprite 40, 49, "#{@imagesPath}mushroom.png",
      spr_mushroom: [0, 0]
    Crafty.sprite 34, 34, "#{@imagesPath}guarana.png",
      spr_guarana: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}manaMeter.png",
      spr_mana: [0, 0]
    Crafty.sprite 116, 132, "#{@imagesPath}mrsCoffee.png",
      spr_mrs_coffee: [0, 0]
    Crafty.sprite 108, 164, "#{@imagesPath}mrHot.png",
      spr_mr_hot: [0, 0]

    # Game Over assets
    Crafty.sprite 147, 16, "#{@imagesPath}jeszczeRazT.png",
      jeszcze_button: [0, 0]
    Crafty.sprite 72, 18, "#{@imagesPath}punktyT.png",
      punkty_button: [0, 0]
    Crafty.sprite 49, 16, "#{@imagesPath}menuT.png",
      menu_button: [0, 0]


  loadMainMenu: ->
    Crafty.audio.add
      mainMenu: ["#{@soundsPath}mainMenu.mp3"]
    Crafty.sprite 214, 39, "#{@imagesPath}startT.png",
      start_button: [0, 0]
    Crafty.sprite 200, 34, "#{@imagesPath}instrukcjaT.png",
      instrukcja_button: [0, 0]
    Crafty.sprite 134, 34, "#{@imagesPath}tworcyT.png",
      tworcy_button: [0, 0]
    Crafty.sprite 132, 18, "#{@imagesPath}rekordT.png",
      rekord_button: [0, 0]
    Crafty.sprite 76, 64, "#{@imagesPath}sound.png",
      sound_button: [0, 0]
    Crafty.sprite 320, 75, "#{@imagesPath}mainMenuLeaves.png",
      leaves_image: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}runner.png",
      spr_runner: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}face.png",
      spr_face: [0, 0]
    Crafty.sprite 12, 16, "#{@imagesPath}digits.png",
      spr_digits: [0, 0]
    Crafty.sprite 23, 28, "#{@imagesPath}powrotButton.png",
      powrot_button: [0, 0]

  loadInstruction: ->
    Crafty.sprite 20, 20, "#{@imagesPath}arrowR.png",
      arrow_r_button: [0, 0]
    Crafty.sprite 20, 20, "#{@imagesPath}arrowL.png",
      arrow_l_button: [0, 0]
  loadAuthors: ->
    Crafty.sprite 140, 22, "#{@imagesPath}autCebulaText.png",
      aut_cebula_text: [0, 0]
    Crafty.sprite 98, 22, "#{@imagesPath}autBossText.png",
      aut_boss_text: [0, 0]
    Crafty.sprite 154, 22, "#{@imagesPath}autPabloText.png",
      aut_pablo_text: [0, 0]
    Crafty.sprite 161, 18, "#{@imagesPath}autMusicText.png",
      aut_music_text: [0, 0]
    Crafty.sprite 357, 14, "#{@imagesPath}autSupportBox.png",
      aut_mailbox: [0, 0]
  gameplayList: ->
    list = []
    _.each @gameplayImages, (file) =>
      list.push "#{@imagesPath}#{file}"
    _.each @gameplaySounds, (file) =>
      list.push "#{@soundsPath}#{file}"
    list
  mainMenuList: ->
    list = []
    _.each @mainMenuImages, (file) =>
      list.push "#{@imagesPath}#{file}"
    _.each @mainMenuSounds, (file) =>
      list.push "#{@soundsPath}#{file}"
    list
  instructionList: ->
    list = []
    _.each @instructionImages, (file) =>
      list.push "#{@imagesPath}#{file}"
    list
  authorsList: ->
    list = []
    _.each @authorsImages, (file) =>
      list.push "#{@imagesPath}#{file}"
    list

