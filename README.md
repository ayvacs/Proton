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

#### Children, Child

Parents given instance to the new instance. You can use "Children" to append one or multiple instances, or "Child" to append only one.

```lua
new "ScreenGui" {
    ["Children"] = { ExistingInstance, new("Frame"){}}
}
```

```lua
new "ScreenGui" {
    ["Child"] = { new("Frame"){}}
}
```