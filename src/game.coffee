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
  mute: true # set to false to play music
  start: ->
    Crafty.init @width, @height
    @setBindings()
    unless localStorage.getItem('highScore')
      localStorage.setItem('highScore', 0)
    Crafty.trigger('Game:started')
    @runScene.mainMenu()
  generatePlatforms: ->
    platformArrangements = [ #playable initial arrangements
      [1,0,1,2,0,0,3,4,1,2],
      [5,1,0,2,0,5,3,0,3,5],
      [0,1,2,4,0,5,0,2,3,0],
      [0,2,1,2,0,4,1,3,2,5,4]
    ]
    randomArrangement = platformArrangements[Utils.rand(0, platformArrangements.length)]

    for i in [0..10]
      level = randomArrangement[i]
      yPos = 200 + (@height - @height/5 * level - 20)
      xPos = @width/5 * i
      Crafty.e('Platform').at(xPos, yPos)
  timeouts:
    slowDown1: null
    slowDown2: null
    speedAnimation: null
  runScene:
    mainMenu: ->
      Game.assets.loadSounds()
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







