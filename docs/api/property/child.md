# `Child`

The `Child` Proton Property determines the hierarchical child of the `Instance`.

Input one object. When the `Instance` is created, the object will be parented to the `Instance`, if it isn't already.

```lua
local frame = new "Frame" {
		Name = "A brand new Frame!",
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.5, 0, .5, 0),
		Size = UDim2.new(0, 400, 0, 100)
}

local gui = new "ScreenGui" {
	Name = "proton_ui",
	Parent = game:GetService("Players").LocalPlayer.PlayerGui,

	Child = frame
}

print(frame.Parent == gui)
-- true
```

```lua
local gui = new "ScreenGui" {
	Name = "proton_ui",
	Parent = game:GetService("Players").LocalPlayer.PlayerGui,

	Child = new "Frame" {
		Name = "A brand new Frame!",
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.5, 0, .5, 0),
		Size = UDim2.new(0, 400, 0, 100)
	}
}

print(gui:FindFirstChild("A brand new Frame!").AnchorPoint)
-- { 0.5, 0.5 }
```

`Child` is similar to [`Children`](../children), and the two may be used in conjunction.