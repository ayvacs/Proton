# Proton Events

When creating an Instance with `Proton.new()` you can easily connect an event by simply including the event's name in the Properties table, appended with an asterisk (*).

``` lua linenums="1"
new "ClassName" {
    ["*EventName"] = function()
        -- Event code goes here!
    end
}
```

Here's a real-world example:

``` lua linenums="1"
new "TextButton" {
    ["*MouseButton1Down"] = function(x, y)
        print("Mouse down at " .. x .. ", " .. y .. "!")
    end
}
```

You can alternatively connect multiple functions to a single event by using the "Events" special property.

``` lua linenums="1"
new "TextButton" {
    ["*MouseButton1Click"] = (function()
        print("Left mouse button clicked (event 1)")
    end),
    
    ["Events"] = {
        { "MouseButton1Click", function()
            print("Left mouse button clicked (event 2)")
        end },
        { "MouseButton2Down", function(x, y)
            print("Right mouse button down at " .. x .. ", " .. y .. " (event 3)")
        end },
        { "MouseButton2Down", function(x, y)
            print("Right mouse button down at " .. x .. ", " .. y .. " (event 4)")
        end }
    }
}
```