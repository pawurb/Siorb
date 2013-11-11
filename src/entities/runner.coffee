Crafty.c 'Runner',
  speedValue: 5
  jumpValue: 12
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
    @bind("Move", -> #center viewport on the runner
      console.log (@y - Game.height/2)
      view.y -= (runner.y + view.y) - Game.height/2 + 75
      view.x -= (runner.x + view.x) - 50)
  at: (x, y) ->
    @attr
      x: x
      y: y

