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

## Apply connection to new instance

When creating a new instance with `new()` you can easily apply a connection to it by simply adding it to the property table, appended with an asterisk, like such:

```lua
new "ClassName" {
    ["*ConnectionName"] = func
}
```

```lua
new "TextButton" {
    ["*MouseButton1Click"] = (function() (print("Left mouse button clicked")) end)
}
```

You can of course add the "Connections" Special Property, and normal properties, at the same time:

```lua
new "TextButton" {
    ["Name"] = "My Text Button",
    ["Parent"] = ScreenGui,

    ["*MouseButton1Click"] = (function() print("Left mouse button clicked") end)
    
    ["Connections"] = {
        { "MouseButton1Click", (function() print("Left mouse button clicked") end) },
        { "MouseButton2Down", (function() print("Right mouse button down") end) }
    }
}
```

With this method you cannot apply multiple connections of the same name to an instance. Instead, you can use the "Connections" Special Property.