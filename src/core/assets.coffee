Game.assets =
  imagesPath: "#{Game.host}/images/"
  soundsPath: "#{Game.host}/sounds/"
  gameplayImagesFiles:
    [
      "gameplayBg.jpg"
      "psychoVisionBg.jpg"
      "runner.png"
      "face.png"
      "guarana.png"
      "mushroom.png"
      "leaf.png"
      "manaMeter.png"

      # Game Over assets
      "tworcyT.png"
      "jeszczeRazT.png"
      "menuT.png"
      "gameOverBg.png"
    ]
  mainMenuImagesFiles:
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
    ]
  mainMenuSoundFiles: [
    "mainMenu.mp3"
    "gameplay.ogg"
    "mushroomBeat.ogg"
    "guaranaBeat.ogg"
  ]

  loadGameplay: -> #include assets for gameOver scene
    Crafty.sprite 800, 420, "#{@imagesPath}psychoVisionBg.jpg",
      spr_psycho: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}runner.png",
      spr_runner: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}face.png",
      spr_face: [0, 0]
    Crafty.sprite 47, 56, "#{@imagesPath}leaf.png",
      spr_leaf: [0, 0]
    Crafty.sprite 40, 49, "#{@imagesPath}mushroom.png",
      spr_mushroom: [0, 0]
    Crafty.sprite 34, 34, "#{@imagesPath}guarana.png",
      spr_guarana: [0, 0]
    Crafty.sprite 75, 75, "#{@imagesPath}manaMeter.png",
      spr_mana: [0, 0]

    # Game Over assets
    Crafty.sprite 147, 16, "#{@imagesPath}jeszczeRazT.png",
      jeszcze_button: [0, 0]
    Crafty.sprite 72, 18, "#{@imagesPath}punktyT.png",
      punkty_button: [0, 0]
    Crafty.sprite 49, 16, "#{@imagesPath}menuT.png",
      menu_button: [0, 0]


  loadMainMenu: ->
    Crafty.sprite 94, 29, "#{@imagesPath}startT.png",
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
  loadSounds: ->
    Crafty.audio.add
      mainMenu: ["#{@soundsPath}mainMenu.mp3"]
      gameplay: ["#{@soundsPath}gameplay.ogg", "#{@soundsPath}gameplay.mp3"]
      mushroomBeat: ["#{@soundsPath}mushroomBeat.ogg"]
      guaranaBeat: ["#{@soundsPath}guaranaBeat.ogg"]
  gameplayList: ->
    list = []
    _.each @gameplayImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    list
  mainMenuList: ->
    list = []
    _.each @mainMenuImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    _.each @mainMenuSoundFiles, (file) =>
      list.push "#{@soundsPath}#{file}"
    list


