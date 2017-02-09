command: """
IFS='|' read -r theArtist theName <<<"$(osascript <<<'tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        return theArtist & "|" & theName
    end tell')"
echo "$theArtist - $theName"
"""

refreshFrequency: 2000

style: """
  background-color: #56b6c2
  margin-bottom: 0
  padding: 4px 15px 4px 15px
  top: 0
  right: 260px
  .some-class
    font-family: Fira Mono
    font-size: 12px
"""

render: (output) -> """
  <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
	<div class="some-class black">♬ #{output}</div>
"""
