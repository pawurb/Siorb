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
  instructionImagesFiles:
    [
      "instruction1.png"
      "instruction2.png"
      "instruction3.png"
      "powrotT.png"
    ]
  mainMenuSounds: [
    "mainMenu.mp3"
  ]

  gameplaySounds: [
    "gameplay.ogg"
    "gameplay.mp3"
    "mushroomBeat.ogg"
    "guaranaBeat.ogg"
  ]

  loadGameplay: -> #include assets for gameOver scene
    Crafty.audio.add
      gameplay: ["#{@soundsPath}gameplay.mp3"]
      mushroomBeat: ["#{@soundsPath}mushroomBeat.ogg"]
      guaranaBeat: ["#{@soundsPath}guaranaBeat.ogg"]
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
    Crafty.audio.add
      mainMenu: ["#{@soundsPath}mainMenu.mp3"]
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

  loadInstruction: ->
    Crafty.sprite 431, 287, "#{@imagesPath}instruction1.png",
      spr_instruction1: [0, 0]
    Crafty.sprite 431, 287, "#{@imagesPath}instruction2.png",
      spr_instruction2: [0, 0]
    Crafty.sprite 431, 287, "#{@imagesPath}instruction3.png",
      spr_instruction3: [0, 0]
    Crafty.sprite 119, 36, "#{@imagesPath}powrotT.png",
      powrot_button: [0, 0]

  gameplayList: ->
    list = []
    _.each @gameplayImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    _.each @gameplaySounds, (file) =>
      list.push "#{@soundsPath}#{file}"
    list
  mainMenuList: ->
    list = []
    _.each @mainMenuImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    _.each @mainMenuSounds, (file) =>
      list.push "#{@soundsPath}#{file}"
    list
  instructionList: ->
    list = []
    _.each @instructionImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    list


