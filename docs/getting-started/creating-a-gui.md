# Creating a GUI with Proton

Proton GUIs are client-sided, meaning they must be created in `LocalScript`s.

To create a GUI, you'll need to `require` Proton first:

``` lua title="Requiring Proton"
local Proton = require(game:GetService("ReplicatedStorage").Proton) -- or wherever else you installed Proton
```

GUIs are created with the `Proton.new` function. However, we often refer to `Proton.new` as simply `new`, simply to make our code easier to read.

GUIs are created as such:

``` lua title="Creating a GUI with Proton.new"
local new = Proton.new

local gui = new "ScreenGui" {}
```

Let's break down the code we just ran:

1. `new`, or `Proton.new`, is the Proton function which creates new instances.
2. `"ScreenGui"` means that we will be creating a `ScreenGui` instance. You can substitute this with any Class name, such as `Frame`, `TextLabel`, or even non-UI elements.
3. `{}` is the property table.

To create a GUI that the player can see, we have to add properties to it. We can do this simply by adding entries to the property table.

``` lua title="The property table"
local gui = new "ScreenGui" {
	Name = "This is my ScreenGui",
	Parent = game:GetService("Players").LocalPlayer.PlayerGui
}
```

Great! We've created a GUI named `"This is my ScreenGui"` and we can now parent UI elements to it, such as `Frame`s and `TextLabel`s, to render content.

## Proton Properties

Proton Properties are special properties that you can use to enhance your code.

There are multiple Proton Properties that you may use in your code, but let's take a look at just two of them for now: `Child` and `Children`.

`Child` and `Children` are extremely simple: they create Instances and parent them to the specified Instance. The difference between the two is that `Child` will create only one child, whereas `Children` will create an entire array of children.

``` lua title="Adding one child, a Frame, to a ScreenGui"
local gui = new "ScreenGui" {
	Name = "This is my ScreenGui",
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
	Name = "This is my ScreenGui",
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