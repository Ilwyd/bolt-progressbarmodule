local bolt = require("bolt")
local progressbar = require("progressbar")

bolt.onrender2d(function (event)
    progressbar:findBarPercentage(event, progressbar.Bars.PRIMARY)
end)

bolt.onswapbuffers(function (event)
    print(progressbar.lastValue[progressbar.Bars.PRIMARY])
end)