Crafty.c 'BackgroundManager',
  backgroundX: 0
  scrollingSpeed: 1
  proportion: 4
  init: ->
    @bind('EnterFrame', ->
      #scroll background
      Game.window.style.backgroundPositionX = @backgroundX.toString() + "px"
      if @backgroundX == Game.width * 2
        @backgroundX = 0
      else
        @backgroundX -= @scrollingSpeed)

    @bind("Runner:jump", (data) ->
      #center viewport on the runner
      Game.view.y -= (data.y + Game.view.y) - Game.height/2 + 75
      Game.view.x -= (data.x + Game.view.x) - 50

      #move the background position
      arr = Game.window.style.backgroundPositionY.split('')
      arr = arr.slice(0, arr.length-2)
      treshold = if data.up
        data.gy - data.jumpSpeed
      else
        data.gy
      Game.window.style.backgroundPositionY = (Number(arr.join('')) - treshold/@proportion).toString() + 'px')

