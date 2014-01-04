Siorb.Assets =
  spritesPath: "#{Game.host}/sprites/"
  imagesPath: "#{Game.host}/images/"
  soundsPath: "#{Game.host}/sounds/"
  gameplaySpriteFiles:
    [
      "runner.png"
      "face.png"
      "guarana.png"
      "mushroom.png"
      "leaf.png"
      "manaMeter.png"
    ]
  gameplayImagesFiles:
    [
      "background.jpg"
      "psychoVision.jpg"
    ]
  mainMenuSpriteFiles:
    [
      "runner.png"
      "face.png"
    ]
  mainMenuImagesFiles:
    [
     "mainMenuBg.png"
     "mainMenuLeaves.png"
     "instrukcja.png"
     "tworcy.png"
     "start.png"
    ]
  mainMenuSoundFiles: [
    "mainMenu.ogg"
  ]
  loadGameplay: ->
    Crafty.sprite 800, 420, "#{@imagesPath}psychoVision.jpg",
      spr_psycho: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}runner.png",
      spr_runner: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}face.png",
      spr_face: [0, 0]
    Crafty.sprite 47, 56, "#{@spritesPath}leaf.png",
      spr_leaf: [0, 0]
    Crafty.sprite 40, 49, "#{@spritesPath}mushroom.png",
      spr_mushroom: [0, 0]
    Crafty.sprite 34, 34, "#{@spritesPath}guarana.png",
      spr_guarana: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}manaMeter.png",
      spr_mana: [0, 0]

  loadMainMenu: ->
    Crafty.sprite 94, 29, "#{@imagesPath}start.png",
      start_button: [0, 0]
    Crafty.sprite 200, 34, "#{@imagesPath}instrukcja.png",
      instrukcja_button: [0, 0]
    Crafty.sprite 134, 34, "#{@imagesPath}tworcy.png",
      tworcy_button: [0, 0]
    Crafty.sprite 320, 75, "#{@imagesPath}mainMenuLeaves.png",
      leaves_image: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}runner.png",
      spr_runner: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}face.png",
      spr_face: [0, 0]
    Crafty.audio.add
      mainMenu: [
                 "#{@soundsPath}/mainMenu.ogg"
                 "#{@soundsPath}/mainMenu.mp3"
                 ] #missing formats !!


  gameplayList: ->
    list = []
    _.each @gameplaySpriteFiles, (file) =>
      list.push "#{@spritesPath}#{file}"
    _.each @gameplayImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    list
  mainMenuList: ->
    list = []
    _.each @mainMenuSpriteFiles, (file) =>
      list.push "#{@spritesPath}#{file}"
    _.each @mainMenuImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    _.each @mainMenuSoundFiles, (file) =>
      list.push "#{@soundsPath}#{file}"
    list

