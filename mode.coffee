command: "~/.kwm/scripts/screens"

refreshFrequency: 3000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
    <div class='kwmmode'></div>
  """

style: """
  -webkit-font-smoothing: antialiased
  background-color: #61afef
  padding: 6px 15px 4px 15px
  font: 12px Fira Mono
  left: 0
  top: 0
  height: 16px
  white-space: nowrap
  width: 170px
  text-align: center
  text-overflow: ellipsis
  overflow: ellipsis
"""

update: (output, domEl) ->

  values = output.split('@');

  file = "";
  screenhtml = "";
  mode = values[0];
  screens = values[1];
  wins = values[2];
  win = "";
  i = 0;

  screensegs = screens.split('(');

  for sseg in screensegs
    screensegs[i] = sseg.replace /^\s+|\s+$/g, ""
    i+=1;

  screensegs = (x for x in screensegs  when x != '')

  i = 0;

  #apply a proper number tag so that space change controls can be added
  for sseg in screensegs
    i += 1;
    if sseg.slice(-1) == ")"
      screenhtml += "<span class='black '>&nbsp;*&nbsp;&nbsp;</span>" ;
    else
      screenhtml += "<span class='white'>&nbsp;*&nbsp;&nbsp;</span>" ;

  $(domEl).find('.kwmmode').html(mode + " " + screenhtml)
