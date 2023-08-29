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