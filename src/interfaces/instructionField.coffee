Crafty.c 'InstructionField',
  init: ->
    @requires 'Base'
    @attr
      x: 330
      y: 130

  load: ->
    content =  "<div class='jcarousel'>
                  <ul>
                    <li><img src='assets/images/instruction1.png' width='431' height='287' alt=''></li>
                    <li><img src='assets/images/instruction2.png' width='431' height='287' alt=''></li>
                    <li><img src='assets/images/instruction3.png' width='431' height='287' alt=''></li>
                  </ul>
                </div>"
    $(@_element).append(content)
    $('.jcarousel').jcarousel()
