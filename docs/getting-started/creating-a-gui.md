# Creating a Proton UI

Proton runs on the client. To create a Proton UI, you'll need to `require` Proton first:

``` lua title="Requiring Proton"
local Proton = require(game:GetService("ReplicatedStorage").Proton) -- or wherever else you installed Proton
```

Proton UIs are created with the `Proton.new` function. However, we often refer to `Proton.new` as simply `new`, simply to make our code easier to read.

Proton UIs are created as such:

``` lua title="Creating a Proton UI with Proton.new"
local new = Proton.new

local gui = new "ScreenGui" {}
```

We've created a Proton UI! As with any ScreenGui, in order to make it visible to the client, it needs to be parented to the `PlayerGui`. We'll do this by adding a `Parent` to the property table. We'll also give it a name.

``` lua title="Adding entries to the property table"
local gui = new "ScreenGui" {
	Parent = game:GetService("Players").LocalPlayer.PlayerGui,
	Name = "proton_ui"
}
```

We can now create UI elements, such as `Frame` and `TextLabel`, to render content inside of our Proton UI.

## Proton Properties

Proton Properties are special properties that you can use to enhance Proton UIs.

There are several, but let's take a look at just two of them for now: `Child` and `Children`.

`Child` and `Children` are extremely simple: they create Instances and parent them to the specified Instance. `Child` will create only one instance, whereas `Children` will create an array of instances.

``` lua title="Adding one child, a Frame, to a ScreenGui"
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
```

``` lua title="Adding multiple children, a UIListLayout and two TextButtons, to a ScreenGui"
local gui = new "ScreenGui" {
	Name = "proton_ui",
	Parent = game:GetService("Players").LocalPlayer.PlayerGui,

	Children = {
		new "UIListLayout" {},
		new "TextButton" {
			Text = "This button will render on the left",
			LayoutOrder = 0
		},
		new "TextButton" {
			Text = "This button will render on the right",
			LayoutOrder = 1
		}
	}
}
```