# `Children`

The `Children` Proton Property determines the hierarchical children of the `Instance`.

Input one array of objects. When the `Instance` is created, each of the objects in that array will be parented to the `Instance`, if they aren't already.

```lua hl_lines="15"
local ch1 = new "UIListLayout" {}
local ch2 = new "TextButton" {
	Text = "This button will render on the left",
	LayoutOrder = 0
}
local ch3 = new "TextButton" {
	Text = "This button will render on the right",
	LayoutOrder = 1
}

local gui = new "ScreenGui" {
    Name = "proton_ui",
    Parent = game:GetService("Players").LocalPlayer.PlayerGui,

    Children = { ch1, ch2, ch3 }
}
```

```lua hl_lines="5 6 7 8 9 10 11 12 13 14 15"
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

`Children` is similar to [`Child`](../child), and the two may be used in conjunction.