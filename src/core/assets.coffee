Siorb.Assets =
  spritesPath: "assets/sprites/"
  imagesPath: "assets/images/"
  spriteFiles:
    [
      "runner.png"
      "face.png"
      "guarana.png"
      "mushroom.png"
      "leaf1.png"
      "psycho_vision.jpg"
    ]
  imagesFiles:
    [
      "background.jpg"
    ]
  load: ->
    Crafty.sprite 800, 420, "#{@spritesPath}psycho_vision.jpg",
      spr_psycho: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}runner.png",
      spr_runner: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}face.png",
      spr_face: [0, 0]
    Crafty.sprite 47, 56, "#{@spritesPath}leaf1.png",
      spr_leaf: [0, 0]
    Crafty.sprite 36, 42, "#{@spritesPath}mushroom.png",
      spr_mushroom: [0, 0]
    Crafty.sprite 34, 34, "#{@spritesPath}guarana.png",
      spr_guarana: [0, 0]

    # Crafty.background("url('assets/images/background.jpg')")
  list: ->
    list = []
    _.each @spriteFiles, (file) =>
      list.push "#{@spritesPath}#{file}"
    _.each @imagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    list
