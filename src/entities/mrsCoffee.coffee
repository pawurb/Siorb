Crafty.c 'MrsCoffee',
  name: 'mrsCoffee'
  init: ->
    @requires('Collectable')
    @attr(
      w: 50
      h: 50)
    @attach(Crafty.e 'MrsCoffeeImage')
