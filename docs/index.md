# Proton UI Library

A flexible and powerful UI library that allows you to create UI objects (and other instances) easily, like this:

```lua
local SGui = new "ScreenGui" {
    ["Children"] = {new("Frame"){}, new("ImageLabel"){}}

    ["Name"] = "My Gui",
    ["Parent"] = LocalPlayer.PlayerGui
}
```

Or, like this:

```lua
local SGui = new "ScreenGui" { Name = "My Gui", Parent = LocalPlayer.PlayerGui }
```

Or, like this.

```lua
local Instance = new "ClassName" { Properties }
```

## How to Use

### Import

```lua
local Proton = require(--[[Proton script location]])
local new = Proton.require("new")
```

### Create new UI instance

```lua
local Instance = new "ClassName" { Properties }

local SGui = new "ScreenGui" { Name = "My Gui", Parent = LocalPlayer.PlayerGui }
local Frame = new "Frame" { Parent = SGui }
```

Check out the tabs at the top to check out what else you can do with Proton!