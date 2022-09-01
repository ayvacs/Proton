# `Connections`

The `Connections` Proton Property determines Events which are to be connected to the `Instance`.

```lua hl_lines="11 12 13 14 15"
local gui = new "ScreenGui" {
	Name = "proton_ui",
	Parent = game:GetService("Players").LocalPlayer.PlayerGui,

	Child = new "Frame" {
		Name = "A brand new Frame!",
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.5, 0, .5, 0),
		Size = UDim2.new(0, 400, 0, 100)

		Connections = {
			{"MouseEnter", function(self)
				print("Your mouse entered the frame!)
			end}
		}
	}
}
```

Events connected via `Connections` will pass `self` as the first function, and all other arguments will fall behind it.

```lua hl_lines="11 12 13 14 15"
local gui = new "ScreenGui" {
	Name = "proton_ui",
	Parent = game:GetService("Players").LocalPlayer.PlayerGui,

	Child = new "Frame" {
		Name = "A brand new Frame!",
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.5, 0, .5, 0),
		Size = UDim2.new(0, 400, 0, 100)

		Connections = {
			{"MouseEnter", function(self, x, y)
				print("Your mouse entered the frame'" .. self.Name .. "' at (" .. x .. ", " .. y .. ")!")
			end}
		}
	}
}

-- Your mouse entered the frame 'A brand new Frame!' at ({x}, {y})!
```