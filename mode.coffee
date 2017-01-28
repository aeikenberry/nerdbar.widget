command: "~/.kwm/scripts/screens"

refreshFrequency: 3000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
    <div class='kwmmode'></div>
  """

style: """
  -webkit-font-smoothing: antialiased
  color: #66d9ef
  font: 13px TerminessTTF Nerd Font
  left: 10px
  right: 10px
  top: 5px
  height: 16px
  white-space: nowrap
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
      screenhtml += "<span class='white '>&nbsp;+&nbsp;&nbsp;</span>" ;
    else
      screenhtml += "<span class='grey'>&nbsp;+&nbsp;&nbsp;</span>" ;

  $(domEl).find('.kwmmode').html(
    "<span class='grey'>#{mode}</span>" + "<div style='width: 50%; margin: 0 auto; padding:0; margin-top: -11px; text-align: center;'>" + screenhtml + "</div>"
  )
