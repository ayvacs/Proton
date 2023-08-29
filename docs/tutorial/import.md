# Import Proton

Import Proton to your script using `require()`. You can use any name for the `Proton` and `new` variables, but throughout this documentation, we will be keeping them as the default.

```lua
local Proton = require(--[[Proton script location]])
local new = Proton.require("new")
```

## Create new UI instance

```lua
local Instance = new "ClassName" { Properties }

local SGui = new "ScreenGui" { Name = "My Gui", Parent = LocalPlayer.PlayerGui }
local Frame = new "Frame" { Parent = SGui }
```