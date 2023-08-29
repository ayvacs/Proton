# Proton UI Library

## Syntax

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