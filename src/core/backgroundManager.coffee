Crafty.c 'BackgroundManager',
  xScrollFrame: 0
  yScrollFrame: 0
  backgroundX: 0
  xScrollingSpeed: 2
  yScrollProportion: 4
  init: ->
    Game.window.style.backgroundPosition = '0px -1000px'
    @bind('EnterFrame', @scrollBackgroundX)
    @bind('Runner:jump', @centerOnRunner)

  scrollBackgroundX: ->
    @xScrollFrame += 1
    @xScrollFrame = 0 if @xScrollFrame == 1000

    if @xScrollFrame % 2
      position = Game.window.style.backgroundPosition
      backgroundY = parseInt(position.split(' ')[1])
      Game.window.style.backgroundPosition =  @backgroundX.toString() + "px " + backgroundY.toString() + "px"
      if @backgroundX == Game.width * 2
        @backgroundX = 0
      else
        @backgroundX -= @xScrollingSpeed
  centerOnRunner: (data) ->
    Game.view.y -= (data.y + Game.view.y) - Game.height/2 + 75
    Game.view.x -= (data.x + Game.view.x) - 50

    @yScrollFrame += 1
    @yScrollFrame = 0 if @yScrollFrame == 1000

    if @yScrollFrame % @yScrollProportion == 0
      @scrollBackgroundY(data)
  scrollBackgroundY: (data) ->
    arr = Game.window.style.backgroundPosition.split(' ')[1].split('')
    arr = arr.slice(0, arr.length-2)
    treshold = if data.up
      data.gy - data.jumpSpeed
    else
      data.gy
    backgroundY = (Number(arr.join('')) - treshold/@yScrollProportion).toString()
    Game.window.style.backgroundPosition =  @backgroundX.toString() + "px " + backgroundY.toString() + "px"


