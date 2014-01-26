window.Game =
  host: "http://#{window.location.host}/assets"
  floatSpeed: 4
  defaultFloatSpeed: 4
  score: 0
  width : 800
  height : 420
  window: null
  scene: null
  assets: null
  firstMainMenu: true
  firstGameplay: true
  firstInstruction: true
  guaranaDuration: 7300
  mushroomDuration: 13600
  leafProbability: 0.75
  guaranaProbability: 0.95
  muted: (if localStorage.getItem('muted') == 'true' then true else false)
  volume: 0.4
  timeouts:
    slowDown1: null
    slowDown2: null
    speedAnimation: null
  start: ->
    Crafty.init @width, @height
    @setBindings()
    Crafty.e('AudioManager')

    unless localStorage.getItem('highScore')
      localStorage.setItem('highScore', 0)
    Crafty.trigger('Game:initialized')
    @runScene.mainMenu()
  runScene:
    mainMenu: ->
      if Game.firstMainMenu
        Crafty.load Game.assets.mainMenuList(), =>
          Game.assets.loadMainMenu()
          Crafty.scene("MainMenu")
      else
        Crafty.scene("MainMenu")
    gameplay: ->
      if Game.firstGameplay
        Crafty.load Game.assets.gameplayList(), =>
          Game.assets.loadGameplay()
          Crafty.scene("Gameplay")
      else
        Crafty.scene("Gameplay")
    gameOver: ->
      Crafty.scene('GameOver')
    instruction: ->
      if Game.firstInstruction
        Crafty.load Game.assets.instructionList(), =>
          Game.assets.loadInstruction()
          Crafty.scene("Instruction")
      else
        Crafty.scene("Instruction")

  setBindings: ->
    $(document).bind "keyup", (e) ->
      Crafty.pause() if e.keyCode == 80







