window.Utils =
  rand: (min, max) ->
    if not max?
      max = min
      min = 0
    range = max - min
    Math.floor (Math.random() * range) + min
  encode: (text) ->
    btoa(text)
  decode: (text) ->
    atob(text)