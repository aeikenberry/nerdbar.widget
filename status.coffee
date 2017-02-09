command: "~/.kwm/scripts/compstatus"

refreshFrequency: 3000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
    <div class="compstatus"></div>
  """

style: """
  -webkit-font-smoothing: antialiased
  background-color: #98c379
  font: 14px Fira Mono
  text-transform: lowercase
  padding: 4px 10px 4px 10px
  right: 0
  top: 0
  width: 230px
  height: 13
  text-align: center
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
    position: relative
    top: 1px
    right: -16px
    z-index: 1
  """

timeAndDate: (date, time) ->
  # returns a formatted html string with the date and time
  return "<span class='black'>#{date}  #{time}</span>";

batteryStatus: (battery, state) ->
  #returns a formatted html string current battery percentage, a representative icon and adds a lighting bolt if the
  # battery is plugged in and charging
  batnum = parseInt(battery)
  if state == 'AC' and batnum >= 90
    return "<span class='black icon'>  </span><span class='icon black'> </span><span class='black'>#{batnum}%</span>"
  else if state == 'AC' and batnum >= 50 and batnum < 90
    return "<span class='black icon'>  </span><span class='black icon'> </span><span class='black'>#{batnum}%</span>"
  else if state == 'AC' and batnum < 50 and batnum >= 15
    return "<span class='black icon'>  </span><span class='black icon'> </span><span class='black'>#{batnum}%</span>"
  else if state == 'AC' and batnum < 15
    return "<span class='black icon'>  </span><span class='black icon'> </span><span class='black'>#{batnum}%</span>"
  else if batnum >= 90
    return "<span class='black icon'>  </span><span class='black'>#{batnum}%</span>"
  else if batnum >= 50 and batnum < 90
    return "<span class='black icon'>  </span><span class='black'>#{batnum}%</span>"
  else if batnum < 50 and batnum >= 15
    return "<span class='black icon'>  </span><span class='black'>#{batnum}%</span>"
  else if batnum < 15
    return "<span class='black icon'>  </span><span class='black'>#{batnum}%</span>"

getWifiStatus: (status) ->
  if status == "Wi-Fi"
    return "<span class='wifi black'>&nbsp</span>";
  if status == 'USB 10/100/1000 LAN' or status == 'Apple USB Ethernet Adapter'
    return "<span class='wifi black'></span>";
  else
    return "<span class='black'>x</span>";

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
