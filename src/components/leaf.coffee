Crafty.c 'Leaf',
  floatLeft: true
  speedValue: 3
  init: ->
    @requires 'Base, Collision, Gravity, spr_leaf'
    @attr
      z: 302
    @onHit('spr_runner', ->
      Crafty.trigger('Collected'
        name: 'leaf')
      @destroy())
    @gravity()
    @onHit('Solid', (e) ->
      platform = e[0].obj
      @antigravity())
    @bind('EnterFrame', @float)
  float: ->
    @move('w', @speedValue)


