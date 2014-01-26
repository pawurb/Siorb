Crafty.c 'InstructionField',
  init: ->
    @requires 'Base, jcarousel'
    @attr
      x: 300
      y: 100

  load: ->
    content =  "<ul>
                    <li><img src='assets/images/instruction1.png' width='431' height='287' alt=''></li>
                    <li><img src='assets/images/instruction2.png' width='431' height='287' alt=''></li>
                    <li><img src='assets/images/instruction3.png' width='431' height='287' alt=''></li>
                </ul>"
    $(@_element).append(content)
    $('.jcarousel').jcarousel()
