# Special Properties

Special Properties are used when creating a function with `new()` and allow you to easily, nonverbosely add functionality to your instances.

## List

### Children

Parents given instance(s) to the new instance.

```lua
new "ClassName" { ["Children"] = { Instances } }
```

```lua
new "ScreenGui" {
    ["Children"] = { ExistingInstance, new("Frame"){}}
}
```

### Connections

Applies connection(s) to the new instance.

```lua
new "ClassName" { ["Connections"] = { {ConnectionName, Function}, ... } }
```

```lua
new "TextButton" {
    ["Connections"] = {
        { "MouseButton1Click", (function() print("Left mouse button clicked") end) },
        { "MouseButton1Click", (function() print("This function runs at the same time as the above one") end) },
        { "MouseButton2Down", (function() print("Right mouse button down") end) }
    }
}
```