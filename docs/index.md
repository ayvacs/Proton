# Proton

A flexible and powerful UI library that allows you to create instances and give them functionality easily, like this:

``` lua linenums="1"
local SGui = new "ScreenGui" {
    ["Name"] = "My Gui",
    ["Parent"] = LocalPlayer.PlayerGui,
    ["Children"] = {
        new "TextButton" {
            ["Size"] = UDim2.new(0, 250, 0, 100),
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

``` lua linenums="1"
local Instance = new "ClassName" { Properties }
```

What sets Proton apart from other UI libraries is that you can use the `Properties` table to not only set properties but to connect events, parent instances, and more.

To connect an event, append an asterisk to the event name, like so:

``` lua linenums="1"
new "ClassName" {
    ["*EventName"] = (function)
}
```

Furthermore, use Special Properties to easily, nonverbosely add functionality to your instances. For example, use the `Children` Special Property to parents the given instance(s) to the new instance:

``` lua linenums="1"
new "ClassName" {
    ["Children"] = {
        Instances
    }
}
```

For more information, see [Special Properties](/special-properties).