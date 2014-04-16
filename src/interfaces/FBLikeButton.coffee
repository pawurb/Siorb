Crafty.c 'FBLikeButton',
  init: ->
    @requires 'Base'
    @attr
      x: 10
      y: 10
      w: 50
      h: 50

    html2 = "<div class='fb-like' data-href='https://www.facebook.com/dobrezielepl' data-layout='standard' data-action='like' data-show-faces='false' data-share='false'></div><div class='fb-share-button' data-href='http://siorb.dobreziele.pl/' data-type='button_count'></div>"

    `(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = '//connect.facebook.net/pl_PL/all.js#xfbml=1';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));`

    $(@_element).append(html2)
