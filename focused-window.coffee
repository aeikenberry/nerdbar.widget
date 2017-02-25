command: "echo $(/usr/local/bin/kwmc query window focused name)"

refreshFrequency: 1000 # ms

render: (output) ->
  "<div>» #{output}</div>"

style: """
  color: #ebdbb2
  background-color: #6b6c6c
  font-family: "Roboto Mono for Powerline"
  font-size: 12px
  text-align: left
  top: 0
  overflow: hidden
  max-width: 650px
  text-overflow: ellipsis
  white-space: no-wrap
  left: 210px
  padding: 6px 10px 4px 10px
  min-height: 15px
"""
