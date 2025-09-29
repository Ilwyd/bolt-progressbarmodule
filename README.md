This is a module for use in [Bolt](https://github.com/adamcake/Bolt) plugins which allows you to get the percentage of bars which appear over the player's head during various activities. E.g. Mining and Smithing.

This does not include the adrenaline bar or the health bar, as more accurate values can be taken directly from the ability bar / minimap orbs.

As a warning I want to mention that this hasn't been extensively tested at the moment, beyond checking that it gets the percentage as expect while smithing. It may pick up bars that are not above the player such as timers on fire spririts or progress at overgrown idols.

## Instructions
Using `onrender2d`, use `findBarPercentage(event, bar)` to load the current bar percentage into `lastValue`. You can then get the value from `lastValue`. The below is from example.lua:

```lua
local bolt = require("bolt")
local progressbar = require("progressbar")

bolt.onrender2d(function (event)
    progressbar:findBarPercentage(event, progressbar.Bars.PRIMARY)
end)

bolt.onswapbuffers(function (event)
    print(progressbar.lastValue[progressbar.Bars.PRIMARY])
end)
```
