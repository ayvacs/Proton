# Apply connection to new instance

When creating a new instance with `new()` you can easily apply a connection to it by simply adding it to the property table, appended with an asterisk, like such:

```lua
new "ClassName" {
    ["*ConnectionName"] = func
}
```

```lua
new "TextButton" {
    ["*MouseButton1Click"] = (function() (print("Left mouse button clicked")) end)
}
```

You can of course add the "Connections" Special Property, and normal properties, at the same time:

```lua
new "TextButton" {
    ["Name"] = "My Text Button",
    ["Parent"] = ScreenGui,

    ["*MouseButton1Click"] = (function() print("Left mouse button clicked") end)
    
    ["Connections"] = {
        { "MouseButton1Click", (function() print("Left mouse button clicked") end) },
        { "MouseButton2Down", (function() print("Right mouse button down") end) }
    }
}
```

With this method you cannot apply multiple connections of the same name to an instance. Instead, you can use the "Connections" Special Property.