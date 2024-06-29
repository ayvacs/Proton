# Proton Values

A Value object is a sort of storage container for a variable. Values allow you to restrict types and lock the value from being changed.

Values are created using the `value.new()` function. Values are read with the `:get()` method and updated with the `:set()` method.

``` lua linenums="1"
local value = Proton.require("value")

local myValue = value.new("foo")
print(myValue:get())    -- foo

myValue:set("bar")
print(myValue:get())    -- bar
```

## Increment

Number values can be incremented by calling `:increment()`.

``` lua linenums="1"
local health = value.new(100)

health:increment(-10)
print(health:get())     -- 90
```

This will not work for non-number values, instead printing a warning without ending the thread.

``` lua linenums="1"
local name = value.new("John")

name:increment(" Smith")    -- [Proton] Could not increment this value! (" Smith" is not of type number)
print(name:get())           -- John
```

## Type restriction

You can optionally restrict the type by passing the type name as the second parameter.

``` lua linenums="1"
local aStringValue = value.new("foo", "string")

aStringValue:set("bar")
print(aStringValue:get())   -- bar

aStringValue:set(1337)      -- [Proton] Could not set this value! ("1337" is not of type string)
print(aStringValue:get())   -- bar
```

As you can see in the above example, attempting to set a restricted type to a value of a different type will print a warning without ending the thread.

!!! info "Valid type names"

    The type name should be the result of the `typeof()` function. For instance, since `typeof(15)` returns `number`, the type name is also "number".

## Locking

You can lock a value (disable the value from being updated by any script) by calling `:lock()`. You can unlock it with `:unlock()`.

``` lua linenums="1"
local myValue = value.new("foo")

print(myValue:get())    -- foo

myValue:lock()

myValue:set("bar")      -- [Proton] This value is locked!
print(myValue:get())    -- foo

myValue:unlock()

myValue:set("bar")
print(myValue:get())    -- bar
```

Attempting to update a locked value will print a warning without ending the thread.

## Naming

You can opt to give a value a name by including the name as the third parameter to `value.new()`. This will help you identify values in error messages, aiding you track down the root cause of potential errors. This has no effect outside of error logging.

``` lua linenums="1"
local health = value.new(100, "number", "Health")

health:lock()
health:set(90)      -- [Proton] Health is locked!

health:unlock()
health:set("bar")   -- [Proton] Could not set the value of Health! ("bar" is not of type number)
```