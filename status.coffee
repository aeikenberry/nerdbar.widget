command: "~/.kwm/scripts/compstatus"

refreshFrequency: 3000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
    <div class="compstatus"></div>
  """

style: """
  -webkit-font-smoothing: antialiased
  font: 14px Fira Mono
  text-transform: lowercase
  right: 5px
  top: 4px
  height: 13
  .weather_forecast
    width: 8em
    background: #272822
    top: 16px
    right: 100px
    opacity: 0
  .wifi
    font: 16px fontawesome
    top: 1px
    position: relative
  .charging
    font: 13px fontawesome
    color: #f8f8f2
    position: relative
    top: 1px
    right: -16px
    z-index: 1
  """

timeAndDate: (date, time) ->
  # returns a formatted html string with the date and time
  return "<span class='grey'>#{date}  #{time}</span>";

batteryStatus: (battery, state) ->
  #returns a formatted html string current battery percentage, a representative icon and adds a lighting bolt if the
  # battery is plugged in and charging
  batnum = parseInt(battery)
  if state == 'AC' and batnum >= 90
    return "<span class=''>  </span><span class='icon grey'> </span><span class='grey'>#{batnum}%</span>"
  else if state == 'AC' and batnum >= 50 and batnum < 90
    return "<span class=''>  </span><span class='grey icon'> </span><span class='grey'>#{batnum}%</span>"
  else if state == 'AC' and batnum < 50 and batnum >= 15
    return "<span class=''>  </span><span class='grey icon'> </span><span class='grey'>#{batnum}%</span>"
  else if state == 'AC' and batnum < 15
    return "<span class=''>  </span><span class='grey icon'> </span><span class='grey'>#{batnum}%</span>"
  else if batnum >= 90
    return "<span class='grey icon'>  </span><span class='grey'>#{batnum}%</span>"
  else if batnum >= 50 and batnum < 90
    return "<span class='grey icon'>  </span><span class='grey'>#{batnum}%</span>"
  else if batnum < 50 and batnum >= 15
    return "<span class='grey icon'>  </span><span class='grey'>#{batnum}%</span>"
  else if batnum < 15
    return "<span class='grey icon'>  </span><span class='grey'>#{batnum}%</span>"

getWifiStatus: (status) ->
  if status == "Wi-Fi"
    return "<span class='wifi grey'>&nbsp</span>";
  if status == 'USB 10/100/1000 LAN' or status == 'Apple USB Ethernet Adapter'
    return "<span class='wifi grey'></span>";
  else
    return "<span class='grey'>x</span>";

update: (output, domEl) ->

  # split the output of the script
  values = output.split('@');

  time = values[0].replace /^\s+|\s+$/g, ""
  date = values[1];
  battery = values[2];
  isCharging = values[3]
  netStatus = values[4].replace /^\s+|\s+$/g, ""

  # create an HTML string to be displayed by the widget
  htmlString = @getWifiStatus(netStatus) + "  " +
               @batteryStatus(battery, isCharging) + "    " +
               @timeAndDate(date,time)

  $(domEl).find('.compstatus').html(htmlString)
