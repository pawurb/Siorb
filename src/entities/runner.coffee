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
      y: 50
      w: 82
      h: 20
      z: 300
    @attach(Crafty.e 'RunnerImage' )
    @twoway(@speedValue, @jumpValue)
    @gravity('Solid')
    @gravityConst(0.7)
    @color('black')

