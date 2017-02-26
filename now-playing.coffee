command: "~/.bin/current_song"

refreshFrequency: 10000

render: (output) -> """
  <div>[ #{output} ]</div>
"""

style: """
  text-align: center
  top: 0px
  right: 260px
  color: #cdd3df
  font-family: "Roboto Mono for Powerline"
  font-size: 12px
  padding: 6px 10px 5px 10px
"""

