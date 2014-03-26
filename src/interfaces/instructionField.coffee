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

    scrollButtonsY = 370
    scrollButtonsX = 500
    Crafty.e('Button, arrow_l_button, jcarousel-prev').at(scrollButtonsX, scrollButtonsY)
    Crafty.e('Button, arrow_r_button, jcarousel-next').at(scrollButtonsX + 60, scrollButtonsY)

    $(@_element).append(content)
    $('.jcarousel').jcarousel(
      animation:
        duration: 400
    )

    $(".jcarousel-prev").on("jcarouselcontrol:active", ->
      $(@).removeClass "inactive"
    ).on("jcarouselcontrol:inactive", ->
      $(@).addClass "inactive"
    ).jcarouselControl target: "-=1"

    $(".jcarousel-next").on("jcarouselcontrol:active", ->
      $(@).removeClass "inactive"
    ).on("jcarouselcontrol:inactive", ->
      $(@).addClass "inactive"
    ).jcarouselControl target: "+=1"
