command: "echo $(/usr/local/bin/kwmc query window focused name)"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #999
  font: 14px Fira Mono
  height: 16px
  left: 80px
  overflow: hidden
  text-overflow: ellipsis
  top: 6px
  width: 500px
"""
