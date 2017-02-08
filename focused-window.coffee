command: "echo $(/usr/local/bin/kwmc query window focused name)"

refreshFrequency: 1000 # ms

render: (output) ->
  "<span class='black'>❒ #{output}</span>"

style: """
  background-color: #c678dd
  -webkit-font-smoothing: antialiased
  font: 12px Fira Mono
  text-align: left
  top: 0
  overflow: hidden
  max-width: 600px
  text-overflow: ellipsis
  white-space: no-wrap
  left: 155px
  padding: 8px 10px 4px 10px
  min-height: 15px
"""
