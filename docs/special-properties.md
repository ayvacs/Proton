# Special Properties

Special Properties are used when creating a function with `new()` and allow you to easily, nonverbosely add functionality to your instances.

## List

### Children

Parents given instance(s) to the new instance.

``` lua linenums="1"
new "ClassName" {
    ["Children"] = { Instances }
}
```

``` lua linenums="1"
new "ScreenGui" {
    ["Children"] = {
        ExistingInstance,
        new("Frame"){}
    }
}
```

### Events

Connects events to the new instance.

``` lua linenums="1"
new "ClassName" {
    ["Events"] = {
        {EventName, Function},
        ... 
    }
}
```

``` lua linenums="1"
new "TextButton" {
    ["Events"] = {
        { "MouseButton1Click", (function() print("Left mouse button clicked") end) },
        { "MouseButton1Click", (function() print("This function runs at the same time as the above one") end) },
        { "MouseButton2Down", (function() print("Right mouse button down") end) }
    }
}
```