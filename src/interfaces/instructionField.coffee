Crafty.c 'InstructionField',
  init: ->
    @requires 'Base'
    @attr
      x: 330
      y: 130

    content =  "<div class='jcarousel'>
                  <ul>
                    <li><img src='assets/images/instruction1.png' width='431' height='287' alt=''></li>
                    <li><img src='assets/images/instruction2.png' width='431' height='287' alt=''></li>
                    <li><img src='assets/images/instruction3.png' width='431' height='287' alt=''></li>
                  </ul>
                </div>"

    scrollButtonsY = 360
    scrollButtonsX = 400
    Crafty.e('Button, jcarousel-prev').attr({w: 50, h:50}).at(scrollButtonsX, scrollButtonsY).color('red')
    Crafty.e('Button, jcarousel-next').attr({w: 50, h:50}).at(scrollButtonsX + 60, scrollButtonsY).color('blue')

    $(@_element).append(content)
    $('.jcarousel').jcarousel(
      animation:
        duration: 400
    )

    $('.jcarousel-prev').jcarouselControl({
      target: '-=1'
    })

    $('.jcarousel-next').jcarouselControl({
      target: '+=1'
    })


