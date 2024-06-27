# Proton Syntax Guide

As you (probably) read on the [homepage](../index.md), Proton's syntax essentially boils down to the `new` function, which creates an instance of the specified `ClassName` and applies the given Properties.

``` lua linenums="1"
local myInstance = new "Part" { --[[ properties ]] }
```

However, the Properties table has the capacity for numerous additional functionalities, i.e. to connect events and parent other instances. This significantly reduces the boilerplate code, making your code less verbose and more readable.

## Import the `new` function

Once you [install Proton](../installation.md), import the `new` function as such:

```lua linenums="1"
local Proton = require( game:GetService("ReplicatedStorage").Proton ) -- replace this with the path to your Proton installation

local new = Proton.require("new")
```

!!! info "What is `Proton.require`?"

    The `Proton.require` function allows you to import Proton's modules. Note that it is separate from Roblox's global `require` function.