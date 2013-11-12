Crafty.c 'Runner',
  speedValue: 1
  jumpValue: 12
  backgroundX: 0
  init: ->
    @requires 'Base, Twoway, Gravity'
    @attr
      z: 299
    @color 'red'
    @attr
      x: 50
      y: Game.height/2
      w: 82
      h: 20
      z: 300
    @attach(Crafty.e 'RunnerImage' )
    @twoway(@speedValue, @jumpValue)
    @gravity('Solid')
    @gravityConst(0.7)
    @color('black')
    @bind('EnterFrame', ->
      gameWindow.style.backgroundPositionX = @backgroundX.toString() + "px"
      if @backgroundX == Game.width
        @backgroundX = 0
      else
        @backgroundX -= 1)

    @bind("Move", ->
      #center viewport on the runner
      view.y -= (runner.y + view.y) - Game.height/2 + 75
      view.x -= (runner.x + view.x) - 50

      #move the background position
      arr = gameWindow.style.backgroundPositionY.split('')
      arr.pop()
      arr.pop()
      console.log (@_gy - @_jumpSpeed)
      if @_gy != 0
        if @_up
          treshold = @_gy - @_jumpSpeed
          gameWindow.style.backgroundPositionY = (Number(arr.join('')) - treshold/3).toString() + 'px'
        else
          treshold = @_gy
          gameWindow.style.backgroundPositionY = (Number(arr.join('')) - treshold/3).toString() + 'px')
  at: (x, y) ->
    @attr
      x: x
      y: y

