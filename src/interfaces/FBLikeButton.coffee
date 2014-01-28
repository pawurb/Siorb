Crafty.c 'FBLikeButton',
  init: ->
    @requires 'ButtonWithLink'
    link = "<a href='https://www.facebook.com/dobrezielepl' target='_blank'><img src='assets/images/fbLikeButton.png'</img></a>"
    @addLinkHtml(link)
  atBottomCorner: ->
    @attr
      x: 5
      y: 385
  atTopCorner: ->
    @attr
      x: 5
      y: 5

