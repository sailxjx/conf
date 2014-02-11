| !{html} <-- Escaped
| #{html} <-- Encoded

script.
  var foo = 'bar';

script
  :coffee
    foo = ->
    app = 'node'
    alert app
