command: "~/.kwm/scripts/stats.sh"

refreshFrequency: 3000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="/nerdbar.widget/colors.css" />
    <div class='stats'></div>
  """

style: """
  -webkit-font-smoothing: antialiased
  font: 10px Fira Mono
  text-transform: lowercase
  right: 17px
  bottom: 2px
  color: #66d9ef
  height: 13
"""


getCPU: (cpu) ->
  cpuNum = parseFloat(cpu)
  # I have four cores, so I divide my CPU percentage by four to get the proper number
  cpuNum = cpuNum/4
  cpuNum = cpuNum.toFixed(1)
  cpuString = String(cpuNum)
  if cpuNum < 10
    cpuString = '0' + cpuString
  return "<span class='grey'>cpu:</span><span class='white'>#{cpuString}%</span>"

getMem: (mem) ->
  memNum = parseFloat(mem)
  memNum = memNum.toFixed(1)
  memString = String(memNum)
  if memNum < 10
    memString = '0' + memString

  return "<span class='grey'>mem:</span><span class='white'>#{memString}%</span>"

convertBytes: (bytes) ->
  kb = bytes / 1024
  return @usageFormat(kb)

usageFormat: (kb) ->
    mb = kb / 1024
    if mb < 0.01
      return "0.00mb"
    return "#{parseFloat(mb.toFixed(2))}MB"

getNetTraffic: (down, up) ->
  downString = @convertBytes(parseInt(down))
  upString = @convertBytes(parseInt(up))
  return "<span>&nbsp</span><span class='grey'>down:</span><span class='white'>#{downString} <span> ⎢</span> </span><span></span><span class='grey'>up:</span><span class='white'>#{upString}</span>"

getFreeSpace: (space) ->
  return "<span class='grey'>free:</span><span class='white'>#{space}gb</span>"

update: (output, domEl) ->

  # split the output of the script
  values = output.split('@');

  cpu = values[0]
  mem = values[1]
  down = values[2]
  up   = values[3]

  # create an HTML string to be displayed by the widget
  htmlString =  @getNetTraffic(down, up) + "<span>&nbsp⎢&nbsp</span>" +
                @getMem(mem) + "<span>&nbsp⎢&nbsp</span>" +
                @getCPU(cpu)

  $(domEl).find('.stats').html(htmlString)
