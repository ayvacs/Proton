# Proton

A flexible and powerful UI library for Roblox that enables for easy instance creation and integration of functionality.

``` lua linenums="1"
local MyGui = new "ScreenGui" {
    ["Name"] = "My Gui",
    ["Parent"] = LocalPlayer.PlayerGui,
    ["Children"] = {
        new "TextButton" {
            ["Size"] = UDim2.new(0, 250, 0, 100),
            ["Text"] = "Click me to do something cool",
            ["*MouseButton1Click"] = (function()
                print("Left mouse button clicked!")
            end)
        }
    },
}
```

## Documentation

Please [view the full documentation](https://ave.is-a.dev/Proton).