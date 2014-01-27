Crafty.c 'LogoButton',
  init: ->
    @requires 'ButtonWithLink'
    @attr
      x: 160
      y: 330
    link = "<a href='http://www.dobreziele.pl' target='_blank'><img src='assets/images/zieleLogo.png'</img></a>"
    @addLinkHtml(link)

