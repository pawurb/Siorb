Siorb.Assets =
  spritesPath: "#{Game.host}/sprites/"
  imagesPath: "#{Game.host}/images/"
  gameplaySpriteFiles:
    [
      "runner.png"
      "face.png"
      "guarana.png"
      "mushroom.png"
      "leaf.png"
      "psycho_vision.jpg"
    ]
  gameplayImagesFiles:
    [
      "background.jpg"
    ]
  mainMenuImagesFiles:
    [
     "runner.png"
     "face.png"
     "mainMenuBg.png"
     "mainMenuLeaves.png"
     "instrukcja.png"
     "tworcy.png"
     "start.png"
    ]
  loadGameplay: ->
    Crafty.sprite 800, 420, "#{@spritesPath}psycho_vision.jpg",
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

  gameplayList: ->
    list = []
    _.each @gameplaySpriteFiles, (file) =>
      list.push "#{@spritesPath}#{file}"
    _.each @gameplayImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    list
  mainMenuList: ->
    list = []
    _.each @gameplaySpriteFiles, (file) =>
      list.push "#{@spritesPath}#{file}"
    _.each @gameplayImagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    list

