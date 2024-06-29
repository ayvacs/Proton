# Value Observers

Observers allow you to detect when [values](values.md) are updated. They receive the new value and the previous value as parameters. A value can have any number of parameters.

``` lua linenums="1"
local value = Proton.require("value")
local observer = Proton.require("observer")


local health = value.new(100, "number", "Health")

observer.new(health, function(newHealth, previousHealth)
	
	if newHealth < previousHealth then
		print("Ow! I took " .. (previousHealth - newHealth) .. " damage!")
	else
		print("I was healed by " .. (newHealth - previousHealth) .. " points!")
    end
	
end)

health:increment(-10)   -- Ow! I took 10 damage!
health:increment(5)     -- I was healed by 5 points!
health:increment(0)
```

Observers will only work when the value is changed to a new, unique value. This means that, in both of the following code snippets, the observer will never function.

``` lua
local name = value.new("John")
name:set("John")
```

``` lua
local age = value.new(20, "number")
age:increment(0)
```

## Disconnecting Observers

Observers can be disconnected by calling `:disconnect()`.

``` lua linenums="1"
local name = value.new("John")
local obs = observer.new(name, function(newName, previousName)
    print("My name changed to " .. newName .. "!")
end)

name:set("Jonas")   -- My name changed to Jonas!

obs:disconnect()

name:set("John")
print(name:get())   -- John

-- The value of "name" was still set to "John", but since the observer has been disconnected, it won't be printed.
```