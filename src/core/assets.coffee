Siorb.Assets =
  spritesPath: "assets/sprites/"
  imagesPath: "assets/images/"
  spriteFiles:
    ["runner.png", "face.png", "leaf1.png"]
  imagesFiles:
    ["background.jpg"]
  load: ->
    Crafty.sprite 75, 75, "#{@spritesPath}runner.png",
      spr_runner: [0, 0]
    Crafty.sprite 75, 75, "#{@spritesPath}face.png",
      spr_face: [0, 0]
    Crafty.sprite 47, 56, "#{@spritesPath}leaf1.png",
      spr_leaf: [0, 0]
    # Crafty.background("url('assets/images/background.jpg')")
  list: ->
    list = []
    _.each @spriteFiles, (file) =>
      list.push "#{@spritesPath}#{file}"
    _.each @imagesFiles, (file) =>
      list.push "#{@imagesPath}#{file}"
    list
