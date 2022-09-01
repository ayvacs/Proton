# `Proton.new`

`Proton.new`, or simply `new`, is the function which creates Proton UIs.

## Requiring

```lua hl_lines="2"
local Proton = require(game:GetService("ReplicatedStorage").Proton) -- or wherever else you installed Proton
local new = Proton.new
```

## Usage

### Creating a new `Instance`

```lua
local inst = new "ClassName" {}
```

### Creating a `ScreenGui` with properties

``` lua
local gui = new "ScreenGui" {
	Parent = game:GetService("Players").LocalPlayer.PlayerGui,
	Name = "proton_ui"
}
```