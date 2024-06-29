# Value Observers

Observers allow you to detect when [values](values.md) are updated. They receive the new value and the previous value as parameters. A value can have any number of parameters.

``` lua linenums="1"
local value = Proton.require("value")
local observer = Proton.require("observer")


local health = value.new(100, "number", "Health")

observer.new(health, function(newHealth, previousHealth)
	
	if newHealth < previousHealth then
		print("Ow! I took " .. (previousHealth - newHealth) .. " damage!")
	elseif newHealth > previousHealth then
		print("I was healed by " .. (newHealth - previousHealth) .. " points!")
	else
		print("My health value was updated, but I didn't heal or take damage.")
	end
	
end)

health:increment(-10)   -- Ow! I took 10 damage!
health:increment(5)     -- I was healed by 5 points!
health:increment(0)     -- My health value was updated, but I didn't heal or take damage.
```

## Disconnecting Observers

Observers can be disconnected by calling `:disconnect()`.

``` lua linenums="1"
local name = value.new("John")
local obs = observer.new(name, function(newName, previousName)
	if newName ~= previousName then
		print("My name changed to " .. newName .. "!")
	end
end)

name:set("Jonas")   -- My name changed to Jonas!

obs:disconnect()

name:set("John")
print(name:get())   -- John

-- The value of "name" was still set to "John", but since the observer has been disconnected, it won't be printed.
```