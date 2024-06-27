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

## Intro to Proton Syntax

Proton's syntax essentially boils down to:

``` lua linenums="1"
local myInstance = new "Part" { --[[ properties ]] }
```

The `new` function creates an instance of the specified `ClassName` and applies the given Properties.

However, the Properties table has the capacity for numerous additional functionalities, i.e. to connect events and parent other instances. This significantly reduces the boilerplate code, making your code less verbose and more readable.

### Comparison of Proton and Vanilla Luau

#### Proton

``` lua linenums="1"
local SGui = new "ScreenGui" {
    ["Parent"] = LocalPlayer.PlayerGui,
    ["Child"] = new "TextButton" {
        ["Size"] = UDim2.new(0, 250, 0, 100),
        ["Text"] = "Mouse over me!",
        ["*MouseButton1Down"] = function(x, y)
            print("Mouse down at " .. x .. ", " .. y .. "...")
        end,
        ["*MouseButton1Up"] = function(x, y)
            print("...and up at " .. x .. ", " .. y .. "!")
        end
    }
}
```

#### Equivalent vanilla Luau code

``` lua linenums="1"
local SGui = Instance.new("ScreenGui")
SGui.Parent = LocalPlayer.PlayerGui

local TextButton = Instance.new("TextButton")
TextButton.Parent = SGui
TextButton.Size = UDim2.new(0, 250, 0, 100)
TextButton.Text = "Mouse over me!"

TextButton.MouseButton1Down:Connect(function(x, y)
	print("Mouse down at " .. x .. ", " .. y .. "...")
end)

TextButton.MouseButton1Up:Connect(function(x, y)
	print("...and up at " .. x .. ", " .. y .. "!")
end)
```

The two code snippets perform identical functions, but notice how the Proton code is significantly less wordy and much more readable the than vanilla Luau code.

## Syntax Documentation

On this introduction page you observed how Proton can be used to easily apply functions and parent instances.

You can learn more about Proton's syntax on [the syntax tutorial page](tutorials/syntax.md).

## Installation

Learn how to install Proton on [the installation guide](installation.md).