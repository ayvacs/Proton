# Creating a Proton UI

Now that Proton is installed and running, let's learn how to use it to create instances from a script.

## Creating an instance

In Proton, UI instances are all created from code. While that might sound counterproductive, it allows you to easily reuse your UI components and utilize powerful tools to connect your UI to your game scripts - more on that later.

Proton utilizes an alternative to `Instance.new` which lets you not only create instances but utilize custom tools to enhance them. It's called `new`. We'll compare it to `Instance.new` here, so you can see the difference for yourself.

### The old way

This is what a typical UI creation script looks like. While it functions, it looks messy and needs a variable to store each element.

```lua title="Using Instance.new"
local gui = Instance.new("ScreenGui")
gui.Name = "My ScreenGui"
gui.Parent = game:GetService("Players").LocalPlayer.PlayerGui

local uill = Instance.new("UIListLayout")
uill.Parent = gui

local btn1 = Instance.new("TextButton")
btn1.Parent = gui
btn1.Text = "This button will render on the left"
btn1.LayoutOrder = 0

local btn2 = Instance.new("TextButton")
btn2.Parent = gui
btn2.Text = "This button will render on the right",
btn2.LayoutOrder = 1
```

### The Proton way

Here's what a Proton UI looks like. Notice how it's also created with code, just like `Instance.new`, but it uses a much different syntax to improve your coding experience and your code's flexability.

```lua title="Using new"
local new = Proton.new

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

Using `new`, our code functions the same but looks a lot cleaner. And since a variable isn't needed for each element, updating the UI later down the road will be a lot easier.

In the above code snippet, `new`

- creates a `ScreenGui` named `"proton_ui"`
- parents it to the `PlayerGui`
- creates three children, and parents them each to the `ScreenGui`
- returns the `ScreenGui` so that it may be stored in the `gui` variable

The `new` function has many more useful features built in, but for now we'll simply be using it to set properties.

---

You've learned how to create instances with Proton!

As you might've noticed in the above code, we used the `Children` property, which isn't available in vanilla Roblox. Continue to the next tutorial, [Proton Properties](../proton-properties), to learn more about it.