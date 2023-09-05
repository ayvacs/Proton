# Connect event to instance

When creating a new instance with `new()` you can easily connect an event to it by simply adding it to the property table, appended with an asterisk, like such:

``` lua linenums="1"
new "ClassName" {
    ["*EventName"] = func
}
```

``` lua linenums="1"
new "TextButton" {
    ["*MouseButton1Click"] = (function()
        print("Left mouse button clicked")
    end)
}
```

Arguments will still function as usual:

``` lua linenums="1"
new "Part" {
    ["*Touched"] = (function(object)
        print("Part was touched by", object:GetFullName())
    end)
}
```

If you want to connect multiple functions to a single event, use the "Events" Special Property instead.

``` lua linenums="1"
new "TextButton" {
    ["Name"] = "My Text Button",
    ["Parent"] = ScreenGui,

    ["*MouseButton1Click"] = (function()
        print("Left mouse button clicked")
    end),
    
    ["Events"] = {
        { "MouseButton1Click", (function()
            print("Left mouse button clicked")
        end) },
        { "MouseButton2Down", (function()
            print("Right mouse button down")
        end) }
    }
}
```