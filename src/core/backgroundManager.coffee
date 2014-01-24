Crafty.c 'BackgroundManager',
  backgroundX: 0
  scrollingSpeed: 1
  proportion: 4
  init: ->
    Game.window.style.backgroundPosition = '0px -1000px'
    @bind('EnterFrame', ->
      # scroll background
      position = Game.window.style.backgroundPosition
      backgroundY = parseInt(position.split(' ')[1])
      Game.window.style.backgroundPosition =  @backgroundX.toString() + "px " + backgroundY.toString() + "px"
      if @backgroundX == Game.width * 2
        @backgroundX = 0
      else
        @backgroundX -= @scrollingSpeed
    )
    @bind("Runner:jump", (data) ->
      # center viewport on the runner
      Game.view.y -= (data.y + Game.view.y) - Game.height/2 + 75
      Game.view.x -= (data.x + Game.view.x) - 50

      # move the background position
      arr = Game.window.style.backgroundPosition.split(' ')[1].split('')
      arr = arr.slice(0, arr.length-2)
      treshold = if data.up
        data.gy - data.jumpSpeed
      else
        data.gy
      backgroundY = (Number(arr.join('')) - treshold/@proportion).toString()
      Game.window.style.backgroundPosition =  @backgroundX.toString() + "px " + backgroundY.toString() + "px")


