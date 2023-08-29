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

## Special Properties

Special Properties are used when creating a function with `new()` and allow you to easily, nonverbosely add functionality to your instances.

### List

#### Children

Parents given instance(s) to the new instance.

```lua
new "ClassName" { ["Children"] = { Instances } }
```

```lua
new "ScreenGui" {
    ["Children"] = { ExistingInstance, new("Frame"){}}
}
```

#### Connections

Applies connection(s) to the new instance.

```lua
new "ClassName" { ["Connections"] = { {ConnectionName, Function}, ... } }
```

```lua
new "TextButton" {
    ["Connections"] = {
        { "MouseButton1Click", (function() print("Left mouse button clicked") end) },
        { "MouseButton1Click", (function() print("This function runs at the same time as the above one") end) },
        { "MouseButton2Down", (function() print("Right mouse button down") end) }
    }
}
```