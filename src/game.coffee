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
  guaranaDuration: 7300
  mushroomDuration: 13600
  leafProbability: 0.75
  guaranaProbability: 0.95
  timeouts:
    slowDown1: null
    slowDown2: null
    speedAnimation: null
  start: ->
    Crafty.init @width, @height
    Crafty.e('AudioManager')
    @setBindings()
    unless localStorage.getItem('highScore')
      localStorage.setItem('highScore', 0)
    Crafty.trigger('Game:initialized')
    @initScene.mainMenu()
  initScene:
    mainMenu: ->
      Crafty.load Game.assets.mainMenuList(), =>
        Game.assets.loadMainMenu()
        Crafty.scene("MainMenu")
    gameplay: ->
      Crafty.load Game.assets.gameplayList(), =>
        Game.assets.loadGameplay()
        Crafty.scene("Gameplay")
    gameOver: ->
      Crafty.scene('GameOver')
  setBindings: ->
    $(document).bind "keyup", (e) ->
      Crafty.pause() if e.keyCode == 80







