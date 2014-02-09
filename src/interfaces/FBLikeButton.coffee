Crafty.c 'FBLikeButton',
  init: ->
    @requires 'ButtonWithLink'
    @addLink('https://www.facebook.com/dobrezielepl', 'fbLikeButton.png', 'Dobre Ziele')
  atBottomCorner: ->
    @attr
      x: 5
      y: 385
  atTopCorner: ->
    @attr
      x: 5
      y: 5

