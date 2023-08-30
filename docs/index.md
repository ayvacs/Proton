# Proton UI Library

A flexible and powerful UI library that allows you to create instances and give them functionality easily, like this:

```lua
local SGui = new "ScreenGui" {
    ["Name"] = "My Gui",
    ["Parent"] = LocalPlayer.PlayerGui
    ["Children"] = {
        new ("TextButton") {
            ["Text"] = "Click me to do something cool",
            ["*MouseButton1Click"] = (function()
                print("Left mouse button clicked")
            end)
        }
    }
}
```

## Syntax

The syntax basically boils down to this.

```lua
local Instance = new "ClassName" { Properties }
```

What sets Proton apart from other UI libraries is that you can use the `Properties` table to not only set properties but to apply connections, parent instances, and more.

To apply a connection, append an asterisk to the connection name, like so:

```lua
new "ClassName" {
    ["*ConnectionName"] = (function)
}
```

For more about applying connections see [Apply connection to new instance](/apply-connection).

Furthermore, Special Properties to easily, nonverbosely add functionality to your instances. For example, use the `Children` Special Property to parents the given instance(s) to the new instance:

```lua
new "ClassName" {
    ["Children"] = {
        Instances
    }
}
```

For more information, see [Special Properties](/special-properties).